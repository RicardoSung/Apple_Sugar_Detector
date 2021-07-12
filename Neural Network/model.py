import torch
import torch.nn as nn
import math

# -------------Initialization----------------------------------------
def init_weights(*modules):
    for module in modules:
        for m in module.modules():
            if isinstance(m, nn.Conv2d):   ## initialization for Conv2d
                nn.init.kaiming_normal_(m.weight, mode='fan_in', nonlinearity='relu')  # method 2: initialization
                if m.bias is not None:
                    nn.init.constant_(m.bias, 0.0)
            elif isinstance(m, nn.BatchNorm2d):   ## initialization for BN
                nn.init.constant_(m.weight, 1.0)
                nn.init.constant_(m.bias, 0.0)
            elif isinstance(m, nn.Linear):     ## initialization for nn.Linear
                nn.init.kaiming_normal_(m.weight, mode='fan_in', nonlinearity='relu')
                if m.bias is not None:
                    nn.init.constant_(m.bias, 0.0)


class ACW(nn.Module):
    def __init__(self):
        super(ACW, self).__init__()

        conv_channel = 64
        orig_channel = 3

        self.ad_conv_module = nn.Sequential(nn.Conv2d(in_channels=orig_channel, out_channels=conv_channel, kernel_size=1, stride=1, padding=1,
                               bias=True), nn.ReLU(), nn.Conv2d(in_channels=conv_channel, out_channels=conv_channel, kernel_size=1, stride=1, padding=1,
                               bias=True), nn.ReLU(), nn.Conv2d(in_channels=conv_channel, out_channels=orig_channel, kernel_size=1, stride=1, padding=1,
                               bias=True))

        self.relu = nn.ReLU(inplace=True)
        self.sigmoid = nn.Sigmoid()

        init_weights(self.ad_conv_module)

    def forward(self, img):

        similarity_index = 1 # init index
        threshold = 0.5
        conv_cnt = 1

        feature = self.ad_conv_module(img)
        similarity_criteria = nn.L1Loss

        while similarity_index > threshold:
            feature = self.ad_conv_module(feature)
            similarity_index = self.sigmoid(similarity_criteria(feature, img))
            conv_cnt = conv_cnt + 1
            if conv_cnt > 5:
                break

        output = img + feature

        return output


# ----------------- End-Main-Part ------------------------------------
def variance_scaling_initializer(tensor):
    from scipy.stats import truncnorm

    def truncated_normal_(tensor, mean=0, std=1):
        with torch.no_grad():
            size = tensor.shape
            tmp = tensor.new_empty(size + (4,)).normal_()
            valid = (tmp < 2) & (tmp > -2)
            ind = valid.max(-1, keepdim=True)[1]
            tensor.data.copy_(tmp.gather(-1, ind).squeeze(-1))
            tensor.data.mul_(std).add_(mean)
            return tensor

    def variance_scaling(x, scale=1.0, mode="fan_in", distribution="truncated_normal", seed=None):
        fan_in, fan_out = torch.nn.init._calculate_fan_in_and_fan_out(x)
        if mode == "fan_in":
            scale /= max(1., fan_in)
        elif mode == "fan_out":
            scale /= max(1., fan_out)
        else:
            scale /= max(1., (fan_in + fan_out) / 2.)
        if distribution == "normal" or distribution == "truncated_normal":
            # constant taken from scipy.stats.truncnorm.std(a=-2, b=2, loc=0., scale=1.)
            stddev = math.sqrt(scale) / .87962566103423978
        # print(fan_in,fan_out,scale,stddev)#100,100,0.01,0.1136
        truncated_normal_(x, 0.0, stddev)
        return x/10*1.28

    variance_scaling(tensor)

    return tensor


def summaries(model, writer=None, grad=False):
    if grad:
        from torchsummary import summary
        summary(model, input_size=[(3, 64, 64)], batch_size=1)
    else:
        for name, param in model.named_parameters():
            if param.requires_grad:
                print(name)

    if writer is not None:
        x = torch.randn(1, 64, 64, 64)
        writer.add_graph(model,(x,))
