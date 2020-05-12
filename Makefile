default: edit

ten-simple-rules-dockerfiles.pdf: ten-simple-rules-dockerfiles.Rmd
	Rscript -e 'rmarkdown::render("$<")'

edit:
	PASSWORD=simple
	docker run --rm -it -p 8787:8787 -e PASSWORD=$PASSWORD -v $(shell pwd):/home/rstudio/ten-simple-rules-dockerfiles ten-simple-rules-dockerfiles


