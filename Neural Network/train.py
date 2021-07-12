import os
import torch
import torch.backends.cudnn as cudnn
import torch.nn as nn
import torch.optim as optim
from torch.autograd import Variable
from torch.utils.data import DataLoader
from data import DIV2K_Dataset
from model import ACW, summaries
import numpy as np

import shutil
from torch.utils.tensorboard import SummaryWriter

os.environ['CUDA_VISIBLE_DEVICES'] = '0'

###################################################################
# ------------------- Pre-Define Part----------------------
###################################################################
# ================== Pre-Define =================== #
SEED = 10
np.random.seed(SEED)
torch.manual_seed(SEED)
torch.cuda.manual_seed(SEED)
torch.cuda.manual_seed_all(SEED)
# cudnn.benchmark = True  ###自动寻找最优算法
cudnn.deterministic = True

# ============= 2) HYPER PARAMS(Pre-Defined) ==========#
lr = 5e-5
epochs = 250
ckpt = 50
batch_size = 64
model_path = "Weights/.pth"

# ============= 3) Load Model + Loss + Optimizer + Learn_rate_update ==========#
model = ACW().cuda()
if os.path.isfile(model_path):
    model.load_state_dict(torch.load(model_path))  ## Load the pretrained Encoder
    print('ACW is Successfully Loaded from %s' % (model_path))

# summaries(model, grad=True)  ## Summary the Network
criterion = nn.MSELoss(size_average=True).cuda()

optimizer = optim.Adam(model.parameters(), lr=lr, weight_decay=1e-4)  # optimizer 1
lr_scheduler = torch.optim.lr_scheduler.MultiStepLR(optimizer, [50, 100, 150, 200], gamma=0.5)
# lr_scheduler = torch.optim.lr_scheduler.ExponentialLR(optimizer=optimizer, gamma=0.1)

# optimizer = optim.SGD(model.parameters(), lr=lr, momentum=0.9, weight_decay=1e-7)  ## optimizer 2: SGD
# lr_scheduler = torch.optim.lr_scheduler.StepLR(optimizer=optimizer, step_size=180, gamma=0.1)  # learning-rate update: lr = lr* 1/gamma for each step_size = 180

# ============= 4) Tensorboard_show + Save_model ==========#
# if os.path.exists('train_logs'):  # for tensorboard: copy dir of train_logs  ## Tensorboard_show: case 1
#     shutil.rmtree('train_logs')  # ---> console (see tensorboard): tensorboard --logdir = dir of train_logs

writer = SummaryWriter('./train_logs')  ## Tensorboard_show: case 2


def save_checkpoint(model, epoch):  # save model function
    model_out_path = 'Weights' + '/' + "{}.pth".format(epoch)
    torch.save(model.state_dict(), model_out_path)


###################################################################
# ------------------- Main Train (Run second)----------------------------------
###################################################################
def train(training_data_loader, validate_data_loader, start_epoch=0):
    print('Start training...')

    for epoch in range(start_epoch, epochs, 1):

        epoch += 1
        epoch_train_loss, epoch_val_loss = [], []

        # ============Epoch Train=============== #
        model.train()

        for iteration, batch in enumerate(training_data_loader, 1):
            LR, HR = batch[0].cuda(), batch[1].cuda()

            optimizer.zero_grad()  # fixed

            SR = model(LR)  # call model

            loss = criterion(SR, HR)  # compute loss
            epoch_train_loss.append(loss.item())  # save all losses into a vector for one epoch

            loss.backward()  # fixed
            optimizer.step()  # fixed

            # for name, layer in model.named_parameters():
            # writer.add_histogram('torch/'+name + '_grad_weight_decay', layer.grad, epoch*iteration)
            # writer.add_histogram('net/'+name + '_data_weight_decay', layer, epoch*iteration)

        lr_scheduler.step()  # if update_lr, activate here!

        t_loss = np.nanmean(np.array(epoch_train_loss))  # compute the mean value of all losses, as one epoch loss
        writer.add_scalar('mse_loss/t_loss', t_loss, epoch)  # write to tensorboard to check
        print('Epoch: {}/{} training loss: {:.7f}'.format(epochs, epoch, t_loss))  # print loss for each epoch

        if epoch % ckpt == 0:  # if each ckpt epochs, then start to save model
            save_checkpoint(model, epoch)

        # ============Epoch Validate=============== #
        model.eval()
        with torch.no_grad():
            for iteration, batch in enumerate(validate_data_loader, 1):
                LR, HR = batch[0].cuda(), batch[1].cuda()

                SR = model(LR)  # call model

                loss = criterion(SR, HR)  # compute loss
                epoch_val_loss.append(loss.item())

            v_loss = np.nanmean(np.array(epoch_val_loss))
            writer.add_scalar('val/v_loss', v_loss, epoch)
            print('Epoch: {}/{} validate loss: {:.7f}'.format(epochs, epoch, v_loss))  # print loss for each epoch

    writer.close()  # close tensorboard


###################################################################
# ------------------- Main Function (Run first) -------------------
###################################################################
if __name__ == "__main__":
    num_workers = 16
    tr_bsize = 64
    te_bsize = 16

    train_set = DIV2K_Dataset('C:/Users/j8734/Desktop/git sync/self_adaptive_window/DIV2K/DIV2K_train_LR_unknown', 'C:/Users/j8734/Desktop/git sync/self_adaptive_window/DIV2K/DIV2K_train_HR', 2)  # creat data for training
    training_data_loader = DataLoader(dataset=train_set, num_workers=num_workers, batch_size=tr_bsize, shuffle=True,
                                      pin_memory=True, drop_last=True)  # put training data to DataLoader for batches

    validate_set = DIV2K_Dataset('C:/Users/j8734/Desktop/git sync/self_adaptive_window/DIV2K/DIV2K_train_LR_bicubic', 'C:/Users/j8734/Desktop/git sync/self_adaptive_window/DIV2K/DIV2K_train_HR', 2)  # creat data for validation
    validate_data_loader = DataLoader(dataset=validate_set, num_workers=num_workers, batch_size=te_bsize, shuffle=False,
                                      pin_memory=True, drop_last=True)  # put training data to DataLoader for batches

    train(training_data_loader, validate_data_loader)  # call train function (call: Line 53)
