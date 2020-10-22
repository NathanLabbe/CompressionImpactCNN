#!/bin/bash
INPUT="../inputImg/*"
OUTPUT="./originalImg/"

rm -f  ./originalImg/*
for f in $INPUT
do
    f2=$(basename -- "$f")
    f3=${f2::-5}
    bpgenc $f -o "$OUTPUT$f3.bpg"
done