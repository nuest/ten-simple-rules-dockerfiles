# Dockerfile Examples

## Contributions welcome!

Do you have a `Dockerfile` used for data science and think it follows good practice?
Do you want your `Dockerfile` to be reviewed by someone else?
Did you update a `Dockerfile` based on the article's rules and can share your experiences?

_In any of these cases, please leave a comment on the [Examples issue](https://github.com/nuest/ten-simple-rules-dockerfiles/issues/4) - we welcome your input._

------

## Structure

- each directory contains an example `Dockerfile` and a `README.md`; ideally, it also has a `Dockerfile.before` showing the original, as created by the author, while the `Dockerfile` shows the improvements made based on the Ten Simple Rules
- the `README.md` must include the source and license of the published Dockerfile, and the author; it should also include comments or notes, a few keywords or a descriptive abstract that searching the repository gives reasonable results; it may include a (colourised) diff output, if the changes between Dockerfiles were small
- the directory name should contain scientific domain (e.g. `neuroscience`, `sedimentology`) and the main workflow language(s) or tool(s) (e.g. `Python`, `R-tidyverse`, `pandas`)
- the `Dockerfile` should be buildable, but in may not run
