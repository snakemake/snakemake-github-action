# Snakemake github action

This action runs Snakemake on the repository.

## Inputs

### `directory`

**Required** The working directory to use. Default `.test`.

### `snakefile`

The Snakefile containing the workflow description. Default `Snakefile`.

### `args`

Additional arguments to pass to Snakemake.

## Example usage

```
uses: snakemake/snakemake-github-action@v1.2
with:
  directory: '.test'
  snakefile: workflow/Snakefile
  args: '--use-conda'
```
