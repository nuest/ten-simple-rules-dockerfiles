# Written by Roger A. Close to accompany analysis R code for Close et al. (in review) The spatial structure of Phanerozoic marine animal diversity.
# Paper: https://doi.org/10.1126/science.aay8309
FROM docker.io/rocker/rstudio:3.6.0

# Install system dependencies for R packages, including spatial packages and Java
RUN apt-get update && apt-get install -y \
	r-cran-ncdf4 \
	netcdf-* \
	libnetcdf-dev \
	libproj-dev \
	default-jre \
	default-jdk \
	libxml2-* \
	libmagick++-dev \
	libgdal-dev libproj-dev libgeos-dev \
	lbzip2 \
	nano \
&& rm -rf /var/lib/apt/lists/*

# Make sure R finds the Java installation
RUN R CMD javareconf

LABEL maintainer="Roger Close <roger.close@gmail.com>" \
  org.opencontainers.image.authors="R. A. Close, R. B. J. Benson, E. E. Saupe, M. E. Clapham, J. Butler" \
  org.opencontainers.image.url="https://science.sciencemag.org/content/suppl/2020/04/22/368.6489.420.DC1" \
  org.opencontainers.image.documentation="The spatial structure of Phanerozoic marine animal diversity <https://science.sciencemag.org/content/368/6489/420/>" \
  org.opencontainers.image.description="Reproducible workflow image, details in README.md" \
  author.orcid="https://orcid.org/0000-0003-3302-9902"

### Build
# docker build --tag phanerozoic-diversity .

### Run interactively with RStudio
# docker run --rm -it -p 8787:8787 -v $(pwd)/spatial-subsampling-marine-inverts:/home/rstudio/spatial-subsampling-marine-inverts -e USERID=$UID -e PASSWORD=phanerozoic phanerozoic-diversity
# Go to localhost:8787, login, open and execute run-master-script.R

### Run process only container
# docker run -it -v $(pwd)/spatial-subsampling-marine-inverts:/home/rstudio/ phanerozoic-diversity Rscript --vanilla /home/rstudio/run-master-script.R
# Extract results from container using container ID and docker copy

# See README.md for details.
