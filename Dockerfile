FROM docker.io/rocker/verse:3.6.2

RUN r -e 'tinytex::tlmgr_install(pkgs = c("changepage", \ 
    "ucs", \
    "marvosym", \
    "lineno", \
    "microtype", \
    "xcolor", \
    "colortbl", \
    "lastpage", \
    "fancyhdr", \
    "forarray", \
    "xstring", \
    "ec"))'
    
LABEL maintainer='D. Nüst <daniel.nuest@uni-muenster.de>' \
  org.opencontainers.image.authors='Nüst (daniel.nuest@uni-muenster.de), Sochat, Marwick, Eglen, Head, Hirst, and Evans' \
  org.opencontainers.image.url='https://github.com/nuest/ten-simple-rules' \
  org.opencontainers.image.documentation='https://nuest.github.io/ten-simple-rules-dockerfiles/ten-simple-rules-dockerfiles.pdf' \
  org.opencontainers.image.version='1.0.0'

# Usage instructions:
# $ docker build -t ten-simple-rules-dockerfiles .
# $ docker run --interactive --rm --name tensimpledockerfiles --user $UID --volume $(pwd):/tsrd ten-simple-rules-dockerfiles Rscript -e 'setwd("/tsrd"); rmarkdown::render("ten-simple-rules-dockerfiles.Rmd")'
