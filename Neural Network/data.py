import torch.utils.data as data
import utils_data
import cv2


class DIV2K_Dataset(data.Dataset):
    def __init__(self, LR_file_path, HR_file_path, scale):
        super(DIV2K_Dataset, self).__init__()

        self.HR_data_names = utils_data.file_gather(HR_file_path)
        self.LR_data_names = utils_data.file_gather(LR_file_path, scale)

    def __getitem__(self, index):
        return (cv2.imread(self.HR_data_names[index]), cv2.imread(self.LR_data_names[index]))

    def __len__(self):
        return len(self.HR_data_names)
