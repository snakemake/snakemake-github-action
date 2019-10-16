#!/bin/bash -l

export PATH=/opt/conda/bin:$PATH

# run given stagein command
eval "$4"

# run snakemake with given args
snakemake --directory $1 --snakefile $2 $3

