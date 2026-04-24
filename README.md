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

Whether to run Snakemake or to generate a container image specification (`Dockerfile`, `apptainer.def`) that contains all required environments. Can be either `run` or `containerize`. Default `run`.

### `show-disk-usage-on-error`

Whether used disk space shall be printed if Snakemake fails. Can be either `true` or `false` (default: `false`).

### `snakemake-version`

Snakemake version to install from conda. Default `*` (latest available version from the configured channels).

### `snakemake-branch`

Optional Snakemake git branch to install from `https://github.com/snakemake/snakemake`. If set, this takes precedence over `snakemake-version` and Snakemake is installed from source via pip.

### `install-apptainer`

Whether to install Apptainer (true/false). Default `false`.

### `containerize-args`

Additional arguments for `containerize`, can be one of 'dockerfile', 'apptainer' or '' (defaults to dockerfile).

## Example usage

```yaml
- name: Linting
  uses: snakemake/snakemake-github-action@v2
  with:
    directory: ".test"
    snakefile: "workflow/Snakefile"
    args: "--lint"

- name: Testing
  uses: snakemake/snakemake-github-action@v2
  with:
    directory: ".test"
    snakefile: "workflow/Snakefile"
    args: "--cores 1 --sdm conda --conda-cleanup-pkgs cache"
    stagein: "" # additional preliminary commands to run (can be multiline)
    show-disk-usage-on-error: true

- name: Testing with custom Snakemake branch
  uses: snakemake/snakemake-github-action@v2
  with:
    directory: ".test"
    snakefile: "workflow/Snakefile"
    args: "--cores 1 --sdm conda --conda-cleanup-pkgs cache"
    snakemake-branch: main

- name: Create container file
  uses: snakemake/snakemake-github-action@v2
  with:
    directory: ".test"
    snakefile: "workflow/Snakefile"
    task: "containerize"
    containerize-args: "apptainer"
```
