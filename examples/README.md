# Dockerfile Examples

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3878583.svg)](https://doi.org/10.5281/zenodo.3878583)

## About

This directory contains `Dockerfile`s to demonstrate the application of the rules in [_Ten Simple _Ten Simple Rules for Writing Dockerfiles for Reproducible Data Science_](https://github.com/nuest/ten-simple-rules-dockerfiles/).
Each subdirectory contains an example consisting of a `README.md` with documentation, a `Dockerfile.before` showing the original as created by the author (optional), and a `Dockerfile` demonstrating the improvements made based on the articles rules.

**Note:** The `Dockerfile`s in this repository serve as examples, but should be used carefully as templates for new projects because, while it should be possible to build an image from them, they might not be up to date.
For example, base images might be outdated, because the historic original `Dockerfile` that was used as a basis for revision has not been changed in a while.

## License

Unless noted otherwise in the `README.md` file next to a `Dockerfile` or within any file, the contents of this repository are licensed under a [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/) (CC BY 4.0) license, see file [../LICENSE.md](LICENSE.md).

## Contributions welcome!

Do you have a `Dockerfile` used for data science and think it follows good practice?
Do you want your `Dockerfile` to be reviewed by someone else?
Did you update a `Dockerfile` based on the article's rules and can share your experiences?

_In any of these cases, please leave a comment on the [Examples issue](https://github.com/nuest/ten-simple-rules-dockerfiles/issues/4) - we welcome your input._

**Considerations for adding an example:**

- The `README.md` must include the source and license of the published Dockerfile, and the (original) authors; it should also include comments or notes, a few keywords or a descriptive abstract that searching the repository gives reasonable results; it may include a (colourised) diff output, if the changes between Dockerfiles were small
- The directory name should contain scientific domain (e.g. `neuroscience`, `sedimentology`) and the main workflow language(s) or tool(s) (e.g. `Python`, `R-tidyverse`, `pandas`)
- The `Dockerfile` should be buildable, but it is acceptable if it does run with the same set of features as the original, i.e., problems or issues of the resulting image may be fixed but also left as they are
