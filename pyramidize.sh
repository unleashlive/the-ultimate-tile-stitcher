#!/usr/bin/env bash
set -e

# Create pyramid of tiles for the tiles scraped by scraper.py
# USAGE: ./pyramidize.sh tiles

zoomDir=$1
outDir='map'
for TILE in `find $zoomDir -name "*.png"` ; do

    newpath=`echo $TILE | sed "s/_/\//g"`
    mkdir -p `dirname "$zoomDir/$outDir/$newpath"`
#    cp $TILE "$zoomDir/$outDir/$newpath"
    echo $TILE "$zoomDir/$outDir/$newpath"
done

