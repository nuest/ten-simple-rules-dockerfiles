FROM rocker/verse:3.6.1
# docker build -t ten-simple-rules .
RUN apt-get update && \
    tlmgr install changepage \
                  ucs  \
                  marvosym \
                  lineno \
                  microtype \
                  xcolor \
                  colortbl \
                  lastpage \
                  fancyhdr \
                  forarray \
                  xstring && \
                  tlmgr path add
