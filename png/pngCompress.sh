#!/bin/bash
INPUT="./inputImg/*"
OUTPUT="./outputImg/"
PARAMETERS="1 2 3 4 5 6 7 8 10 12 14 16 18 20 25 30 40 50"

rm -f  ./outputImg/*
for f in $INPUT
do
    f2=$(basename -- "$f")
    f3=${f2::-4}
    for p in $PARAMETERS
    do
        pngquant --quality=$p $f --output "$OUTPUT$f3$p.png"
    done
done