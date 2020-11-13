FROM snakemake/snakemake:v5.28.0
COPY entrypoint.sh /entrypoint.sh
ENV CONDA_ENVS_PATH /github/workspace/.conda
ENTRYPOINT ["/entrypoint.sh"]
