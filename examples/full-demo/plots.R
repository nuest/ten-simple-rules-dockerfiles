# read data
data <- read.csv("data.csv")

# save in other format, based on https://cran.r-project.org/web/packages/RNetCDF/RNetCDF.pdf
library("RNetCDF")
nc <- create.nc("/output/data.nc")

dim.def.nc(nc, "station", dimlength = as.numeric(Sys.getenv("DATA_SIZE")))
dim.def.nc(nc, "max_string_length", 32)
var.def.nc(nc, "name", "NC_CHAR", c("max_string_length", "station"))

print(data$name)
var.put.nc(nc, "name", as.character(data$name))
close.nc(nc)
list.files("/output/")

# plot it
dir.create("figures")
pdf("figures/mainplot.pdf")
plot(data)
dev.off()
cat("Done\n")
