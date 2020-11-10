# Ten Simple Rules for Writing Dockerfiles for Reproducible Data Science

<img alt="Ten Simple Rules for Writing Dockerfiles for Reproducible Research - Summary" src="https://raw.githubusercontent.com/nuest/ten-simple-rules-dockerfiles/master/figures/summary.png" width="30%" align="right">

[![Article DOI](https://img.shields.io/badge/Article-10.1371%2Fjournal.pcbi.1008316-yellow)](https://doi.org/10.1371/journal.pcbi.1008316)

[![Preprint DOI](https://img.shields.io/badge/Preprint-10.31219%2Fosf.io%2Ffsd7t-blue)](https://doi.org/10.31219/osf.io/fsd7t)

The manuscript is published as a preprint: **[https://osf.io/fsd7t](https://osf.io/fsd7t)**

We welcome your feedback, e.g., by opening issues on this repository or with [OSF annotations](https://help.osf.io/hc/en-us/articles/360019738554-Annotate-a-Preprint).
We especially welcome your help by creating strong illustrating examples, see [issue #4](https://github.com/nuest/ten-simple-rules-dockerfiles/issues/4).

[Ten Simple Rules Collection on PLOS](https://collections.plos.org/ten-simple-rules)

[Current draft as PDF](https://nuest.github.io/ten-simple-rules-dockerfiles/ten-simple-rules-dockerfiles.pdf)

## Author contributions
<!--PLOS asked to remove this from the manuscript-->

DN conceived the idea and contributed to conceptualisation, methodology, and writing - original draft, review & editing, and validation.
VS contributed to conceptualisation, methodology, and writing - original draft, and review & editing.
BM contributed to writing – review & editing.
SJE contributed to conceptualisation, writing – review & editing, and validation.
THe contributed to conceptualisation.
THi contributed to writing – review & editing.
BDE contributed to conceptualisation, writing – review & editing, visualisation, and validation.
This articles was written collaboratively on GitHub, where [contributions in form of text or discussions comments](https://github.com/nuest/ten-simple-rules-dockerfiles/graphs/contributors) are documented: [https://github.com/nuest/ten-simple-rules-dockerfiles/](https://github.com/nuest/ten-simple-rules-dockerfiles/).

## Run container for editing the document

First, build the container. It will install the dependencies that you
need for compiling the LaTex.

```bash
docker build -t ten-simple-rules-dockerfiles .
```

Then run it! You'll need to set a password to login with user "rstudio."

```bash
PASSWORD=simple
docker run --rm -it -p 8787:8787 -e PASSWORD=$PASSWORD -v $(pwd):/home/rstudio/ten-simple-rules-dockerfiles ten-simple-rules-dockerfiles
```

Open http://localhost:8787 to get to RStudio, log in, and navigate to the directory `~/ten-simple-rules-dockerfiles` to open the `Rmd` file and start editing.
Use the "Knit" button to render the PDF.
The first rendering takes a bit longer, because required LaTeX packages must be installed.

See more options [in the Rocker docs](https://github.com/rocker-org/rocker-versioned/blob/master/rstudio/README.md#additional-configuration-options).

## Run container for building the PDF

See the end of the `Dockerfile` for instructions.

## Useful snippets

- Get all author's GitHub handles:
  ```bash
  cat *.Rmd | grep ' # https://github.com/' | sed 's|    # https://github.com/|@|'
  ```
- Get all author's emails:
  ```bash
  cat *.Rmd | grep 'email:' | sed 's|    email: ||'
  ```
- [Work in progress!] Get a `.docx` file out of the Rmd so one can compare versions and generate marked-up copies of changes:
  ```r
  # https://github.com/davidgohel/officedown
  library("officedown")
  rmarkdown::render("ten-simple-rules-dockerfiles.Rmd", output_format = officedown::rdocx_document(), output_file = "tsrd.docx")
  
  # https://noamross.github.io/redoc/articles/mixed-workflows-with-redoc.html
  library("redoc")
  rmarkdown::render("ten-simple-rules-dockerfiles.Rmd", output_format = redoc::redoc(), output_file = "tsrd.docx")
  ```
- Compare with `latexdiff`
  ```bash
  # get a specific version of the text file
  wget -O submission.v2.tex https://raw.githubusercontent.com/nuest/ten-simple-rules-dockerfiles/submission.v2/ten-simple-rules-dockerfiles.tex
  # compare it with current version
  latexdiff --graphics-markup=2 submission.v2.tex ten-simple-rules-dockerfiles.tex > diff.tex
  # render diff.tex with RStudio
  ```

## License

This manuscript is published under a [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/) (CC BY 4.0) license, see file [LICENSE.md](LICENSE.md).
