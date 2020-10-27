#!/bin/bash
INPUT="./inputBpg/*"
OUTPUT="./outputImg/"
PARAMETERS="30 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51"

rm -f  ./outputImg/*
for f in $INPUT
do
    f2=$(basename -- "$f")
    f3=${f2::-5}
    for p in $PARAMETERS
    do
        bpgenc $f -o "$OUTPUT$f3$p.bpg" -q $p -m=1
    done
done