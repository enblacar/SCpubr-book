# Installation guide {-}

This package can be installed using the following commands:

```r
# From CRAN:
# Future sumission to CRAN.

# From GitHub.
if(!requireNamespace("devtools", quietly = T)){
  install.packages("devtools") # If not installed.
}
devtools::install_github("enblacar/SCpubr")

```


Further packages are needed in order to run the different functions:

- [colortools](https://github.com/gastonstat/colortools)
- [ComplexHeatmap](https://bioconductor.org/packages/release/bioc/html/ComplexHeatmap.html)
- [dplyr](https://dplyr.tidyverse.org/)
- [enrichR](https://cran.r-project.org/web/packages/enrichR/vignettes/enrichR.html)
- [forcats](https://forcats.tidyverse.org/index.html)
- [ggbeeswarm](https://cran.r-project.org/web/packages/ggbeeswarm/index.html)
- [ggExtra](https://cran.r-project.org/web/packages/ggExtra/vignettes/ggExtra.html)
- [ggplot2](https://ggplot2.tidyverse.org/)
- [ggrastr](https://cran.r-project.org/web/packages/ggrastr/vignettes/Raster_geoms.html)
- [ggrepel](https://cran.r-project.org/web/packages/ggrepel/vignettes/ggrepel.html)
- [ggtext](https://github.com/wilkelab/ggtext)
- [ggplotify](https://cran.r-project.org/web/packages/ggplotify/index.html)
- [Matrix](https://cran.r-project.org/web/packages/Matrix/index.html)
- [Nebulosa](http://bioconductor.org/packages/release/bioc/html/Nebulosa.html)
- [patchwork](https://patchwork.data-imaginist.com/)
- [pbapply](https://cran.rstudio.com/web/packages/pbapply/index.html)
- [purrr](https://purrr.tidyverse.org/)
- [rlang](https://cran.r-project.org/web/packages/rlang/index.html)
- [scales](https://cran.r-project.org/web/packages/scales/index.html)
- [Seurat](https://satijalab.org/seurat/index.html)
- [stringr](https://cran.r-project.org/web/packages/stringr/index.html)
- [svglite](https://cran.r-project.org/web/packages/svglite/index.html)
- [tidyr](https://tidyr.tidyverse.org/)
- [viridis](https://cran.r-project.org/web/packages/viridis/index.html)


All packages can be installed using the following commands:


```r
# Install CRAN packages.
cran_packages <- c("colortools",
                   "dplyr",
                   "enrichR",
                   "forcats",
                   "ggbeeswarm",
                   "ggExtra",
                   "ggplot2",
                   "ggrepel",
                   "ggplotify",
                   "ggtext",
                   "Matrix",
                   "patchwork",
                   "purrr",
                   "rlang",
                   "scales",
                   "Seurat",
                   "stringr",
                   "svglite",
                   "tidyr",
                   "viridis")
install.packages(cran_packages)

# Install bioconductor packages.
bioconductor_packages <- c("ComplexHeatmap", 
                           "Nebulosa")
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install(bioconductor_packages)

# Install github packages.
github_packages <- c("saezlab/liana")

if (!requireNamespace("remotes", quietly = TRUE))
    install.packages("remotes")

remotes::install_github(github_packages)
```

If interested in running only a subset of functions, `SCpubr::state_dependencies()` outputs the different packages and their sources needed for each of the functions.


```r
# Will return the package dependencies for all functions.
SCpubr::state_dependencies()

# Will return the package dependencies for selected functions.
SCpubr::state_dependencies(func_name = c("do_DimPlot", "do_Feature_Plot"))

# Will return the package dependencies of a single function.
SCpubr::state_dependencies(func_name = "do_DimPlot")
```
