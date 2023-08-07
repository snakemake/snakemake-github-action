#!/bin/bash

mkdir -p /github/workspace/.conda

# run given stagein command
eval "$4"

# create container file
if [ "$5" = 'containerize' ] ; then
    snakemake --directory $1 --snakefile $2 --show-failed-logs $3 --containerize > Dockerfile
    # return disk space usage on failing
    if [[ "$?" -ne 0 && "$6" = true ]] ; then
        du -h -d3 $1
    fi
elif [ "$5" = 'run' ] ; then
    # run snakemake with given args
    snakemake --directory $1 --snakefile $2 --show-failed-logs $3
    # return disk space usage on failing
    if [[ "$?" -ne 0 && "$6" = true ]] ; then
        du -h -d3 $1
    fi
else
    echo "Task input not recognized." && exit 1
fi
