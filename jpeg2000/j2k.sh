#!/bin/bash
#pngquant --quality=1 ILSVRC2012_val_00000023.JPEG

for file in ../png/inputImg/*; 
do 
  file2=$(basename -- "$file")
  file3=${file2::-4}
  opj_compress -i $file -t 500,500 -o ./originalImg/$file2.j2k
done