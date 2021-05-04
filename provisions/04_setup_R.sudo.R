#!/usr/bin/env Rscript

# CRAN 
#----------------------------------------
packages <- c(
              "RColorBrewer",
              "BiocManager",
              "data.table",
              "tidyverse",
              "devtools"
              )
install.packages(packages)

# github
#----------------------------------------
library(devtools)
repositories <- c(
                  "jjlinscientist/useful",
                  "jalvesaq/colorout"
                  )
lapply(repositories, install_github)
