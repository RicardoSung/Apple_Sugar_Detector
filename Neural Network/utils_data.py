import os


def file_gather(path, scale=0):
    if scale == 0:
        files = os.listdir(path)
        file_name = []
        for file in files:
            file_name.append(str(path) + '/' + file)
    else:
        files = os.listdir(str(path) + '/X' + str(scale))
        file_name = []
        for file in files:
            file_name.append(str(path) + '/' + file)

    return file_name
