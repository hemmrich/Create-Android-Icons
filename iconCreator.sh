#!/bin/bash


#---------------------Global Variables-------------------------------------
#spaces included for better output formatting
DimensionLabels=("      mdpi" "      hdpi" "     xhdpi" "    xxhdpi" "   xxxhdpi" "GooglePlay")
Launcher=(48 72 96 144 192 512)
ActionBar=(32 48 64 96 128)
Notification=(24 36 48 72 96)

#argument 1 ($1) should be file name, argument 2 ($2) should be mode
usage="Usage: ./iconCreator.sh <filename of PNG image> <mode: launcher, actionbar, or notification>"


#---------------------Error Checking---------------------------------------
#print usage and quit if wrong number of arguments were passed
[ $# -ne 2 ] && echo $usage && exit 1

#check if argument is a valid PNG file
[ ! -f $1 ] && echo "File not found!" && exit 1
[ ${1: -4} != ".png" ] && echo "Not a valid PNG file!" && exit 1



#---------------------Main Script Logic------------------------------------
[ $2 == "launcher" ]     && createImages ${#Launcher[@]} $1 "${Launcher[@]}"         && exit 0
[ $2 == "actionbar" ]    && createImages ${#ActionBar[@]} $1 "${ActionBar[@]}"       && exit 0
[ $2 == "notification" ] && createImages ${#Notification[@]} $1 "${Notification[@]}" && exit 0

#if this statement is reached, then the 2nd argument was invalid
echo 'Invalid mode argument. Argument should be "launcher", "actionbar", or "notification".'
exit 1


#---------------------Function Definitions---------------------------------
function getNewFilename {
    original=$1
    dimension=$2

    newFilename=${original%.*}
    newFilename+="_$dimension"
    newFilename+="x$dimension"
    newFilename+='.png'
}

function createImages {
    #first argument is array size, second is PNG name, remainder are array elements
    numElts="${1}" 
    filename="${2}"
    shift
    shift
    array=("${@}")

    for i in "${!array[@]}"
    do
        dimension=${array[$i]}
        getNewFilename $filename $dimension
        cp $filename $newFilename

        #use sips to resize image to suppress output
        {sips -z $dimension $dimension $newFilename} &> /dev/null

        label=${DimensionLabels[$i]}
        echo "Created $label image $newFilename"
    done
}
