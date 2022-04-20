options(repos = list(CRAN="http://cran.rstudio.com/"))
install.packages(c("data.table",
                   "ggplot2",
                   "cowplot",
                   "devtools",
                   "fpc"))

devtools::install_github("sinomem/QCtreeCNV")

if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("VariantAnnotation")
