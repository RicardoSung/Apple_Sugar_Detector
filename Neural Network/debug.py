import numpy as np
import matplotlib.pyplot as plt
from utils_data import file_gather

spectra_file_name = sorted(file_gather(
           '/home/peter/Documents/Programs/Apple/data'))

z = np.load('pred.npy')
print(z)


 

