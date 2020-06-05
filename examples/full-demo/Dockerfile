FROM docker.io/rocker/verse:3.6.2

### INSTALL BASE SOFTWARE #####################################################
# Install Java, needed for package rJava
RUN apt-get update && \
  apt-get install -y default-jdk && \
  rm -rf /var/lib/apt/lists/*

### INSTALL WORKFLOW TOOLS ####################################################
# Install system dependencies for R packages
RUN apt-get update && \
  apt-get install -y \
    # needed for RNetCDF, found via https://sysreqs.r-hub.io/pkg/RNetCDF
    libnetcdf-dev libudunits2-dev \
    # needed for git2r:
    libgit2-dev

# Install R packages, based on https://github.com/rocker-org/geospatial/blob/master/Dockerfile
RUN install2.r --error \
    RColorBrewer \
    RNetCDF \
    git2r \
    rJava

WORKDIR /tmp

# Install Python tools and their system dependencies
RUN apt-get update && \
  apt-get install -y python-pip && \
  rm -rf /var/lib/apt/lists/*
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Download superduper image converter
RUN wget https://downloads.apache.org/pdfbox/2.0.19/pdfbox-app-2.0.19.jar

### ADD MY OWN SCRIPTS ########################################################
# Add workflow scripts
WORKDIR /work
COPY myscript.sh myscript.sh
COPY analysis.py analysis.py
COPY plots.R plots.R

# Configure workflow
ENV DATA_SIZE 42

# Uncomment the following lines to execute preprocessing tasks during build
#RUN python analysis.py
#RUN Rscript plots.R

### WORKFLOW CONTAINER FEATURE ################################################
# CMD from base image used for development, uncomment the following lines to 
# have a "run workflow only" image
# CMD["./myscript.sh"]

### Usage instructions ########################################################
# Build the images with
# > docker build --tag great_workflow:1.0.0 .
# Run the image interactively with RStudio, open it on http://localhost/
# > docker run -it -p 80:8787 -e PASSWORD=ten --volume $(pwd)/input:/input great_workflow:1.0.0
# Run the workflow:
# > docker run -it --name gwf great_workflow:1.0.0 /work/myscript.sh
# Extract the data:
# > docker cp gwf:/output/ ./outputData
# Extract the figures:
# > docker cp gwf:/work/figures/ ./figures
