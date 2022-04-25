import glob
from sklearn.model_selection import KFold

# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
ko_dir = "/home/johny/Documents/UFU/doutorado/material_zanchetta/imagens/KO_NT"
wt_dir = "/home/johny/Documents/UFU/doutorado/material_zanchetta/imagens/WT_NT"


def list_files(dir):
    print(glob.glob(dir + "/*.tif"))


def kfold(path_files_array, size):
    kf = KFold(n_splits=size)

    for train_index, test_index in kf.split(path_files_array):
        print(train_index, test_index)


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    kfold(glob.glob(ko_dir + "/*.tif"), 10)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
