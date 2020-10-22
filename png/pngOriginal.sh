#!/bin/bash
#pngquant --quality=1 ILSVRC2012_val_00000023.JPEG

for file in ../inputImg/*; 
do 
  file2=$(basename -- "$file")
  file3=${file2::-5}
  convert $file ./originalImg/$file3.png
done