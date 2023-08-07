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

### `task`

Whether to run Snakemake or to generate a container image specification (in the form of a Dockerfile) that contains all required environments. Can be either `run` or `containerize`. Default `run`.

### `show-disk-usage-on-error`

Whether used disk space shall be printed if Snakemake fails. Can be either `true` or `false` (default: `false`).

## Example usage

```yaml
- name: Linting
  uses: snakemake/snakemake-github-action@v1
  with:
    directory: '.test'
    snakefile: 'workflow/Snakefile'
    args: '--lint'

- name: Testing
  uses: snakemake/snakemake-github-action@v1
  with:
    directory: '.test'
    snakefile: 'workflow/Snakefile'
    args: '--cores 1 --use-conda --conda-cleanup-pkgs cache'
    stagein: '' # additional preliminary commands to run (can be multiline)
    show-disk-usage-on-error: true


- name: Create container file
  uses: snakemake/snakemake-github-action@v1
  with:
    snakefile: 'workflow/Snakefile'
    task: 'containerize'
```
