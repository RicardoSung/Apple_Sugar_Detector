import os
import numpy as np


def file_gather(path):
    
    files = os.listdir(path)
    file_name = []
    for file in files:
        file_name.append(str(path) + '/' + file)

    return file_name