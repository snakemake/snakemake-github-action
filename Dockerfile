FROM snakemake/snakemake:v5.27.3
COPY entrypoint.sh /entrypoint.sh
ENV CONDA_ENVS_PATH /github/workspace/.conda
ENTRYPOINT ["/entrypoint.sh"]
