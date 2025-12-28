# example R options set globally
options(width = 60)

# example chunk options set globally
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE,
  fig.align = 'center',
  fig.width = 6,
  fig.height = 6,
  out.width = "100%",
  out.height = "100%",
  dpi=300
)

# Load required libraries for all chapters
suppressMessages(library(Seurat))
suppressMessages(library(SCpubr))

# Helper: consistent plot theme for all SCpubr plots
scpubr_theme <- function() {
  ggplot2::theme_minimal(base_size = 12) +
    ggplot2::theme(legend.position = "right")
}
