# Integrated example for the Ten Simple Rules for Dockerfiles project, 
# see https://osf.io/fsd7t/
# This Dockerfile is a rewrite based on
# - https://github.com/innovationOUtside/tm351vm/blob/master/build/minimal/Dockerfile
# - https://github.com/innovationOUtside/tm351vm/blob/master/build/openrefine/Dockerfile
FROM ubuntu:16.04

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    # required for installation of OpenRefine    
    wget \
    ant \
    unzip \
    openjdk-8-jre-headless && \
  apt-get purge && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*

# Download and unpack OpenRefine ((https://openrefine.org/) to /opt/openrefine-x.y, then delete the downloaded archive
ENV OPENREFINE_VERSION="3.2"
# other versions: 2.8, 3.0-beta
ENV OPENREFINEGZ="openrefine-linux-${OPENREFINE_VERSION}.tar.gz" \
    OPENREFINESRC="https://github.com/OpenRefine/OpenRefine/releases/download/${OPENREFINE_VERSION}/openrefine-linux-${OPENREFINE_VERSION}.tar.gz"
RUN wget -q --no-check-certificate  -P /tmp $OPENREFINESRC && \
  tar -xzf /tmp/$OPENREFINEGZ -C /opt && \
  rm /tmp/$OPENREFINEGZ

# Create working directly and expose it as a volume
WORKDIR /openrefine_projects
VOLUME /openrefine_projects

LABEL maintainer="tony.hirst@gmail.com" \
  org.opencontainers.image.authors="Tony Hirst" \
  org.opencontainers.image.url="https://github.com/innovationOUtside/tm351vm"

# Default command runs OpenRefine on the exposed port
ENV OPENREFINE_PORT 3334
EXPOSE ${OPENREFINE_PORT}
CMD ["sh", "-c", "/opt/openrefine-${OPENREFINE_VERSION}/refine -p ${OPENREFINE_PORT} -i 0.0.0.0 -d /openrefine_projects"]

# Usage instructions:
# docker build --tag tensimpleexamples:openrefine .
# docker run --rm -it -p 3334:3334 tensimpleexamples:openrefine
# > open your browser at localhost with the port shown in the command line
