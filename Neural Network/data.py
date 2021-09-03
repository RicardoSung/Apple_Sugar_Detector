import utils_data
import numpy as np


# Data Preparation
def data_prepare(save=0, pre_load=0):
    if pre_load == 1:
        spectra_data = np.load('./spectra.npy')
        brix_data = np.load('./brix.npy')

    else:
        file_idx = 0
        data_len = 3648
        spectra_file_name = sorted(utils_data.file_gather(
            '/home/peter/Documents/Programs/Apple/data/uncategorized'))

        spectra_data = np.zeros(
            (len(spectra_file_name), data_len))
        brix_data = np.zeros(len(spectra_file_name))

        for i in range(len(spectra_file_name)):
            f = open(spectra_file_name[file_idx])
            line = f.readlines()
            line = str(line).replace("['","")
            line = line.replace("\\n", "")
            line = line.replace(",","")
            line = line.replace("']","")
            line = line.replace("'","")
            line = line.split(" ")
            idx = 0
            for data in line:
                spectra_data[i, idx] = data
                idx = idx + 1
                if idx == 3648:
                    break
            f.close()
            file_idx = file_idx + 1

        idx = 0
        for name in spectra_file_name:
            line = name
            line = line.replace('/home/peter/Documents/Programs/Apple/data/uncategorized/',"")
            line = line.replace('.txt',"")
            line = float(line) / 100
            brix_data[idx] = line
            idx = idx + 1


    if save == 1:
        np.save('spectra', spectra_data)
        np.save('brix', brix_data)

    return spectra_data, brix_data


if __name__ == "__main__":
    brix_data, spectra_data = data_prepare(save=1)
    print('read ' + str(spectra_data.shape[0]) + ' data')
