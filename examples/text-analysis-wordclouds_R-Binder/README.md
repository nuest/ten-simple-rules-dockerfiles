# Dockerfile revision example

The original Dockerfile from https://github.com/nuest/reproducible-research-and-giscience/blob/master/Dockerfile and is authored by me, Daniel Nüst ([@nuest](https://github.com/nuest/)), and published under the Apache License 2.0.
The workflow is part of a [peer reviewed publication](https://doi.org/10.7717/peerj.5072) and uses a Binder base image to run RStudio in a browser.
Binder's `install.R` file is used to install required dependencies and the base image includes already a number of required R packages, including the Tidyverse packages, and a LaTeX installation using `tinytex`, which is needed to create the manuscript output as LaTeX.

## Review and changes

- The original Dockerfile did not have usage instructions, which were only in the projects [README.md](https://github.com/nuest/reproducible-research-and-giscience/blob/master/README.md)
- Explicitly mention the image registry (i.e., starting image name with `docker.io/`)
- Some reasoning behind instructions was not explained well
- The base image version changed because
- I removed the explicit setting of the MRAN date, instead relying on the MRAN date already specified in the base image, which was obtained with `docker run --rm -it rocker/binder:3.6.0 Rscript -e 'options("repos")`
- The `install.R` file is present, I know that, so the `if [ -f install.R ];` check that was copied over from a more generic Binder-created Dockerfile could be removed to simplify the instruction
