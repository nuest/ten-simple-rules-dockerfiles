# Dockerfile revision example

This Dockerfile was published as part of a large (> 2 GB) supplemental material packages at https://science.sciencemag.org/content/suppl/2020/04/22/368.6489.420.DC1 for the report [The spatial structure of Phanerozoic marine animal diversity](https://science.sciencemag.org/content/368/6489/420.full) published in Science.

The Dockerfile and the documentation are already in a very good state, including estimates for execution time given example hardware and how to reduce execution time.
Only small changes were made:

- Add commmands from README to the file to the end of the Dockerfile
  - Using more unique name for image
  - Use long version of build parameters
  - Adjust instructions to match the folder structure found in the ZIP archive from the supplemental material
- Add a few more docs
- Add `LABEL`s
- Add examples for running just the process

Build and execute container:

```bash
# 1. Download and unzip https://science.sciencemag.org/highwire/filestream/743688/field_highwire_adjunct_files/1/aay8309_DataS1.zip
# 2. Build the Dockerfile, see docs at the end of Dockerfile
# 3. Go to directory ../aay8309_DataS1/Code-for-Close-et-al-The-spatial-structure-of-Phanerozoic-marine-animal-diversity/
```