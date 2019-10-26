# ten-simple-rules-dockerfiles

Ten simple rules for using Dockerfiles for reproducible research

## Run container for editing the document

First, build the container. It will install the dependencies that you
need for compiling the LaTex.

```bash
$ docker build -t ten-simple-rules .
```

Then run it! You'll need to set a password to login with user "rstudio."

```bash
PASSWORD=<YOUR_PASS>
docker run --rm -it -p 8787:8787 -e PASSWORD=$PASSWORD -v $(pwd):/home/rstudio/ten-simple-rules-dockerfiles ten-simple-rules
```

Open http://localhost:8787 to get RStudio and navigate to the directory `~/ten-simple-rules-dockerfiles` to open the `Rmd` file and start editing.
Use the "Knit" button to render the PDF.
The first rendering takes a bit longer, because required LaTeX packages must be installed.

See more options [in the Rocker docs](https://github.com/rocker-org/rocker-versioned/blob/master/rstudio/README.md#additional-configuration-options).

## Run container for building the PDF

```bash
# first run (installs LaTex packages > takes some time)
docker run -i --name tensimpledockerfiles -v $(pwd):/ten-simple-rules-dockerfiles rocker/verse:latest Rscript -e 'setwd("/ten-simple-rules-dockerfiles"); rmarkdown::render("ten-simple-rules-dockerfiles.Rmd")'

# subsequent runs
docker start -i tensimpledockerfiles
```
