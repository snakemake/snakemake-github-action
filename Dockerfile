<<<<<<< HEAD
FROM snakemake/snakemake:v5.12.1
=======
FROM snakemake/snakemake:v5.9.1
>>>>>>> 7a6aebe4bbd8d01247a1997e451d6a4bb75ea54d
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
