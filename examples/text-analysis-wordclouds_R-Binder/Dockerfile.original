FROM rocker/binder:3.4.3

# Install system dependency for pdftools
USER root
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libpoppler-cpp-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

# Copy repo into ${HOME}, make user own $HOME
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

# Configure current MRAN mirror, based on https://github.com/rocker-org/rocker-versioned/blob/master/r-ver/Dockerfile
# (append /etc/environment and Rprofile, latest statement matters)
ENV MRAN=https://mran.microsoft.com/snapshot/2018-05-23
RUN echo MRAN=$MRAN >> /etc/environment \
  && export MRAN=$MRAN \
  && echo "options(repos = c(CRAN='$MRAN'), download.file.method = 'libcurl')" >> /usr/local/lib/R/etc/Rprofile.site

# return back to regular user
USER ${NB_USER}

# run any install.R script we find
RUN if [ -f install.R ]; then R --quiet -f install.R; fi
