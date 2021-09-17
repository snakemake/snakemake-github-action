#!/bin/bash

mkdir -p /github/workspace/.conda

# run given stagein command
eval "$4"

# create container file
if [ "$5" = true ] ; then
    snakemake --directory $1 --snakefile $2 --show-failed-logs $3 --containerize > Dockerfile
else
    # run snakemake with given args
    snakemake --directory $1 --snakefile $2 --show-failed-logs $3
fi
