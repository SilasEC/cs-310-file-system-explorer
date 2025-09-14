#file_explorer.sh
#Silas Curtis
#CS 310
#Due 9/15/25
#This script loops through a specified directory and prints the names and some basic characteristics of the items within it.
# If no directory is specified, the current one is used. File type and size are not printed for directories.

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

