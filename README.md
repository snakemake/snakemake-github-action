# snakemake-github-action
A Github action for running a Snakemake workflow



# Snakemake github action

This action runs Snakemake on the repository.

## Inputs

### `directory`

**Required** The working directory to use. Default `.test`.

### `args`

Additional arguments to pass to Snakemake.

## Example usage

uses: actions/snakemake@v1
with:
  directory: '.test'
  args: '--use-conda'
