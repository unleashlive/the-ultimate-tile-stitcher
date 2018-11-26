#!/usr/bin/env bash
set -e

# Create pyramid of tiles for the tiles scraped by scraper.py
# USAGE: ./pyramidize.sh tiles

zoomDir=$1
outDir='map'

# tiles_jon/21_340269_795582.png
regex="(\w+)\/([0-9]+)_([0-9]+)_([0-9]+)\.(png|jpg)+"
for TILE in `find $zoomDir -name "*.png"` ; do

    if [[ $TILE =~ $regex ]]
    then

        #convert TMS to XYZ format
        #https://gist.github.com/tmcw/4954720
        folder="${BASH_REMATCH[1]}"
        z="${BASH_REMATCH[2]}"
        x="${BASH_REMATCH[3]}"
        y="${BASH_REMATCH[4]}"
        ext="${BASH_REMATCH[5]}"
        y_tms=`echo "2^$z-$y-1" | bc`

        outputPath="$folder/tiles_xyz/$z/$x/$y_tms.$ext"

        #newpath=`echo $TILE | sed "s/_/\//g"`

        mkdir -p `dirname "$outputPath"`

        cp $TILE "$outputPath"

#        echo $TILE "$outputPath"
    else
        echo "$TILE doesn't match pattern" #>&2
    fi


done

