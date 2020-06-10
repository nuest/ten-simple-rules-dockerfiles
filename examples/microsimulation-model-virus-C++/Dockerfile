# Dockerfile vor covid-sim analysis https://github.com/mrc-ide/covid-sim
FROM docker.io/debian:buster AS build

# Install system dependencies, keep in sync with covid-sim/ci/install_dependencies.sh 
RUN apt-get update && \
  apt-get install -y cmake make g++ python3

WORKDIR /src

COPY . .

WORKDIR /src/build

RUN cmake .. \
    && make

# This allows for building a release without having to potentially re-run the tests.
FROM docker.io/debian:buster-slim AS release

# Install runtime dependencies.
RUN apt-get update \
    && apt-get install -y --no-install-recommends libgomp1 \
      python3 \
    && apt-get clean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Copy software from previous build stage
COPY --from=build /src/build/src/CovidSim /usr/bin/.
COPY data /data/input

# Run the model by default
ENTRYPOINT ["/usr/bin/CovidSim"]

# Use a multi-stage build phase to run the tests of the previously installed software
FROM build AS test

WORKDIR /src/build

ARG SKIP_TESTS=""
RUN if [ -z ${SKIP_TESTS} ] ; then \
    pwd \
      && ls -l \
      && make test ARGS="-V" ; \
  else echo 'Skipping tests!' ; fi

# This ensures that the default behavior is to run the tests and then create a release
FROM release

LABEL maintainer="Matthew Gretton-Dann" \
  org.opencontainers.image.authors="https://github.com/mrc-ide/covid-sim/graphs/contributors" \
  org.opencontainers.image.url="https://github.com/mrc-ide/covid-sim"

### Build (including execution of tests, ~ 15 minutes of build time)
# docker build --tag covid-sim:$(git rev-parse --short HEAD) .
### Build (skipping tests)
# docker build --tag covid-sim:$(git rev-parse --short HEAD) --build-arg SKIP_TESTS=1 .
### Run sample script
# docker run --rm -it --entrypoint /bin/bash covid-sim:92fa33a ./data/input/run_sample.py United_Kingdom
