# Impact of Image Compression on Classification Performance and Computer Resources in Deep Learning Image Recognition

The complete paper can be found here : [Impact of Image Compression on Classification Performance and Computer Resources in Deep Learning Image Recognition](https://github.com/NathanLabbe/CompressionImpactCNN/blob/main/Final_Report_Nathan_Labbe_Robinson_de_Gelis.pdf)

### Abstract 
In this report, we will first study the Portable Network Graphic (PNG) format and its differences from
the Joint Photographic Experts Group (JPEG), JPEG2000 (an evolution of the latter), and Better Portable
Graphic (BPG) formats. Then we will analyse the impact of PNG compression on the classification
accuracy of a Convolutional Neural Network (CNN) for image recognition and its necessary computer
resources, specifically storage and calculation resources. To do so, we will perform tests using the
framework Caffe and the pre-trained CNN called AlexNet. Finally, we will compare the impact on
classification accuracy of the PNG format with existing results for JPEG, JPEG2000, and BPG formats,
while adding information about the computer resources.




### Conclusion 
BPG is capable of the highest compression ratio that
saves more space, while PNG takes the most space. Also, regarding classification time, we show that
PNG takes less time to be classified than the other formats. Finally, the classification performance is also
impacted by these different formats. JPEG has a huge dependency on compression rate, while PNG is less
affected by this and J2K seems to loose in rank difference slowly compared to other formats.
We can therefore conclude that our hypotheses have been confirmed, as PNG saves classification time
and is less efficient than BPG and JPEG2000 in terms of classification accuracy. The choice of a perfect
format is still not possible, it is a matter of priority.




### Authors 
* [Nathan Labbe](https://github.com/NathanLabbe)  
* [Robinson Sablons de Gélis](https://github.com/RobinsonSdG)
