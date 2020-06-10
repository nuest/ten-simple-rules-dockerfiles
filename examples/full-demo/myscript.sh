#!/bin/bash

mkdir /output

python analysis.py
Rscript plots.R

cp data.csv /output/generated_data.csv

cd /output
java -jar /tmp/pdfbox-app-2.0.19.jar PDFToImage -imageType png /work/figures/mainplot.pdf

echo "Done!"
