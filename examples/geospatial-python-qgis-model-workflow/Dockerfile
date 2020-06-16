# Copyright 2016 Daniel Nüst
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
FROM docker.io/ubuntu:16.04

# Install QGIS and GIS libs from https://launchpad.net/ubuntu/+source/qgis
ENV QGIS_VERSION 2.8.6+dfsg-1build1

RUN apt-get update \
    && apt-get install -qqy --no-install-recommends \
        gdal-bin \
        python-gdal \
        python-scipy \
        python-numpy \
        python-shapely \
        qgis=$QGIS_VERSION \
        qgis-providers=$QGIS_VERSION \
        python-qgis-common=$QGIS_VERSION \
        python-qgis=$QGIS_VERSION \
        xvfb \
        tree \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install SAGA in specific version to avoid compatibility issues: http://hub.qgis.org/issues/13279
# A manualy try using software-properties-common and devscripts (rmadison) from different source packages/repos shows many different versions, but explicitly installing 2.2.0+dfsg-1build2 or 2.1.4+dfsg-1ubuntu1 does NOT work
# Instructions based on https://sourceforge.net/p/saga-gis/wiki/Compiling%20a%20Linux%20Unicode%20version/
ENV SAGA_VERSION 2.2
ENV SAGA_VERSION_MINOR $SAGA_VERSION.0
WORKDIR /saga
RUN apt-get update \
    && apt-get install -qqy --no-install-recommends \
        g++ \
        make \
        automake \
        libtool \
        libwxgtk3.0-dev \
        libtiff5-dev \
        libgdal-dev \
        libproj-dev \
        libjasper-dev \
        libexpat1-dev \
        wx-common \
        libogdi3.2-dev \
        unixodbc-dev \
        wget \
    && apt-get clean
RUN wget http://downloads.sourceforge.net/project/saga-gis/SAGA%20-%20$SAGA_VERSION/SAGA%20$SAGA_VERSION_MINOR/saga_$SAGA_VERSION_MINOR.tar.gz \
    && tar -xvzf saga*.tar.gz
WORKDIR /saga/saga-$SAGA_VERSION_MINOR
RUN ./configure \
    && make \
    && make install

# Install OTB, see https://www.orfeo-toolbox.org/CookBook/Installation.html
ENV OTB_VERSION OTB-5.6.1-Linux64
WORKDIR /otb
RUN wget https://www.orfeo-toolbox.org/packages/archives/OTB/$OTB_VERSION.run -q \
    && chmod +x $OTB_VERSION.run \
    && ./$OTB_VERSION.run \
    && rm $OTB_VERSION.run
# Set non-typical OTB installation dirs for usage in model.py, no profile needed then (see https://github.com/qgis/QGIS/pull/2840/files)
ENV OTB_FOLDER /otb/$OTB_VERSION/bin
ENV OTB_LIB_FOLDER /otb/$OTB_VERSION/lib/otb/applications

# Set environment variables for workflow execution
ENV PYTHONPATH=/usr/share/qgis/python:/usr/share/qgis/python/plugins
ENV QGIS_LOGFILE=/qgis/qgis.log
ENV QGIS_PROCESSING_LOGFILE=/root/.qgis2/processing/processing.log
ENV QGIS_WORKSPACE=/workspace
ENV QGIS_MODELFILE=/workspace/models/*.model
ENV QGIS_MODELSCRIPT=/workspace/model.py
ENV QGIS_SCRIPTFILE=/workspace/scripts/*.py
ENV QGIS_RESULT=/results
ENV QGIS_USER_MODELDIR=/root/.qgis2/processing/models
ENV QGIS_USER_SCRIPTDIR=/root/.qgis2/processing/scripts
ENV XVFB_LOGFILE=/qgis/xvfb.log

# Add main script
WORKDIR /qgis
COPY model.sh model.sh
RUN chmod 0755 model.sh

# Expose default volumes for Kitematic UI
VOLUME $QGIS_WORKSPACE
VOLUME $QGIS_RESULT

# Copy data into the container, can be overwritten with a mount
COPY . /workspace

LABEL maintainer="Daniel Nüst <daniel.nuest@uni-muenster.de>" \
  org.opencontainers.image.authors="Nüst (daniel.nuest@uni-muenster.de), Knoth" \
  org.opencontainers.image.url="https://github.com/nuest/docker-qgis-model" \
  org.opencontainers.image.documentation="Reproducibility and Practical Adoption of GEOBIA with Open-Source Software in Docker Containers  <https://doi.org/10.3390/rs9030290>" \
  org.opencontainers.image.description="Reproducible workflow image" \
  org.opencontainers.image.licenses="Apache-2.0" \
  author.orcid="0000-0002-0024-5046"

ENTRYPOINT ["/bin/bash", "/qgis/model.sh"]

# Execute the following commands _in the directory of this file_ to build and execute a self-contained image:
# BUILD COMMAND: docker build -t qgis-model-example .
# RUN COMMAND: docker run --rm -it qgis-model-example
