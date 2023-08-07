#!/bin/bash

mkdir -p /github/workspace/.conda

# run given stagein command
eval "$4"

# create container file
if [ "$5" = 'containerize' ] ; then
    snakemake --directory $1 --snakefile $2 --show-failed-logs $3 --containerize > Dockerfile
elif [ "$5" = 'run' ] ; then
    # run snakemake with given args
    snakemake --directory $1 --snakefile $2 --show-failed-logs $3
    if [[ "$?" -ne 0 ]]; then
        if [[ "$6" = true ]]; then
            # return disk usage and space on failing
            df -h
            echo "du home\n"
            du -h -d3 /github/home
            echo "du working directory\n"
            du -h -d3 $1
        fi
        exit 1
    fi
else
    echo "Task input not recognized." && exit 1
fi
