#!/bin/bash
#pngquant --quality=1 ILSVRC2012_val_00000023.JPEG

for file in ../inputAllSizes/*; 
do 
  file2=$(basename -- "$file")
  file3=${file2::-5}
  convert $file ./inputImg/$file3.png
done