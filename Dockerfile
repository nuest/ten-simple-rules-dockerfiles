FROM rocker/verse:3.6.1
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
    "ec", \
    "zref"))'
