###############################################################################
#
# File Name         : .bashrc
# Created By        : Guillaume FAVRE
# Creation Date     : juin 12th, 2015
# Version           : 0.1
# Last Change       : juin 12th, 2015 at 15:39:10
# Last Changed By   : Guillaume FAVRE
# Purpose           : Description
#
###############################################################################
#!/usr/bin/bash

# alias 
# functions
# miscs

# Notes main function
# Possible options: -d
#+                  --delete

# -> Notes environment variable
notpath=${HOME}/pers/note
notmax=3
nottrash=${HOME}/.trash

# -> Notes main function
function notes ()
{
    if [ -z $1 ]; then
        ls ${notpath}
    else
        if [[ $1 == "-d" || $1 == "--delete" ]]; then
            _trahnotes $2
        elif [ $# -le ${notmax} ]; then
            FILES=""
            for i in $*; do
	    FILES="${notpath}/$i.mkd ${FILES}"
            done
            vim ${FILES} +"set ft=markdown"
        else
            echo "ERROR: to many argument (${notmax} max)"
        fi
    fi
    _notes
}

# -> notes completion function
function _notes ()
{
    if [ -d ${notpath} ]; then
        NOTES_COMPLETE="$(ls ${notpath} | cat | cut -f 1 -d '.' | sed -e 's/ /_/g' | tr -s '\n' ' ')"
        complete -o filenames -W "${NOTES_COMPLETE}" notes
    fi
}

# -> notes trash function
function _trahnotes ()
{
    if ! [ -d ${nottrash} ]; then
        mkdir ${nottrash}
    fi
    if [ -f ${notpath}/$1.mkd ]; then
        file=${notpath}/$1.mkd
    elif [ -f ${notpath}/$1.txt ];then
        file="${notpath}/$1.txt"
    elif [ -f ${notpaths}/$1.md ];then
        file="${notpath}/$1.md"
    elif [ -f ${notpath}/$1 ]; then
        file="${notpath}/$1"
    fi
    mv ${file} ${nottrash}/$1.mkd
}

_notes
