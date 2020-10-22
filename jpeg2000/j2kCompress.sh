#!/bin/bash
INPUT="../png/inputImg/*"
OUTPUT="./outputImg/"
PARAMETERS="200,40,20 200,40 200 100,20,10 100,20 100 50,40,20 50,40 50 25,20,10 25,20 25 15,10,1 15,10 15 10,5,1 10,5 10"

rm -f  ./outputImg/*
for f in $INPUT
do
    f2=$(basename -- "$f")
    f3=${f2::-4}
    for p in $PARAMETERS
    do
        opj_compress -i $f -o "$OUTPUT$f3$p.j2k" -r $p -t 500,500
    done
done