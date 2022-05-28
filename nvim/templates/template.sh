#!/bin/bash

## DESCRIPTION:

## AUTHOR: Ben Keith <keitwb@gmail.com>

declare -r SCRIPT_NAME=$(basename "$BASH_SOURCE" .sh)

## exit the shell(default status code: 1) after printing the message to stderr
bail() {
    echo -ne "$1" >&2
    exit ${2-1}
}

## help message
declare -r HELP_MSG="Usage: $SCRIPT_NAME [OPTION]... [ARG]...
  -h display this help and exit
"

## print the usage and exit the shell(default status code: 2)
usage() {
    declare status=2
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        status=$1
        shift
    fi
    bail "${1}$HELP_MSG" $status
}

while :
do
    case $1 in
        -h | --help | -\?)
            usage 0
            ;;
#        -f | --file)
#            file=$2     # You might want to check if you really got FILE
#            shift
#            ;;
#        --file=*)
#            file=${1#*=}        # Delete everything up till "="
#            ;;
        -v | --verbose)
            # Each instance of -v adds 1 to verbosity
            verbose=$((verbose+1))
            ;;
        --) # End of all options
            break
            ;;
        -*)
            echo "WARN: Unknown option (ignored): $1" >&2
            ;;
        *)  # no more options. Stop while loop
            break
            ;;
    esac
    shift
done


#==========MAIN CODE BELOW==========
