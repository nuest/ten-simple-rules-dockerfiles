# ten-simple-rules-dockerfiles

Ten simple rules for using Dockerfiles for reproducible research

## Run container for editing the document

```bash
docker run --rm -it -p 8787:8787 -e DISABLE_AUTH=true -v $(pwd):/home/rstudio/ten-simple-rules-dockerfiles rocker/verse:latest
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
