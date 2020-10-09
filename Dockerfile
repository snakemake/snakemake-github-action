FROM snakemake/snakemake:v5.26.1
COPY entrypoint.sh /entrypoint.sh
ENV CONDA_ENVS_PATH /github/workspace/.conda
ENTRYPOINT ["/entrypoint.sh"]
