import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import caffe
import os
import PIL
import timeit


alexnet_root = "../../caffe/models/bvlc_alexnet/"
caffe_root = "../../home/rob/caffe/"

directory = "../jpeg/outputImg/"
original_img = pd.read_csv('../result.csv', sep=',')
jpeg_img = pd.DataFrame(columns =  ['File_Name', 'rank', 'Rank_Diff', 'Time'])


original_ext = ".JPEG"


# Set the right path to your model definition file, pretrained model weights,
# and the image you would like to classify.
MODEL_FILE = alexnet_root + 'deploy.prototxt'
PRETRAINED = alexnet_root + 'bvlc_alexnet.caffemodel'



caffe.set_mode_cpu()
net = caffe.Classifier(MODEL_FILE, PRETRAINED,
                       mean=np.load('../../caffe/python/caffe/imagenet/ilsvrc_2012_mean.npy').mean(1).mean(1),
                       channel_swap=(2,1,0),
                       raw_scale=255,)
                       


c = 0
for entry in os.scandir(directory):
    if entry.is_file():
        IMAGE_FILE = entry.path
    if c == 10:
        break

    image_name = entry.name[0 : 23] + original_ext
    
    start = timeit.default_timer()
    input_image = caffe.io.load_image(IMAGE_FILE)
    prediction = net.predict([input_image])  # predict takes any number of images, and formats them for the Caffe net automatically
    stop = timeit.default_timer()
    
    time = stop - start

    top_inds = prediction[0].argsort()[::-1][:len(prediction[0])]
    #print(top_inds[0])

    index = original_img.index[original_img["File_Name"] == image_name].tolist()
    truth_label = original_img["Truth_Label_Number"][index[0]]
    label_rank = np.where(top_inds == truth_label)
    label_rank = label_rank[0][0]

    original_rank = original_img["Truth_Label_Rank"][index[0]]
    rank_diff = original_rank - label_rank

    
    jpeg_img.loc[c] =  [entry.name] + [label_rank] + [rank_diff] + [time]

    print(c)
    c+=1

jpeg_img.to_csv("../jpegYcbr.csv")