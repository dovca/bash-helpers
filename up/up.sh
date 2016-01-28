#!/bin/bash
if [[ $1 == "--help" ]]; then
    echo "usage: up [--help] [number | directory]
    Travel up the directory hierarchy."
    return 0;
fi
if [[ -z $1 ]]; then # No arguments given
    cd ..
elif [[ $1 == "/" ]]; then # Jump to root
    cd /
elif [[ $1 =~ ^[0-9]+$ ]]; then # Argument is a number
    for (( i=0; i<$1; i++ )); do
        if [[ $PWD == '/' ]]; then
            return 0; # Top level
        fi
        cd ..
    done 
else # Argument is a text string
    DIR=${PWD%/*}
    NEW=".."
    while [[ -n $DIR ]]; do
        if [[ ${DIR##*/} == $1* ]]; then
            cd $NEW
            return 0
        fi
        DIR=${DIR%/*}
        NEW+="/.."
    done
    echo $0: up: $1: No match found >&2
    return 1
fi
