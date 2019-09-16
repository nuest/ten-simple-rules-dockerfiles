ten-simple-rules-dockerfiles.pdf: ten-simple-rules-dockerfiles.Rmd
	Rscript -e 'rmarkdown::render("$<")'


