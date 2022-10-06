# Box plots



Deep intro goes here.

## Basic usage.

To generate a basic box plot you need to provide the seurat object and a feature to plot:


```r
# Basic box plot.
p <- SCpubr::do_BoxPlot(sample = sample,
                        feature = "nCount_RNA")
p
```

<div class="figure" style="text-align: center">
<img src="11-BoxPlots_files/figure-html/unnamed-chunk-2-1.png" alt="Basic box plot." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-2)Basic box plot.</p>
</div>
By default, the groups are the identities in the seurat object, but this can be controlled using `group.by parameter`.


```r
# Generate a custom group.
sample$custom_group = ifelse(colnames(sample) %in% sample(colnames(sample), 4000), "A", "B")

# Use custom grouping.
p <- SCpubr::do_BoxPlot(sample = sample,
                        feature = "nCount_RNA",
                        group.by = "custom_group")
p
```

<div class="figure" style="text-align: center">
<img src="11-BoxPlots_files/figure-html/unnamed-chunk-3-1.png" alt="Custom groups." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-3)Custom groups.</p>
</div>

We can flip the plot if needed with `flip = TRUE`:


```r
# Flip the box plot.
p <- SCpubr::do_BoxPlot(sample = sample,
                        feature = "nCount_RNA",
                        flip = TRUE)
p
```

<div class="figure" style="text-align: center">
<img src="11-BoxPlots_files/figure-html/unnamed-chunk-4-1.png" alt="Flip the box plot." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-4)Flip the box plot.</p>
</div>

We can also apply another aesthetic style, which just colors the lines of the boxplots and leave the rest white with `use_silhouette = TRUE`:


```r
# Use silhouette style.
p <- SCpubr::do_BoxPlot(sample = sample,
                        feature = "nCount_RNA",
                        use_silhouette = TRUE)
p
```

<div class="figure" style="text-align: center">
<img src="11-BoxPlots_files/figure-html/unnamed-chunk-5-1.png" alt="Apply silhouette style." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-5)Apply silhouette style.</p>
</div>

We can reorder the values by their average mean, from highest to lowest with `order = TRUE`:


```r
# Order by mean values.
p <- SCpubr::do_BoxPlot(sample = sample,
                        feature = "nCount_RNA",
                        order = TRUE)
p
```

<div class="figure" style="text-align: center">
<img src="11-BoxPlots_files/figure-html/unnamed-chunk-6-1.png" alt="Order by mean." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-6)Order by mean.</p>
</div>

We can further apply a second grouping by using `split.by`.


```r
# Apply second grouping.
p <- SCpubr::do_BoxPlot(sample = sample,
                        feature = "nCount_RNA",
                        split.by = "custom_group")
p
```

<div class="figure" style="text-align: center">
<img src="11-BoxPlots_files/figure-html/unnamed-chunk-7-1.png" alt="Apply a second grouping." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-7)Apply a second grouping.</p>
</div>

Finally we can apply statistical tests to the groups, if we do not use `split.by`. We can do that by setting `use_test = TRUE` and providing the comparison as a list of pairs of items. The test, by default is wilcoxon test, but can be modified using `test`. *The correct use of such tests and their interpretation relies on the user*.


```r
# Apply statistical tests.
p <- SCpubr::do_BoxPlot(sample = sample,
                        feature = "nCount_RNA",
                        use_test = TRUE,
                        comparisons = list(c("0", "1"),
                                           c("3", "4"),
                                           c("5", "9")))
p
```

<div class="figure" style="text-align: center">
<img src="11-BoxPlots_files/figure-html/unnamed-chunk-8-1.png" alt="Apply statistical tests." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-8)Apply statistical tests.</p>
</div>

One can display this on symbols, or with numbers with `map_signif_level`:


```r
# Apply statistical tests and show the p-value.
p <- SCpubr::do_BoxPlot(sample = sample,
                        feature = "nCount_RNA",
                        use_test = TRUE,
                        comparisons = list(c("0", "1"),
                                           c("3", "4"),
                                           c("5", "9")),
                        map_signif_level = FALSE)
p
```

<div class="figure" style="text-align: center">
<img src="11-BoxPlots_files/figure-html/unnamed-chunk-9-1.png" alt="Apply statistical tests and show the p-value" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-9)Apply statistical tests and show the p-value</p>
</div>
