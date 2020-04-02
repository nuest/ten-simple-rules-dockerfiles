# Ten simple rules for Writing Dockerfiles for Reproducible Research

[Ten Simple Rules Collection on PLOS](https://collections.plos.org/ten-simple-rules)

[Current draft as PDF](https://nuest.github.io/ten-simple-rules-dockerfiles/ten-simple-rules-dockerfiles.pdf)

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

## License

This manuscript is published under a [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/) (CC BY 4.0) license, see file [LICENSE.md](LICENSE.md).
