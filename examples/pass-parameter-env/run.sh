#!/bin/bash
docker run \
  --env CONFIG_PARAM="/data/ten-simple-rules-dockerfiles.Rmd" \
  --volume $(pwd)/../..:/data \
  docker.io/nuest/ten-simple-rules-dockerfiles:latest \
  R --quiet -e "l = length(readLines(Sys.getenv('CONFIG_PARAM'))); print(paste('Number of lines: ', l))"
