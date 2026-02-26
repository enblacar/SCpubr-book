# example R options set globally
options(width = 60)

# example chunk options set globally
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE,
  fig.align = 'center',
  fig.width = 12,
  fig.height = 12,
  dpi = 300
)

# Load required libraries for all chapters
suppressMessages(library(Seurat))
suppressMessages(library(SCpubr))
suppressMessages(library(ggplot2))
suppressMessages(library(patchwork))

# Load the sample dataset
# ATRT single-nucleus RNA-seq data from Blanco-Carmona et al. (2025)
# DOI: 10.1093/neuonc/noaf179 | PMID: 40726147
sample <- readRDS("/Users/eblanco/Desktop/Projects/CLUSTER_CHECK/ATRT_data/ATRT_RNA.rds")
