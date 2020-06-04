FROM snakemake/snakemake:v5.19.2
COPY entrypoint.sh /entrypoint.sh
ENV CONDA_ENVS_PATH /github/workspace/.conda
ENTRYPOINT ["/entrypoint.sh"]
