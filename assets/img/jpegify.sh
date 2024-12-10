#!/bin/bash

input=$1
output=$2

echo "converting $input to $output"

magick convert $input \
-resize 400 \
-sampling-factor 4:2:0 \
-strip \
-quality 85 \
-interlace JPEG \
$output

echo "renaming $input to ${input}.bak"
mv $input ${input}.bak
