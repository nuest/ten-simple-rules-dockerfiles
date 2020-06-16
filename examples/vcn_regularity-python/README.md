# Dockerfile revision example

The original Dockerfile from https://github.com/neural-reckoning/vcn_regularity/blob/master/Dockerfile and is authored by Dan Goodman ([@thesamovar](https://github.com/thesamovar)), and published under the MIT License.
The workflow is part of a [peer reviewed publication](https://doi.org/10.1016/j.heares.2017.09.010) and uses an image from the [Jupyter docker stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/) to run notebook-based interactive models in a browser with the [Binder](https://mybinder.org/) service.
In the original repository, the `environment.yml` file is used to install additional required dependencies, however a dummy file is used here. Consequently, the image does not build (and neither does the original now due to its dependence on deprecated packages). 

## Review and changes

- The original Dockerfile did not have usage instructions, which were only in the projects [README.md](https://github.com/neural-reckoning/vcn_regularity/blob/master/README.md)
- Explicitly mention the image registry (i.e., starting image name with `docker.io/`)
- Use double quotes around file paths including variables to prevent globbing and word splitting (conforming to hadolint).
