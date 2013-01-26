#!/bin/bash

#reduce size to make smaller dxfs
convert -resize 50% fingerprint.png fingerprint.bmp

#convert to a black and white image, do some filtering
mkbitmap  --blur 0.5 --filter 40 --threshold 0.5 fingerprint.bmp

#trace bitmap to a vector (eps)
potrace --turdsize 20 --unit 5 --width 100mm --eps fingerprint.pbm 

#convert eps to dxf
pstoedit -dt -f dxf:'-polyaslines -mm' fingerprint.eps fingerprint.dxf

#give an idea of how complex the file is. 80k lines seems ok for detail and doesn't take too long for openscad to render
echo "---------"
echo "lines file"
wc -l fingerprint.dxf
