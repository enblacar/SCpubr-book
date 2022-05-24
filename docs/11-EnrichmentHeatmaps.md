# Enrichment score heatmaps

A very common approach to make sense of your cells is to query several list of marker genes, retrieved from literature, and compute how enriched each cell is in each given list of genes. This is achieved by using `Seurat::AddModuleScore`. The scores can be then visualized as a Feature plot, but one can also aggregate the enrichment scores by any variable of interest, for instance the different clusters in the sample.



This kind of heatmaps can be easily computed using `SCpubr::do_EnrichmentHeatmap()`:

## Single grouping variable


```r
genes <- list("Naive CD4+ T" = c("IL7R", "CCR7"),
              "CD14+ Mono" = c("CD14", "LYZ"),
              "Memory CD4+" = c("S100A4"),
              "B" = c("MS4A1"),
              "CD8+ T" = c("CD8A"),
              "FCGR3A+ Mono" = c("FCGR3A", "MS4A7"),
              "NK" = c("GNLY", "NKG7"),
              "DC" = c("FCER1A", "CST3"),
              "Platelet" = c("PPBP"))

p <- SCpubr::do_EnrichmentHeatmap(sample = sample,
                                  list_genes = genes)
p
```

<div class="figure" style="text-align: center">
<img src="11-EnrichmentHeatmaps_files/figure-html/unnamed-chunk-2-1.png" alt="SCpubr::do_EnrichmentHeatmap with default parameters." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-2)SCpubr::do_EnrichmentHeatmap with default parameters.</p>
</div>
By default, `SCpubr::do_EnrichmentHeatmap` aggregates the values by the current identity. However, other metadata variables can be used to aggregate for. For this, provide the name to `group.by` parameter.


```r
# Custom aggregated values.
p <- SCpubr::do_EnrichmentHeatmap(sample = sample,
                                  list_genes = genes,
                                  group.by = "orig.ident")
p
```

<div class="figure" style="text-align: center">
<img src="11-EnrichmentHeatmaps_files/figure-html/unnamed-chunk-3-1.png" alt="SCpubr::do_EnrichmentHeatmap with custom aggregation." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-3)SCpubr::do_EnrichmentHeatmap with custom aggregation.</p>
</div>

The matrix can be transposed using `transpose = TRUE`.


```r
# Transposing the matrix.
p <- SCpubr::do_EnrichmentHeatmap(sample = sample,
                                  list_genes = genes,
                                  transpose = TRUE)
p
```

<div class="figure" style="text-align: center">
<img src="11-EnrichmentHeatmaps_files/figure-html/unnamed-chunk-4-1.png" alt="SCpubr::do_EnrichmentHeatmap transposed matrix." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-4)SCpubr::do_EnrichmentHeatmap transposed matrix.</p>
</div>


Both rows and column names can be rotated using `column_names_rot`  and `row_names_rot` parameters, providing the desired angle.


```r
# Rotating the labels.
p <- SCpubr::do_EnrichmentHeatmap(sample = sample,
                                  list_genes = genes,
                                  transpose = TRUE,
                                  column_names_rot = 0)
p
```

<div class="figure" style="text-align: center">
<img src="11-EnrichmentHeatmaps_files/figure-html/unnamed-chunk-5-1.png" alt="SCpubr::do_EnrichmentHeatmap transposed matrix different angle for column names." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-5)SCpubr::do_EnrichmentHeatmap transposed matrix different angle for column names.</p>
</div>

## Multiple grouping variables
One can further split the output heatmap into several according to a second metadata variable. This is achieved by using `split.by` parameter.


```r
sample$modified_orig.ident <- sample(x = c("Sample_A", "Sample_B", "Sample_C"), 
                                     size = ncol(sample), 
                                     replace = T, 
                                     prob = c(0.2, 0.7, 0.1))

# Splitting by a second metadata variable.
p <- SCpubr::do_EnrichmentHeatmap(sample = sample,
                                  list_genes = genes,
                                  transpose = TRUE,
                                  column_names_rot = 0,
                                  split.by = "modified_orig.ident")
p
```

<div class="figure" style="text-align: center">
<img src="11-EnrichmentHeatmaps_files/figure-html/unnamed-chunk-6-1.png" alt="SCpubr::do_EnrichmentHeatmap transposed matrix using split.by." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-6)SCpubr::do_EnrichmentHeatmap transposed matrix using split.by.</p>
</div>


By default, heatmaps are joined horizontally. If you want them joined vertically, use `split.horizontal = FALSE`


```r
# Splitting by a second metadata variable and joining vertically.
p <- SCpubr::do_EnrichmentHeatmap(sample = sample,
                                  list_genes = genes,
                                  transpose = TRUE,
                                  column_names_rot = 0,
                                  split.by = "modified_orig.ident",
                                  split.horizontal = FALSE)
p
```

<div class="figure" style="text-align: center">
<img src="11-EnrichmentHeatmaps_files/figure-html/unnamed-chunk-7-1.png" alt="SCpubr::do_EnrichmentHeatmap transposed matrix using split.by joined vertically." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-7)SCpubr::do_EnrichmentHeatmap transposed matrix using split.by joined vertically.</p>
</div>

## Changing the color scale.

If one wants to change the color scale of the heatmap, this can be accomplished by providing a two-color vector to `colors.use`. 


```r
# Modifying the color scale.
p <- SCpubr::do_EnrichmentHeatmap(sample = sample,
                                  list_genes = genes,
                                  transpose = TRUE,
                                  column_names_rot = 0,
                                  split.by = "modified_orig.ident",
                                  colors.use = colortools::opposite("steelblue", plot = F))
p
```

<div class="figure" style="text-align: center">
<img src="11-EnrichmentHeatmaps_files/figure-html/unnamed-chunk-8-1.png" alt="SCpubr::do_EnrichmentHeatmap transposed matrix using split.by changing the color scale." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-8)SCpubr::do_EnrichmentHeatmap transposed matrix using split.by changing the color scale.</p>
</div>

