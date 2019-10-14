#!/bin/sh -l

export PATH=/opt/conda/bin:$PATH

snakemake --directory $1 --snakefile $2 $3

