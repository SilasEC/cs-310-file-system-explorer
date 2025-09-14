#!/bin/bash

dir="${1:-.}"   

for item in "$dir"/*; do
    if [ -d "$item" ]; then
        echo "$item    [dir]    -    -"
    else
        size=$(stat -c %s "$item")                 
        type=$(file --mime-type -b "$item") 
        echo "$item    [file]   $size bytes   $type"
    fi
done

