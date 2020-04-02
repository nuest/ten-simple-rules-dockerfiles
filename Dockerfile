FROM rocker/verse:3.6.2
# docker build -t ten-simple-rules .

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
    
LABEL maintainer="daniel.nuest@uni-muenster.de" \
  org.opencontainers.image.created='2019' \
  org.opencontainers.image.authors='Nüst, Sochat, Marwick, Eglen, Head, and Hirst' \
  org.opencontainers.image.url='https://github.com/nuest/ten-simple-rules-dockerfiles'

# Usage instructions:
# $ docker build -t ten-simple-rules-dockerfiles .
# $ docker run --interactive --rm --name tensimpledockerfiles --user $UID --volume $(pwd):/tsrd ten-simple-rules-dockerfiles Rscript -e 'setwd("/tsrd"); rmarkdown::render("ten-simple-rules-dockerfiles.Rmd")'
