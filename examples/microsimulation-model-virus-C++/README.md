# Dockerfile revision example

The original Dockerfile from https://github.com/mrc-ide/covid-sim/blob/master/Dockerfile is authored by members of the MRC Centre for Global Infectious Disease Analysis and published under GNU General Public License v3.0.
See the project README.md for [details on licensing](https://github.com/mrc-ide/covid-sim#copyright-and-licensing).

This Dockerfile does some nice tricks with a multi-stage build.
Note the Dockerfile needs to be built with the wording directory in the original source repository, and that the sample script does not run successfully.

```bash
git clone https://github.com/mrc-ide/covid-sim
docker build --tag covid-sim-ten-simple --file Dockerfile covid-sim/
```

## Review and changes

- The original Dockerfile uses a multi-stage build, which I kept, though the size reduction between `debian` and `debian..-slim` is probably not crazy.
- Use named version of Debian release, `debian:buster`
- Explicitly mention the image registry (i.e., starting image name with `docker.io/`)
- Added more documentation, e.g., link to GitHub repo
- The external file `install_dependencies.sh` is used to flexibly install required system dependencies across many platforms, which is a reasonable requirement given the use case; however, for a more transparent data science workflow, I'll follow the rules and integrated the two lines of code matching the used Linux distro.
- Moved the system dependency installation before the copy step (only works because of previous change)
- The multi-stage build nicely takes advantage of running tests as part of the build and then falling back to the configuration of the `release` stage > kept in the example though it adds complexity and build time
- Added a buil argument to skip tests, so the image becomes easier to rebuild and could be used for the actual development of the workflow, not just for documentation/demonstration
- Added labels
- Added usage instructions
