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
