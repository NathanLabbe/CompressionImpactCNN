import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import caffe
import os
import PIL


alexnet_root = "/home/rob/caffe/models/bvlc_alexnet/"
caffe_root = "/home/rob/caffe/"

img_pre = "ILSVRC2012_val_"
img_post = ".JPEG"

directory = "../inputImg/"
original_img = pd.read_csv('../Original_Img.csv', sep=';')


# Set the right path to your model definition file, pretrained model weights,
# and the image you would like to classify.
MODEL_FILE = alexnet_root + 'deploy.prototxt'
PRETRAINED = alexnet_root + 'bvlc_alexnet.caffemodel'



caffe.set_mode_cpu()
net = caffe.Classifier(MODEL_FILE, PRETRAINED,
                       mean=np.load('/home/rob/caffe/python/caffe/imagenet/ilsvrc_2012_mean.npy').mean(1).mean(1),
                       channel_swap=(2,1,0),
                       raw_scale=255,)


for entry in os.scandir(directory):
    if (entry.path.endswith(".JPEG") and entry.is_file()):
        IMAGE_FILE = entry.path

    image_name = entry.name
    
    input_image = caffe.io.load_image(IMAGE_FILE)
    prediction = net.predict([input_image])  # predict takes any number of images, and formats them for the Caffe net automatically

    top_inds = prediction[0].argsort()[::-1][:len(prediction[0])]
    #print(top_inds[0])

    index = original_img.index[original_img["File_Name"] == image_name].tolist()
    truth_label = original_img["Truth_Label_Number"][index[0]]
    label_rank = np.where(top_inds == truth_label)
    label_rank = label_rank[0][0]
    print("label rank: ", label_rank)
    original_img["Truth_Label_Rank"][index[0]] = label_rank

original_img.to_csv("../result.csv")

"""
    print ('prediction shape:', prediction[0].shape)
    #plt.plot(prediction[0])
    print ('predicted class:', prediction[0].argmax())
    #plt.show()
    # load ImageNet labels
    labels_file = caffe_root + 'data/ilsvrc12/synset_words.txt'

    labels = np.loadtxt(labels_file, str, delimiter='\t')


print ('output label:', labels[prediction[0].argmax()])
#print ('output label:', index(labels[prediction[0].argmax()]))

# sort top five predictions from softmax output

top_inds = prediction[0].argsort()[::-1][:len(prediction[0])]  # reverse sort and take five largest items
print(top_inds.index())

print ('probabilities and labels:')
print(prediction[0][top_inds], labels[top_inds])


"""