FROM snakemake/snakemake:v5.7.4
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
