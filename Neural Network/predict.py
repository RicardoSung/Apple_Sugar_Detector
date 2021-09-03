import tensorflow as tf
import numpy as np
from utils_data import file_gather
from train import Net
import random



class Predict(object):
    def __init__(self):
        self.cnn = Net()
        # 恢复网络权重
        self.load = tf.keras.models.load_model('/home/peter/Documents/Programs/Apple/ckpt/cp-0999.ckpt')

    def predict(self, spectra):
        spectra = np.array(spectra, dtype=np.float32)
        x = np.reshape(spectra, (1, 64, 57, 1)) / 4095.

        y = self.cnn.model.predict(x)

        print('Predict result is: ' + str(y))


if __name__ == "__main__":
    app = Predict()
    file_idx = random.randint(0, 30)
    spectra_file_name = sorted(file_gather(
        '/home/peter/Documents/Programs/Apple/data/spectra'))
    brix_file_name = sorted(file_gather(
        '/home/peter/Documents/Programs/Apple/data/brix'))
    spectra = open(spectra_file_name[file_idx])
    line = spectra.read().splitlines()
    spectra_data = []
    for data in line:
        spectra_data.append(data)
    spectra.close()
    app.predict(spectra_data)

