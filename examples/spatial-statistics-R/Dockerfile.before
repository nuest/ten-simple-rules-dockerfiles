FROM rocker/verse
MAINTAINER Stephen Eglen <sje30@cam.ac.uk>
## RUN apt-get update -y && apt-get install -y  texlive-base
## texlive-bibtex-extra lmodern
RUN Rscript -e 'install.packages(c("splancs", "spatstat", "knitr", "xtable"))'
RUN Rscript -e 'install.packages(c("sjedmin", "sjedrp", "sjevor","sjedist"), type="source", contriburl="http://damtp.cam.ac.uk/user/eglen/r/")'


## RUN Rscript -e 'devtools::install_github("sje30/eglen2015")'
USER rstudio
ENV PROJ /home/rstudio/
WORKDIR $PROJ
RUN git clone https://github.com/sje30/eglen2015
WORKDIR $PROJ/eglen2015
## USER root
RUN make install


## To rebuild:
## docker build -t sje30/eglen2015 https://raw.githubusercontent.com/sje30/eglen2015/master/Dockerfile
## or to rebuild locally
## docker build -t sje30/eglen2015 .

## may need to run as if we get permission errors in the Dockerfile...
## docker run -d -p 8787:8787 -e ROOT=TRUE sje30/eglen2015


## texlive-bibtex-extra is required for the breakcites.sty package
## which in turn is needed by the JSFDS package.

## 2018-08-05
## Since writing the Dockerfile in 2016, rocker/verse has switched to
## using the new "tinytex" package for installing latex packages on
## the fly.  On the plus-side, it means that I don't need to tweak
## with the latex to get extra packages.  Another bonus is that when
## running e.g. knit2pdf() if there are latex style files missing,
## they are automatically downloaded by R .  The downside is that the
## downloading of the style files takes a few minutes...

## I'm also not quite sure why I need to have the "USER root" line...
## and so I need to check why this is?  By default it seems that rstudio
## should have write access to the /opt/tinytex area, but see error below when running as rstudio user




## lmgr search --file --global '/helvet.sty'
## Trying to automatically install missing LaTeX packages...
## tlmgr install psnfss
## tlmgr: package repository http://mirror.utexas.edu/ctan/systems/texlive/tlnet (not verified: gpg unavailable)
## [1/1, ??:??/??:??] install: psnfss [12k]
## copy /opt/TinyTeX/tlpkg/texlive.tlpdb.tmp to /opt/TinyTeX/tlpkg/texlive.tlpdb failed: Operation not permitted at /opt/TinyTeX/tlpkg/TeXLive/TLPDB.pm line 628.
## tlmgr update --self
