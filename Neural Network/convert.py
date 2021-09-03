import tensorflow as tf

model_path = "./ckpt/cp-0320.ckpt/"
convert = tf.lite.TFLiteConverter.from_saved_model(model_path)
tflite_model = convert.convert()
open("/home/peter/Documents/Programs/Apple/" + "convert_model.tflite", "wb").write(tflite_model)
print("finish!")
