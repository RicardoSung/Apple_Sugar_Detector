import tensorflow as tf
import numpy as np
from data import data_prepare
from tensorflow.keras import layers, models

class Net(object):
    def __init__(self):
        model = models.Sequential()
        model.add(layers.Conv2D(
            64, (9, 9), activation='relu', input_shape=(64, 57, 1)))
        model.add(layers.MaxPooling2D((2, 2)))
        model.add(layers.Conv2D(128, (7, 7), activation='relu'))
        model.add(layers.MaxPooling2D((2, 2)))
        model.add(layers.Conv2D(256, (5, 5), activation='relu'))
        model.add(layers.MaxPooling2D((2, 2)))
        model.add(layers.Flatten())
        model.add(layers.Dense(1, activation='relu'))

        model.summary()

        self.model = model


class DataSource(object):
    def __init__(self):
        # Prepare data.
        (x_train, y_train) = data_prepare(pre_load=1)
        # Convert to float32.
        x_train = np.array(x_train, np.float32)
        y_train = np.array(y_train, np.float32)
        # Normalize images value from [0, 4095] to [0, 1].
        x_train = x_train.reshape((x_train.shape[0], 64, 57)) / 4095.
        x_train = x_train[:, :, :, np.newaxis]

        self.train_spectra, self.train_brix = x_train, y_train


class Train:
    def __init__(self):
        self.cnn = Net()
        self.data = DataSource()

    def train(self):
        check_path = './ckpt/cp-{epoch:04d}.ckpt'

        save_model_cb = tf.keras.callbacks.ModelCheckpoint(
            check_path, verbose=1)

        self.cnn.model.compile(optimizer='adam',
                               loss='mean_squared_error')
        self.cnn.model.fit(self.data.train_spectra, self.data.train_brix,
                           epochs=500, batch_size=1, callbacks=[save_model_cb])

    def test(self):
        self.cnn.model.load_weights('./ckpt/cp-0320.ckpt')
        pred = self.cnn.model.predict(self.data.train_spectra)
        np.save('pred', pred)



if __name__ == "__main__":
    app = Train()
    # app.train()
    app.test()
