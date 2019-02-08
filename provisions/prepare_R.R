#!/usr/bin/env Rscript

# CRAN 
#----------------------------------------
packages <- c(
              "data.table",
              "RColorBrewer",
              "tidyverse",
              "devtools",
              "BiocManager"
              )
install.packages(packages)

# github
#----------------------------------------
library(devtools)
repositories <- c(
                  "jjlinscientist/useful",
                  "jeffbhasin/handy",
                  "mariodeng/FirebrowseR"
                  )
lapply(repositories, install_github)

# Bioconductor
#----------------------------------------
library("BiocManager")
BiocPackages <- c(
                  "rtracklayer",
                  "biomaRt"
                  )
BiocManager::install(BiocPackages)

