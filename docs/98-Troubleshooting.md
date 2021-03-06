# Troubleshooting {-}



This section aims to clarify and provide fixes to common errors that might appear due to external factors.


## Correcly defining the number of columns and rows in the legend {-}
Sometimes, when using `legend.ncol` or `legend.nrow` parameter across the functions in `SCpubr` that have them implemented, the output number of columns and rows will not reflect the number provided. This stands particularly true when using `legend.ncol`. This happens, apparently, due to some internal checks from `ggplot2` and, as of today, a solution to this has not been found. However, due to this reason, `legend.nrow` has been introduced, in an attempt to some of this cases by defining the total number of rows instead. However, normally these cases normally arise when the legend is being forced to have a very uneven number of items per row/column. Therefore, it is suggested to always generated **evenly distributed legends**. Here is a representative example:


```r
p1 <- SCpubr::do_DimPlot(sample, legend.ncol = 5)
p2 <- SCpubr::do_DimPlot(sample, legend.ncol = 8)
p3 <- SCpubr::do_DimPlot(sample, legend.ncol = 10)
p4 <- SCpubr::do_DimPlot(sample, legend.ncol = 8, legend.nrow = 2)
p5 <- SCpubr::do_DimPlot(sample, legend.nrow = 3)
p6 <- SCpubr::do_DimPlot(sample, legend.nrow = 7)
p1 / p2 / p3 / p4 / p5 / p6
```

<img src="98-Troubleshooting_files/figure-html/unnamed-chunk-2-1.png" width="100%" height="100%" style="display: block; margin: auto;" />

