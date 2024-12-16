#!/bin/bash

input=$1
output=$2
size_in=$3
size_out=$4

echo "converting $input to $output"

convert -size $size_in $input -resize $size_out $output
