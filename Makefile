default: edit

ten-simple-rules-dockerfiles.pdf: ten-simple-rules-dockerfiles.Rmd
	Rscript -e 'rmarkdown::render("$<")'

edit:
	docker run --rm -it -p 8787:8787 -e PASSWORD=simple -v $(shell pwd):/home/rstudio/ten-simple-rules-dockerfiles ten-simple-rules-dockerfiles


