# Snakemake github action

This action runs Snakemake on the repository.

## Inputs

### `directory`

**Required** The working directory to use. Default `.test`.

### `snakefile`

The Snakefile containing the workflow description. Default `Snakefile`.

### `args`

Additional arguments to pass to Snakemake.

### `stagein`

Preliminary commands to run before the workflow execution.

### `containerize`

Only generates a container image specification (in the form of a Dockerfile) that contains all required environments. Defaults to `false`.

## Example usage

```yaml
- name: Linting
  uses: snakemake/snakemake-github-action@v1.19.0
  with:
    directory: '.test'
    snakefile: 'workflow/Snakefile'
    args: '--lint'
- name: Testing
  uses: snakemake/snakemake-github-action@v1.19.0
  with:
    directory: '.test'
    snakefile: 'workflow/Snakefile'
    args: '--cores 1 --use-conda --conda-cleanup-pkgs cache'
    stagein: '' # additional preliminary commands to run (can be multiline)
```
