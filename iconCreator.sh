#!/bin/bash

DimensionLabels=(mdpi,hdpi,xhdpi,xxhdpi,xxxhdpi)
Launcher=(48 72 96 144 192 512)
ActionBar=(32,48,64,96,128)
Notification=(24,36,48,72,96)

#argument 1 ($1) should be file name, argument 2 ($2) should be mode
usage="Usage: ./iconCreator.sh <filename of PNG image> <mode: launcher, actionbar, or notification>"

function getNewFilename {
    original=$1
    dimension=$2

    newFilename=${original%.*}
    newFilename+="_$dimension"
    newFilename+="x$dimension"
    newFilename+='.png'
}



#print usage and quit if wrong number of arguments were passed
[ $# -ne 2 ] && echo $usage && exit 1

#check if argument is a valid PNG file
[ ! -f $1 ] && echo "File not found!" && exit 1
[ ${1: -4} != ".png" ] && echo "Not a valid PNG file!" && exit 1

#check if mode is valid
if [[ $2 != "launcher" ]] && [[ $2 != "actionbar" ]] && [[ $2 != "notification" ]]
then
    echo 'Invalid mode argument. Argument should be "launcher", "actionbar", or "notification"'
    exit 1
fi

if [ $2 == "launcher" ]
then
    echo "Launcher"
    echo "filename: $1" 
    for size in "${Launcher[@]}"
    do
        echo "$size"
        getNewFilename $1 $size
        echo $newFilename
        #cp $1
    done



elif [ $2 == "actionbar" ]
then
    echo "ActionBar"
elif [ $2 == "notification" ]
then
    echo "Notification"
else
    echo 'Invalid mode argument. Argument should be "launcher", "actionbar", or "notification".'
    exit 1
fi

