# Dockerfile revision example

This example is based on two Dockerfiles from https://github.com/nuest/docker-qgis-model.
The files are published under the Apache License 2.0, are presented/used in a [peer reviewed publication](https://doi.org/10.3390/rs9030290), and are archived [on Zenodo](https://doi.org/10.5281/zenodo.168370) together with the actual image files.

The Docker image captures a complex and intricate combination of specific versions of a number of open source tools for Geospatial Object Based Image Analysis (GEOBIA).

## Review and changes

- Re-integrate two images into one: the multiple options are by now an artifact of the creation process, but can be simplified for the actual use.
  - Base image: https://github.com/nuest/docker-qgis-model/blob/master/ubuntu/Dockerfile.xenial
  - Derived image: https://github.com/nuest/docker-qgis-model/blob/master/workspace/example/Dockerfile
- Remove `MAINTAINER` and add `LABEL` with additional metadata, at the end of the Dockerfile
- Explicitly mention the image registry (i.e., starting image name with `docker.io/`)

Note the image must be built in the directory `docker-qgis-model/workspace/example/`:

```bash
git clone https://github.com/nuest/docker-qgis-model.git
docker build --tag qgis-model-ten-rules --file Dockerfile docker-qgis-model/workspace/example/
```

The build _does not work_ because of broken packages:

```
E: Unable to correct problems, you have held broken packages.
The command '/bin/sh -c apt-get update     && apt-get install -qqy --no-install-recommends         gdal-bin         python-gdal         python-scipy         python-numpy         python-shapely         qgis=$QGIS_VERSION         qgis-providers=$QGIS_VERSION         python-qgis-common=$QGIS_VERSION         python-qgis=$QGIS_VERSION         xvfb         tree     && apt-get clean     && rm -rf /var/lib/apt/lists/*' returned a non-zero code: 100
```
