# This Dockerfile is based on the rocker/binder example Dockerfile from https://github.com/rocker-org/binder/
# We use 3.6.0 because it is a recent version of R that has a fixed MRAN date in the Rocker image.
# The used MRAN URL is: https://mran.microsoft.com/snapshot/2019-07-05
FROM rocker/binder:3.6.0

## Declares build arguments
ARG NB_USER
ARG NB_UID

# Install system dependency for pdftools
USER root
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libpoppler-cpp-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

## Run install.R script, which installs required R packages and LaTeX packages via tinytex
COPY install.R ${HOME}
RUN R --quiet -f install.R

## Copies all repo files into the Docker Container into the home directory configured in the base image
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

## Become normal user again
USER ${NB_USER}

## Export system libraries and R package versions
RUN dpkg --list > dpkg-list.txt && \
  R -e 'capture.output(knitr::kable(as.data.frame(installed.packages())[c("Package", "Version", "License", "Built")], format = "markdown", row.names = FALSE), file = "r-packages.md")'

# --- Metadata ---
LABEL maintainer="daniel.nuest@uni-muenster.de" \
  Name="Reproducible research at GIScience - computing environment" \
  org.opencontainers.image.created="2020-04" \
  org.opencontainers.image.authors="Daniel Nüst" \
  org.opencontainers.image.url="https://github.com/nuest/reproducible-research-at-giscience/blob/master/Dockerfile" \
  org.opencontainers.image.documentation="https://github.com/nuest/reproducible-research-at-giscience/" \
  org.label-schema.description="Reproducible workflow image (license: Apache 2.0)"

# --- Development instructions ---
# From time to time, run a linter on the Dockerfile:
# $ docker run -it --rm --privileged -v $PWD:/root/ projectatomic/dockerfile-lint dockerfile_lint


# --- Usage instructions ---
## Build the image
# $ docker build --tag rr-giscience .
#
## Run the image for interactive UI
# $ docker run -it -p 8888:8888 rr-giscience
# Next, open a browser at http://localhost:8888 or click on the login link shown in the console.
# It will show the Jupyter start page and you can now open RStudio via the menu "New".
#
## Run the image to render the PDF for the assessment figures or the text analysis
# $ docker run -i -v $(pwd):/giscience --user $UID rr-giscience Rscript -e 'setwd("/giscience"); rmarkdown::render("giscience-reproducibility-assessment.Rmd")'
# $ docker run -i -v $(pwd):/giscience --user $UID rr-giscience Rscript -e 'setwd("/giscience"); rmarkdown::render("giscience-historic-text-analysis.Rmd")'
