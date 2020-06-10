## Dockerfile for the following paper:
##
## Bivariate spatial point patterns in the retina: a reproducible
## review. Journal de la Société Française de Statistique 157:33–48.
##
## Home page for project: <http://github.com/sje30/eglen2015>

FROM rocker/verse:3.6.3
LABEL maintainer = "Stephen Eglen <sje30@cam.ac.uk>"
RUN Rscript -e 'install.packages(c("splancs", "spatstat", "knitr", "xtable"))'
RUN Rscript -e 'install.packages(c("sjedmin", "sjedrp", "sjevor","sjedist"), type="source", contriburl="http://damtp.cam.ac.uk/user/eglen/r/")'


## RUN Rscript -e 'devtools::install_github("sje30/eglen2015")'
USER rstudio
ENV PROJ /home/rstudio/
WORKDIR $PROJ
RUN git clone https://github.com/sje30/eglen2015
WORKDIR $PROJ/eglen2015
RUN make install


## --- Building ---
## docker build -t sje30/eglen2015 .

## --- Linting ---
## To lint this file (also as "make dockerfile-lint"):
## docker run --rm -i hadolint/hadolint < Dockerfile

## --- Running ---
## This dockerfile is on dockerhub, so the following should "just work":
## docker run --rm -p 8787:8787 -e PASSWORD=simple sje30/eglen2015
##
## If you are on linux, you can then visit http://localhost:8787
##
## On windows and mac, you first need to find the IP address which is given by:
## docker-machine ip
## and should be something like 192.168.99.100
## from there you can open http://192.168.99.100:8787
##
## To login, the username is "rstudio" and the password is "simple"




