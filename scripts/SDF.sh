#!/bin/sh

convert orig.png -resize 25% .orig-downscaled.png
convert orig.png -threshold 50% .orig-threshold.png
SIZE=$(identify orig.png | cut -d' ' -f3)

MAX=0.0
MAXRES=""
for filter in $(convert -list filter); do
    for threshold in $(seq 1 99); do
        convert .orig-downscaled.png -filter $filter -resize $SIZE! -threshold $threshold% .tmp.png
        PSNR=$(compare -metric PSNR .orig-threshold.png .tmp.png /dev/null 2>&1)
        if [ "$(echo "$MAX < $PSNR" | bc -l)" = "1" ]; then
            MAXRES="$PSNR $filter $threshold"
            echo $MAXRES
            MAX=$PSNR
        fi
        rm .tmp.png
    done
done

rm .orig-threshold.png .orig-downscaled.png

## EOF
