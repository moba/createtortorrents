#!/bin/bash

TORRENTS=/var/www/mirrors/torrents

for file in `find $TORRENTS -type f`
do
 magnet=`./torrent2magnet.py $file`
 relpathname=${file##$TORRENTS}
 echo ${relpathname%.*} $magnet
# ${file%.*}
done
