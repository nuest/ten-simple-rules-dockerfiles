# Teaching VM

This Dockerfile is used for distributing and deploying a teaching environment as part of the course [TM351 at The Open University](http://www.open.ac.uk/courses/modules/tm351) on data management and data analytics.
It was authored by Tony Hirst [@psychemedia](https://github.com/psychemedia)).
License information is currently missing (see [related issue](https://github.com/innovationOUtside/tm351vm/issues/30)).

## Review and changes

- The Dockerfile was based on a self-managed "minimal" base image, see [base Dockerfile](Base image: https://github.com/innovationOUtside/tm351vm/blob/master/build/minimal/Dockerfile), which was actually not that long, so I reintegrated them
- replaced the deprecated `MAINTAINER` instruction
- removed `apt-get autoremove` commands at beginning of base image
- use `COPY` instead of `ADD` for adding files to the image because of clearer semantics
- put cleanup of OpenRefine installation in the same layer as the installation itself
- use `WORKDIR` instead of `RUN mkdir -p` because of clearer semantics
- use an `ENV` for the exposed port, move exposed port closer to the command running the tool behind the port
- removed `--rm` from `docker build` commands, as it is the default
- use long argument form `--tag` in usage instructions
- Integrated the [OpenRefine installation script `openrefine.sh`](https://github.com/innovationOUtside/tm351vm/blob/master/build/openrefine/openrefine.sh) (see local copy of file) because once the "not a Docker build" option was removed, the echo statements were left out, an chown with an non-existing user `$OPENREFINE_USER` was left out, the `openrefine.done` hack was skipped, and the mkdir statements of already existing directories were skipped... not that much code was left; _IMO:_ this script suffered from the dual use outside and inside a container, or more likely dual use for Vagrant and Docker
- Added `OPENREFINE_VERSION` as `ENV` so that version is only defined in one spot, there even was a mismatch between the downloaded version and the one in `CMD` (inconsistency between `openrefine.sh` and `Dockerfile.original`)
- Moved all system dependencies into one layer, used more extensive cleaning up commands for apt-get
- Skipped installation of `apt-show-versions`, since undocumented and usage unclear; `dpkg -l` still available in the container
- Using default USER, though potentially the `oustudent` users with id `100` is really needed for the image to be deployed in the target infrastructure, see also [`settings.sh`](https://github.com/innovationOUtside/tm351vm/blob/master/build/base/settings.sh) in the repo
- Use `WORKDIR` instead of `mkdir -p` for working directory
- Don't download to `/root` (may cause problems if ported to Singularity)
