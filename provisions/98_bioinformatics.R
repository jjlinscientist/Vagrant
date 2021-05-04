#!/usr/bin/env Rscript

# Bioconductor
# ============================================================= 
install.packages("BiocManager")
library("BiocManager")


# Bioconductor packages
# ============================================================= 
BiocPackages <- c(
                  "rtracklayer",
                  "biomaRt"
                  )
BiocManager::install(BiocPackages)

# github
# ============================================================= 
library(devtools)
repositories <- c(
                  # "mariodeng/FirebrowseR",
                  "jeffbhasin/handy"
                  )
lapply(repositories, install_github)             

