#!/bin/bash

TORRENTS=/var/www/mirrors/torrents

for file in `find $TORRENTS -name "*.torrent" -type f`
do
 magnet=`$(dirname $0)/torrent2magnet.py $file`
 relpathname=${file##$TORRENTS}
 echo ${relpathname%.*} $magnet
# ${file%.*}
done
