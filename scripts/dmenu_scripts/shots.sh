#!/usr/bin/bash
NAME=$(date +"shot_%Y%m%d-%H%M%S.png") 
DIR="$HOME/media/img/shots"
FILE_PATH="$DIR/$NAME"

mkdir -p $DIR

import $FILE_PATH
OUTPUT=$(echo -e "Clipboard\nFile" | dmenu)

if [ $OUTPUT == "Clipboard" ]; then
 xclip -t "image/png" -i -selection clipboard $FILE_PATH
 rm $FILE_PATH
elif [ $OUTPUT == "File" ]; then
 xdg-open $DIR
fi
