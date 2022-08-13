# Common features across plots {-}



This page aims to assess common functionalities present across the different functions in the package.

## Summary of the features {-}
Since this is going to be a very long and plot-rich section, here is a summary of the features and how to access it:

- **Changing the font size**: Use `font.size` parameter and provide a number.
- **Changing the font type**: Use `font.type` parameter and provide either *sans*, *mono* or *serif*.
- **Add plot titles, subtitles and captions**: Use `plot.title`, `plot.subtitle` and `plot.caption` parameters alongside a text to display.
- **Changing between legend types in continuous variables**: Use `legend.type` parameter and provide either *normal*, *colorbar* or *colorsteps*.
- **Relocate the legend**: Use `legend.position` parameter alongside *top*, *bottom*, *left* or *right*.
- **Changing the font size**: Use `font.size` parameter and provide a number.
- **Modify default colors**: Use `colors.use` for categorical variables and `viridis_color_map` for continuous (exceptions apply, see the corresponding subsection) and provide valid color representations or a valid viridis color map.
- **Plot borders around cells**: Use `plot_cell_borders` parameter alongside `border.size` and `border.color` to customise how it looks.



## Changing the font size. {-}
This can be achieved by using `font.size` parameter and works for all **ggplot2-based** plots.


```r
p <- SCpubr::do_DimPlot(sample) | 
     SCpubr::do_DimPlot(sample, 
                        font.size = 18)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-2-1.png" alt="SCpubr do_DimPlot increasing font.size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-2)SCpubr do_DimPlot increasing font.size.</p>
</div>


```r
p <- SCpubr::do_FeaturePlot(sample = sample,
                            features = "CD14") | 
     SCpubr::do_FeaturePlot(sample = sample, 
                            features = "CD14",
                            font.size = 18)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-3-1.png" alt="SCpubr do_FeaturePlot increasing font.size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-3)SCpubr do_FeaturePlot increasing font.size.</p>
</div>

```r
p <- SCpubr::do_NebulosaPlot(sample = sample,
                             features = "CD14") |
     SCpubr::do_NebulosaPlot(sample = sample,
                             features = "CD14",
                             font.size = 18)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-4-1.png" alt="SCpubr do_NebulosaPlot increasing font.size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-4)SCpubr do_NebulosaPlot increasing font.size.</p>
</div>


```r
p <- SCpubr::do_BeeSwarmPlot(sample = sample,
                             feature_to_rank = "PC_1",
                             group.by = "seurat_clusters") | 
     SCpubr::do_BeeSwarmPlot(sample = sample,
                             feature_to_rank = "PC_1",
                             group.by = "seurat_clusters",
                             font.size = 18)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-5-1.png" alt="SCpubr do_BeeSwarmPlot increasing font.size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-5)SCpubr do_BeeSwarmPlot increasing font.size.</p>
</div>



```r
p <- SCpubr::do_VlnPlot(sample = sample,
                        features = "CD14") /
     SCpubr::do_VlnPlot(sample = sample,
                        features = "CD14",
                        font.size = 18)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-6-1.png" alt="SCpubr do_VlnPlot increasing font.size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-6)SCpubr do_VlnPlot increasing font.size.</p>
</div>


```r
genes <- c("IL7R", "CCR7", "CD14", "LYZ", 
           "S100A4", "MS4A1", "CD8A", "FCGR3A", 
           "MS4A7", "GNLY", "NKG7", "FCER1A", 
           "CST3", "PPBP")
p <- SCpubr::do_DotPlot(sample = sample,
                        features = genes) | 
     SCpubr::do_DotPlot(sample = sample,
                        features = genes,
                        font.size = 18)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-7-1.png" alt="SCpubr do_DotPlot increasing font.size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-7)SCpubr do_DotPlot increasing font.size.</p>
</div>


```r
p <- SCpubr::do_BarPlot(sample = sample,
                        features = "seurat_clusters",
                        horizontal = T) | 
     SCpubr::do_BarPlot(sample = sample,
                        features = "seurat_clusters",
                        horizontal = T,
                        font.size = 18)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-8-1.png" alt="SCpubr do_BarPlot increasing font.size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-8)SCpubr do_BarPlot increasing font.size.</p>
</div>


```r
p <- SCpubr::do_TermEnrichmentPlot(genes = c("CD14", "LYN"),
                                   dbs_use = "GO_Biological_Process_2021",
                                   nterms = 2) |
     SCpubr::do_TermEnrichmentPlot(genes = c("CD14", "LYN"),
                                   dbs_use = "GO_Biological_Process_2021",
                                   nterms = 2,
                                   font.size = 18)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-9-1.png" alt="SCpubr do_TermEnrichmentPlot increasing font.size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-9)SCpubr do_TermEnrichmentPlot increasing font.size.</p>
</div>


```r
genes <- list("A" = Seurat::VariableFeatures(sample)[1:5],
              "B" = Seurat::VariableFeatures(sample)[6:10],
              "C" = Seurat::VariableFeatures(sample)[11:15],
              "D" = Seurat::VariableFeatures(sample)[16:20])

p <- SCpubr::do_CellularStatesPlot(sample = sample,
                                   gene_list = genes,
                                   x1 = "A",
                                   y1 = "B",
                                   x2 = "C",
                                   y2 = "D",
                                   enforce_symmetry = T) |
     SCpubr::do_CellularStatesPlot(sample = sample,
                                   gene_list = genes,
                                   x1 = "A",
                                   y1 = "B",
                                   x2 = "C",
                                   y2 = "D",
                                   enforce_symmetry = T,
                                   font.size = 18)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-10-1.png" alt="SCpubr do_CellularStatesPlot increasing font.size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-10)SCpubr do_CellularStatesPlot increasing font.size.</p>
</div>

## Change font type of the plots. {-}

Despite limited, it is possible to change the font type of the plots to either `sans`, `serif` or `mono`. Those are fonts installed by default in every system. Other font types need to be pre-installed in the user systems and, therefore, are not considered for this package. This can be achieved by providing `font.type = "mono"`, `font.type = "sans"` and `font.type = "serif"` to any **ggplot2-based** plot.   


```r
p <- SCpubr::do_DimPlot(sample, font.type = "mono") | 
     SCpubr::do_DimPlot(sample, font.type = "sans") | 
     SCpubr::do_DimPlot(sample, font.type = "serif")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-11-1.png" alt="SCpubr do_DimPlot changing font type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-11)SCpubr do_DimPlot changing font type.</p>
</div>


```r
p <- SCpubr::do_FeaturePlot(sample = sample,
                            features = "CD14",
                            font.type = "mono") | 
     SCpubr::do_FeaturePlot(sample = sample, 
                            features = "CD14",
                            font.type = "sans") | 
     SCpubr::do_FeaturePlot(sample = sample, 
                            features = "CD14",
                            font.type = "serif")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-12-1.png" alt="SCpubr do_FeaturePlot changing font type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-12)SCpubr do_FeaturePlot changing font type.</p>
</div>

```r
p <- SCpubr::do_NebulosaPlot(sample = sample,
                             features = "CD14",
                             font.type = "mono") |
     SCpubr::do_NebulosaPlot(sample = sample,
                             features = "CD14",
                             font.type = "sans") | 
     SCpubr::do_NebulosaPlot(sample = sample,
                             features = "CD14",
                             font.type = "serif")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-13-1.png" alt="SCpubr do_NebulosaPlot changing font type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-13)SCpubr do_NebulosaPlot changing font type.</p>
</div>


```r
p <- SCpubr::do_BeeSwarmPlot(sample = sample,
                             feature_to_rank = "PC_1",
                             group.by = "seurat_clusters",
                             font.type = "mono") | 
     SCpubr::do_BeeSwarmPlot(sample = sample,
                             feature_to_rank = "PC_1",
                             group.by = "seurat_clusters",
                             font.type = "sans") |
     SCpubr::do_BeeSwarmPlot(sample = sample,
                             feature_to_rank = "PC_1",
                             group.by = "seurat_clusters",
                             font.type = "serif")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-14-1.png" alt="SCpubr do_BeeSwarmPlot changing font type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-14)SCpubr do_BeeSwarmPlot changing font type.</p>
</div>



```r
p <- SCpubr::do_VlnPlot(sample = sample,
                        features = "CD14",
                        font.type = "mono") /
     SCpubr::do_VlnPlot(sample = sample,
                        features = "CD14",
                        font.type = "sans") /
     SCpubr::do_VlnPlot(sample = sample,
                        features = "CD14",
                        font.type = "serif")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-15-1.png" alt="SCpubr do_VlnPlot changing font type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-15)SCpubr do_VlnPlot changing font type.</p>
</div>


```r
genes <- c("IL7R", "CCR7", "CD14", "LYZ", 
           "S100A4", "MS4A1", "CD8A", "FCGR3A", 
           "MS4A7", "GNLY", "NKG7", "FCER1A", 
           "CST3", "PPBP")

p <- SCpubr::do_DotPlot(sample = sample,
                        features = genes,
                        font.type = "mono") | 
     SCpubr::do_DotPlot(sample = sample,
                        features = genes,
                        font.type = "sans") |
     SCpubr::do_DotPlot(sample = sample,
                        features = genes,
                        font.type = "serif")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-16-1.png" alt="SCpubr do_DotPlot changing font type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-16)SCpubr do_DotPlot changing font type.</p>
</div>


```r
p <- SCpubr::do_BarPlot(sample = sample,
                        features = "seurat_clusters",
                        horizontal = T,
                        font.type = "mono") | 
     SCpubr::do_BarPlot(sample = sample,
                        features = "seurat_clusters",
                        horizontal = T,
                        font.type = "sans") |
     SCpubr::do_BarPlot(sample = sample,
                        features = "seurat_clusters",
                        horizontal = T,
                        font.type = "serif")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-17-1.png" alt="SCpubr do_BarPlot changing font type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-17)SCpubr do_BarPlot changing font type.</p>
</div>


```r
p <- SCpubr::do_TermEnrichmentPlot(genes = c("CD14", "LYN"),
                                   dbs_use = "GO_Biological_Process_2021",
                                   nterms = 2,
                                   font.type = "mono") |
     SCpubr::do_TermEnrichmentPlot(genes = c("CD14", "LYN"),
                                   dbs_use = "GO_Biological_Process_2021",
                                   nterms = 2,
                                   font.type = "sans") | 
     SCpubr::do_TermEnrichmentPlot(genes = c("CD14", "LYN"),
                                   dbs_use = "GO_Biological_Process_2021",
                                   nterms = 2,
                                   font.type = "serif")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-18-1.png" alt="SCpubr do_TermEnrichmentPlot changing font type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-18)SCpubr do_TermEnrichmentPlot changing font type.</p>
</div>


```r
genes <- list("A" = Seurat::VariableFeatures(sample)[1:5],
              "B" = Seurat::VariableFeatures(sample)[6:10],
              "C" = Seurat::VariableFeatures(sample)[11:15],
              "D" = Seurat::VariableFeatures(sample)[16:20])

p <- SCpubr::do_CellularStatesPlot(sample = sample,
                                   gene_list = genes,
                                   x1 = "A",
                                   y1 = "B",
                                   x2 = "C",
                                   y2 = "D",
                                   enforce_symmetry = T,
                                   font.type = "mono") |
     SCpubr::do_CellularStatesPlot(sample = sample,
                                   gene_list = genes,
                                   x1 = "A",
                                   y1 = "B",
                                   x2 = "C",
                                   y2 = "D",
                                   enforce_symmetry = T,
                                   font.type = "sans") |
     SCpubr::do_CellularStatesPlot(sample = sample,
                                   gene_list = genes,
                                   x1 = "A",
                                   y1 = "B",
                                   x2 = "C",
                                   y2 = "D",
                                   enforce_symmetry = T,
                                   font.type = "serif")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-19-1.png" alt="SCpubr do_CellularStatesPlot changing font type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-19)SCpubr do_CellularStatesPlot changing font type.</p>
</div>

## Adding plot titles, subtitles and captions to plots. {-}

To all **ggplot2-based** plots, one can add title, subtitle and caption to them by using `plot.title`, `plot.subtitle` and `plot.caption` parameters.  


```r
p <- SCpubr::do_DimPlot(sample, 
                        plot.title = "This is a title",
                        plot.subtitle = "This is a subtitle",
                        plot.caption = "This is a caption")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-20-1.png" alt="SCpubr do_DimPlot adding title, subtitle and caption." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-20)SCpubr do_DimPlot adding title, subtitle and caption.</p>
</div>


```r
p <- SCpubr::do_FeaturePlot(sample = sample,
                            features = "CD14", 
                            plot.title = "This is a title",
                            plot.subtitle = "This is a subtitle",
                            plot.caption = "This is a caption")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-21-1.png" alt="SCpubr do_FeaturePlot adding title, subtitle and caption." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-21)SCpubr do_FeaturePlot adding title, subtitle and caption.</p>
</div>

```r
p <- SCpubr::do_NebulosaPlot(sample = sample,
                             features = "CD14", 
                             plot.title = "This is a title",
                             plot.subtitle = "This is a subtitle",
                             plot.caption = "This is a caption")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-22-1.png" alt="SCpubr do_NebulosaPlot adding title, subtitle and caption." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-22)SCpubr do_NebulosaPlot adding title, subtitle and caption.</p>
</div>


```r
p <- SCpubr::do_BeeSwarmPlot(sample = sample,
                             feature_to_rank = "PC_1",
                             group.by = "seurat_clusters", 
                             plot.title = "This is a title",
                             plot.subtitle = "This is a subtitle",
                             plot.caption = "This is a caption")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-23-1.png" alt="SCpubr do_BeeSwarmPlot adding title, subtitle and caption." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-23)SCpubr do_BeeSwarmPlot adding title, subtitle and caption.</p>
</div>



```r
p <- SCpubr::do_VlnPlot(sample = sample,
                        features = "CD14", 
                        plot.title = "This is a title",
                        plot.subtitle = "This is a subtitle",
                        plot.caption = "This is a caption")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-24-1.png" alt="SCpubr do_VlnPlot adding title, subtitle and caption." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-24)SCpubr do_VlnPlot adding title, subtitle and caption.</p>
</div>


```r
genes <- c("IL7R", "CCR7", "CD14", "LYZ", 
           "S100A4", "MS4A1", "CD8A", "FCGR3A", 
           "MS4A7", "GNLY", "NKG7", "FCER1A", 
           "CST3", "PPBP")

p <- SCpubr::do_DotPlot(sample = sample,
                        features = genes, 
                        plot.title = "This is a title",
                        plot.subtitle = "This is a subtitle",
                        plot.caption = "This is a caption")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-25-1.png" alt="SCpubr do_DotPlot adding title, subtitle and caption." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-25)SCpubr do_DotPlot adding title, subtitle and caption.</p>
</div>


```r
p <- SCpubr::do_BarPlot(sample = sample,
                        features = "seurat_clusters",
                        horizontal = T, 
                        plot.title = "This is a title",
                        plot.subtitle = "This is a subtitle",
                        plot.caption = "This is a caption")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-26-1.png" alt="SCpubr do_BarPlot adding title, subtitle and caption." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-26)SCpubr do_BarPlot adding title, subtitle and caption.</p>
</div>


```r
p <- SCpubr::do_TermEnrichmentPlot(genes = c("CD14", "LYN"),
                                   dbs_use = "GO_Biological_Process_2021",
                                   nterms = 2, 
                                   plot.title = "This is a title",
                                   plot.subtitle = "This is a subtitle",
                                   plot.caption = "This is a caption")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-27-1.png" alt="SCpubr do_TermEnrichmentPlot adding title, subtitle and caption." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-27)SCpubr do_TermEnrichmentPlot adding title, subtitle and caption.</p>
</div>


```r
genes <- list("A" = Seurat::VariableFeatures(sample)[1:5],
              "B" = Seurat::VariableFeatures(sample)[6:10],
              "C" = Seurat::VariableFeatures(sample)[11:15],
              "D" = Seurat::VariableFeatures(sample)[16:20])

p <- SCpubr::do_CellularStatesPlot(sample = sample,
                                   gene_list = genes,
                                   x1 = "A",
                                   y1 = "B",
                                   x2 = "C",
                                   y2 = "D",
                                   enforce_symmetry = T,
                                   plot.title = "This is a title",
                                   plot.subtitle = "This is a subtitle",
                                   plot.caption = "This is a caption")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-28-1.png" alt="SCpubr do_CellularStatesPlot adding title, subtitle and caption." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-28)SCpubr do_CellularStatesPlot adding title, subtitle and caption.</p>
</div>

### Further customization  {-}

Titles, subtitles and captions are modified versions of `ggplot2::element_text()`, using [ggtext](https://github.com/wilkelab/ggtext) package. This allows for partial modifications, in markdown style, of the elements. You can also change the color by providing **HTML tags** as follows:


```r
p <- SCpubr::do_DimPlot(sample, 
                        plot.title = "<span style = 'color:#87191c;'>This</span><span style = 'color:#243a76;'> is a </span><span style = 'color:#096837;'>colored title</span>",
                        plot.subtitle = "This is a *subtitle*",
                        plot.caption = "This is a **caption**")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-29-1.png" alt="SCpubr do_DimPlot adding title, subtitle and caption with extra modifications." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-29)SCpubr do_DimPlot adding title, subtitle and caption with extra modifications.</p>
</div>

## Change between legend types in continuous variables. {-}

Users can opt to change between three type of legends **continuous** variables: the one that comes by default with `ggplot2`, a colorbar that is a modified version of the default, with a wider range and more marked ticks, or a colorbar with discrete steps (colorsteps), which can be a nice alternative depending on the situation. This can be achieved by providing `legend.type = "normal"`, `legend.type = "colorbar"` or `legend.type = "colorsteps"`. This can be applied to any **ggplot2-based** plot.



```r
p <- SCpubr::do_FeaturePlot(sample = sample,
                            features = "PC_1",
                            legend.type = "normal") | 
     SCpubr::do_FeaturePlot(sample = sample, 
                            features = "PC_1",
                            legend.type = "colorbar") | 
     SCpubr::do_FeaturePlot(sample = sample, 
                            features = "PC_1",
                            legend.type = "colorsteps")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-30-1.png" alt="SCpubr do_FeaturePlot changing legend type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-30)SCpubr do_FeaturePlot changing legend type.</p>
</div>


```r
p <- SCpubr::do_NebulosaPlot(sample = sample,
                             features = "PC_1",
                             legend.type = "normal") |
     SCpubr::do_NebulosaPlot(sample = sample,
                             features = "PC_1",
                             legend.type = "colorbar") | 
     SCpubr::do_NebulosaPlot(sample = sample,
                             features = "PC_1",
                             legend.type = "colorsteps")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-31-1.png" alt="SCpubr do_NebulosaPlot changing legend type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-31)SCpubr do_NebulosaPlot changing legend type.</p>
</div>


```r
p <- SCpubr::do_BeeSwarmPlot(sample = sample,
                             feature_to_rank = "PC_1",
                             group.by = "seurat_clusters",
                             continuous_feature = T,
                             legend.type = "normal") | 
     SCpubr::do_BeeSwarmPlot(sample = sample,
                             feature_to_rank = "PC_1",
                             group.by = "seurat_clusters",
                             continuous_feature = T,
                             legend.type = "colorbar") |
     SCpubr::do_BeeSwarmPlot(sample = sample,
                             feature_to_rank = "PC_1",
                             group.by = "seurat_clusters",
                             continuous_feature = T,
                             legend.type = "colorsteps")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-32-1.png" alt="SCpubr do_BeeSwarmPlot changing legend type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-32)SCpubr do_BeeSwarmPlot changing legend type.</p>
</div>



```r
genes <- c("IL7R", "CCR7", "CD14", "LYZ", 
           "S100A4", "MS4A1", "CD8A", "FCGR3A", 
           "MS4A7", "GNLY", "NKG7", "FCER1A", 
           "CST3", "PPBP")

p <- SCpubr::do_DotPlot(sample = sample,
                        features = "PC_1",
                        legend.type = "normal") | 
     SCpubr::do_DotPlot(sample = sample,
                        features = "PC_1",
                        legend.type = "colorbar") |
     SCpubr::do_DotPlot(sample = sample,
                        features = "PC_1",
                        legend.type = "colorsteps")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-33-1.png" alt="SCpubr do_DotPlot changing legend type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-33)SCpubr do_DotPlot changing legend type.</p>
</div>



```r
p <- SCpubr::do_TermEnrichmentPlot(genes = c("CD14", "LYN"),
                                   dbs_use = "GO_Biological_Process_2021",
                                   nterms = 2,
                                   legend.type = "normal") |
     SCpubr::do_TermEnrichmentPlot(genes = c("CD14", "LYN"),
                                   dbs_use = "GO_Biological_Process_2021",
                                   nterms = 2,
                                   legend.type = "colorbar") | 
     SCpubr::do_TermEnrichmentPlot(genes = c("CD14", "LYN"),
                                   dbs_use = "GO_Biological_Process_2021",
                                   nterms = 2,
                                   legend.type = "colorsteps")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-34-1.png" alt="SCpubr do_TermEnrichmentPlot changing legend type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-34)SCpubr do_TermEnrichmentPlot changing legend type.</p>
</div>

## Relocating the legend {-}
Legends can be switched to any of the following positions: top, bottom, left and right. Depending on the set ups of the figure, one location might be more suitable than another. By default, `SCpubr` locates them either right or bottom, but this can be changed anytime by using `legend.position = "top"`, `legend.position = "bottom"`, `legend.position = "left"` or `legend.position = "right"`. This only works in **ggplot2-based** plots.


```r
p <- (SCpubr::do_DimPlot(sample, 
                         legend.position = "top") | 
      SCpubr::do_DimPlot(sample, 
                         legend.position = "bottom")) /
     (SCpubr::do_DimPlot(sample, 
                         legend.position = "left") |
      SCpubr::do_DimPlot(sample, 
                         legend.position = "right"))
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-35-1.png" alt="SCpubr do_DimPlot with varying legend positions." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-35)SCpubr do_DimPlot with varying legend positions.</p>
</div>



```r
p <- (SCpubr::do_FeaturePlot(sample, 
                             features = "PC_1", 
                             legend.position = "top") | 
      SCpubr::do_FeaturePlot(sample, 
                             features = "PC_1", 
                             legend.position = "bottom")) /
     (SCpubr::do_FeaturePlot(sample, 
                             features = "PC_1", 
                             legend.position = "left") |
      SCpubr::do_FeaturePlot(sample, 
                             features = "PC_1", 
                             legend.position = "right"))
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-36-1.png" alt="SCpubr do_FeaturePlot with varying legend positions." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-36)SCpubr do_FeaturePlot with varying legend positions.</p>
</div>


```r
p <- (SCpubr::do_NebulosaPlot(sample, 
                              features = "PC_1", 
                              legend.position = "top") | 
      SCpubr::do_NebulosaPlot(sample, 
                              features = "PC_1", 
                              legend.position = "bottom")) /
     (SCpubr::do_NebulosaPlot(sample, 
                              features = "PC_1", 
                              legend.position = "left") |
      SCpubr::do_NebulosaPlot(sample, 
                              features = "PC_1", 
                              legend.position = "right"))
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-37-1.png" alt="SCpubr do_NebulosaPlot with varying legend positions." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-37)SCpubr do_NebulosaPlot with varying legend positions.</p>
</div>


```r
p <- (SCpubr::do_BeeSwarmPlot(sample,
                              feature_to_rank = "PC_1", 
                              group.by = "seurat_clusters",
                              continuous_feature = TRUE,
                              legend.position = "top") | 
      SCpubr::do_BeeSwarmPlot(sample,
                              feature_to_rank = "PC_1", 
                              group.by = "seurat_clusters",
                              continuous_feature = TRUE, 
                              legend.position = "bottom")) /
     (SCpubr::do_BeeSwarmPlot(sample,
                              feature_to_rank = "PC_1", 
                              group.by = "seurat_clusters",
                              continuous_feature = TRUE, 
                              legend.position = "left") |
      SCpubr::do_BeeSwarmPlot(sample,
                              feature_to_rank = "PC_1", 
                              group.by = "seurat_clusters",
                              continuous_feature = TRUE, 
                              legend.position = "right"))
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-38-1.png" alt="SCpubr do_BeeSwarmPlot with varying legend positions." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-38)SCpubr do_BeeSwarmPlot with varying legend positions.</p>
</div>


```r
genes <- c("IL7R", "CCR7", "CD14", "LYZ", 
           "S100A4", "MS4A1", "CD8A", "FCGR3A", 
           "MS4A7", "GNLY", "NKG7", "FCER1A", 
           "CST3", "PPBP")

p <- (SCpubr::do_DotPlot(sample,
                         features = genes, 
                         legend.position = "top") |
      SCpubr::do_DotPlot(sample,
                         features = genes, 
                         legend.position = "bottom")) /
     (SCpubr::do_DotPlot(sample,
                         features = genes, 
                         legend.position = "left") |
      SCpubr::do_DotPlot(sample,
                         features = genes, 
                         legend.position = "right"))
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-39-1.png" alt="SCpubr do_DotPlot with varying legend positions." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-39)SCpubr do_DotPlot with varying legend positions.</p>
</div>


```r
p <- (SCpubr::do_BarPlot(sample,
                         features = "seurat_clusters", 
                         legend.position = "top") |
      SCpubr::do_BarPlot(sample,
                         features = "seurat_clusters", 
                         legend.position = "bottom")) /
     (SCpubr::do_BarPlot(sample,
                         features = "seurat_clusters", 
                         legend.position = "left") |
      SCpubr::do_BarPlot(sample,
                         features = "seurat_clusters", 
                         legend.position = "right"))
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-40-1.png" alt="SCpubr do_BarPlot with varying legend positions." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-40)SCpubr do_BarPlot with varying legend positions.</p>
</div>

```r
p <- (SCpubr::do_TermEnrichmentPlot(genes = c("CD14", "LYN"),
                                    dbs_use = "GO_Biological_Process_2021",
                                    nterms = 2,
                                    legend.position = "top") |
      SCpubr::do_TermEnrichmentPlot(genes = c("CD14", "LYN"),
                                    dbs_use = "GO_Biological_Process_2021",
                                    nterms = 2,
                                    legend.position = "bottom")) / 
     (SCpubr::do_TermEnrichmentPlot(genes = c("CD14", "LYN"),
                                    dbs_use = "GO_Biological_Process_2021",
                                    nterms = 2,
                                    legend.position = "left") |
      SCpubr::do_TermEnrichmentPlot(genes = c("CD14", "LYN"),
                                    dbs_use = "GO_Biological_Process_2021",
                                    nterms = 2,
                                    legend.position = "right"))
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-41-1.png" alt="SCpubr do_TermEnrichmentPlot with varying legend positions." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-41)SCpubr do_TermEnrichmentPlot with varying legend positions.</p>
</div>



```r
genes <- list("A" = Seurat::VariableFeatures(sample)[1:5],
              "B" = Seurat::VariableFeatures(sample)[6:10],
              "C" = Seurat::VariableFeatures(sample)[11:15],
              "D" = Seurat::VariableFeatures(sample)[16:20])

p <- (SCpubr::do_CellularStatesPlot(sample = sample,
                                    gene_list = genes,
                                    x1 = "A",
                                    y1 = "B",
                                    x2 = "C",
                                    y2 = "D",
                                    enforce_symmetry = T,
                                    legend.position = "top") |
      SCpubr::do_CellularStatesPlot(sample = sample,
                                    gene_list = genes,
                                    x1 = "A",
                                    y1 = "B",
                                    x2 = "C",
                                    y2 = "D",
                                    enforce_symmetry = T,
                                    legend.position = "bottom")) /
     (SCpubr::do_CellularStatesPlot(sample = sample,
                                    gene_list = genes,
                                    x1 = "A",
                                    y1 = "B",
                                    x2 = "C",
                                    y2 = "D",
                                    enforce_symmetry = T,
                                    legend.position = "left") |
      SCpubr::do_CellularStatesPlot(sample = sample,
                                    gene_list = genes,
                                    x1 = "A",
                                    y1 = "B",
                                    x2 = "C",
                                    y2 = "D",
                                    enforce_symmetry = T,
                                    legend.position = "right"))
   
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-42-1.png" alt="SCpubr do_CellularStatesPlot with varying legend positions." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-42)SCpubr do_CellularStatesPlot with varying legend positions.</p>
</div>
## Modifying colors {-}
Perhaps, one of the most critical parameters, the possibility to change the colors displayed up to the user's wish. This is mainly achieved by `colors.use` in any plot making use of categorical variables and the plots using continuous variables but not implementing a **viridis** color scale. For those cases, `viridis_color_map` is used. 

### Categorical variables {-}

For plots using categorical variables, colors can be modified using `colors.use` and a vector of named colors. The names have to match the unique values being displayed on the plot and the colors need to be proper color representations or HEX codes.


```r
# Create a color scale for the unique values in seurat clusters.
colors <- c("0" = "#001219",
            "1" = "#005f73",
            "2" = "#0a9396",
            "3" = "#94d2bd",
            "4" = "#e9d8a6",
            "5" = "#ee9b00",
            "6" = "#ca6702",
            "7" = "#bb3e03",
            "8" = "#ae2012",
            "9" = "#9b2226")
```


```r
p <- SCpubr::do_DimPlot(sample) | 
     SCpubr::do_DimPlot(sample, 
                        colors.use = colors)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-44-1.png" alt="SCpubr do_DimPlot modifying colors." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-44)SCpubr do_DimPlot modifying colors.</p>
</div>

```r
p <- SCpubr::do_BeeSwarmPlot(sample,
                             feature_to_rank = "PC_1",
                             group.by = "seurat_clusters") | 
     SCpubr::do_BeeSwarmPlot(sample,
                             feature_to_rank = "PC_1",
                             group.by = "seurat_clusters",
                             colors.use = colors)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-45-1.png" alt="SCpubr do_BeeSwarmPlot modifying colors." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-45)SCpubr do_BeeSwarmPlot modifying colors.</p>
</div>

```r
p <- SCpubr::do_VlnPlot(sample,
                        features = "PC_1") /
     SCpubr::do_VlnPlot(sample, 
                        features = "PC_1",
                        colors.use = colors)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-46-1.png" alt="SCpubr do_VlnPlot modifying colors." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-46)SCpubr do_VlnPlot modifying colors.</p>
</div>

```r
p <- SCpubr::do_BarPlot(sample,
                        features = "seurat_clusters",
                        horizontal = T) |
     SCpubr::do_BarPlot(sample, 
                        features = "seurat_clusters",
                        horizontal = T,
                        colors.use = colors)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-47-1.png" alt="SCpubr do_BarPlot modifying colors." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-47)SCpubr do_BarPlot modifying colors.</p>
</div>


```r
genes <- list("A" = Seurat::VariableFeatures(sample)[1:5],
              "B" = Seurat::VariableFeatures(sample)[6:10],
              "C" = Seurat::VariableFeatures(sample)[11:15],
              "D" = Seurat::VariableFeatures(sample)[16:20])

p <- SCpubr::do_CellularStatesPlot(sample = sample,
                                   gene_list = genes,
                                   x1 = "A",
                                   y1 = "B",
                                   x2 = "C",
                                   y2 = "D",
                                   enforce_symmetry = T) |
     SCpubr::do_CellularStatesPlot(sample = sample,
                                   gene_list = genes,
                                   x1 = "A",
                                   y1 = "B",
                                   x2 = "C",
                                   y2 = "D",
                                   enforce_symmetry = T,
                                   colors.use = colors)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-48-1.png" alt="SCpubr::do_CellularStatesPlot modifying colors." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-48)SCpubr::do_CellularStatesPlot modifying colors.</p>
</div>


### Continuous variables {-}

As explained above, modifying the color scales in the plots highly depends on whether the color scale is based on **viridis** or not. 

#### Viridis-based plots {-}

For viridis-based plots, the scale can be changed according to the **different available color maps** in the [viridis package](https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html). Options are:

- A - magma color map.
- B - inferno color map.
- C - plasma color map.
- D - viridis color map.
- E - cividis color map.
- F - rocket color map.
- G - mako color map.
- H - turbo  color map.

To change the color map, just provide either the **letter** or the **name** of the color map to `viridis_color_map`.


```r
p1 <- SCpubr::do_FeaturePlot(sample = sample, 
                             features = "CD14", 
                             viridis_color_map = "A", 
                             plot.title = "Magma")

p2 <- SCpubr::do_FeaturePlot(sample = sample, 
                             features = "CD14", 
                             viridis_color_map = "B", 
                             plot.title = "Inferno")

p3 <- SCpubr::do_FeaturePlot(sample = sample, 
                             features = "CD14", 
                             viridis_color_map = "C", 
                             plot.title = "Plasma")

p4 <- SCpubr::do_FeaturePlot(sample = sample, 
                             features = "CD14", 
                             viridis_color_map = "D", 
                             plot.title = "Viridis")

p5 <- SCpubr::do_FeaturePlot(sample = sample, 
                             features = "CD14", 
                             viridis_color_map = "E", 
                             plot.title = "Cividis")

p6 <- SCpubr::do_FeaturePlot(sample = sample, 
                             features = "CD14", 
                             viridis_color_map = "F", 
                             plot.title = "Rocket")

p7 <- SCpubr::do_FeaturePlot(sample = sample, 
                             features = "CD14", 
                             viridis_color_map = "G", 
                             plot.title = "Mako")

p8 <- SCpubr::do_FeaturePlot(sample = sample, 
                             features = "CD14", 
                             viridis_color_map = "H", 
                             plot.title = "Turbo")

p <- patchwork::wrap_plots(list(p1, p2, p3, p4, p5, p6, p7, p8), ncol = 2, byrow = TRUE)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-49-1.png" alt="SCpubr::do_FeaturePlot modifying viridis color maps." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-49)SCpubr::do_FeaturePlot modifying viridis color maps.</p>
</div>


```r
p1 <- SCpubr::do_NebulosaPlot(sample = sample, 
                              features = "CD14", 
                              viridis_color_map = "A", 
                              plot.title = "Magma")

p2 <- SCpubr::do_NebulosaPlot(sample = sample, 
                              features = "CD14", 
                              viridis_color_map = "B", 
                              plot.title = "Inferno")

p3 <- SCpubr::do_NebulosaPlot(sample = sample, 
                              features = "CD14", 
                              viridis_color_map = "C", 
                              plot.title = "Plasma")

p4 <- SCpubr::do_NebulosaPlot(sample = sample, 
                              features = "CD14", 
                              viridis_color_map = "D", 
                              plot.title = "Viridis")

p5 <- SCpubr::do_NebulosaPlot(sample = sample, 
                              features = "CD14", 
                              viridis_color_map = "E", 
                              plot.title = "Cividis")

p6 <- SCpubr::do_NebulosaPlot(sample = sample, 
                              features = "CD14", 
                              viridis_color_map = "F", 
                              plot.title = "Rocket")

p7 <- SCpubr::do_NebulosaPlot(sample = sample, 
                              features = "CD14", 
                              viridis_color_map = "G", 
                              plot.title = "Mako")

p8 <- SCpubr::do_NebulosaPlot(sample = sample, 
                              features = "CD14", 
                              viridis_color_map = "H", 
                              plot.title = "Turbo")


p <- patchwork::wrap_plots(list(p1, p2, p3, p4, p5, p6, p7, p8), ncol = 2, byrow = TRUE)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-50-1.png" alt="SCpubr Nebulosa plot modifying viridis color maps." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-50)SCpubr Nebulosa plot modifying viridis color maps.</p>
</div>


```r
p1 <- SCpubr::do_BeeSwarmPlot(sample = sample, 
                              feature_to_rank = "PC_1", 
                              group.by = "seurat_clusters", 
                              continuous_feature = TRUE, 
                              viridis_color_map = "A", 
                              plot.title = "Magma")

p2 <- SCpubr::do_BeeSwarmPlot(sample = sample, 
                              feature_to_rank = "PC_1", 
                              group.by = "seurat_clusters", 
                              continuous_feature = TRUE, 
                              viridis_color_map = "B", 
                              plot.title = "Inferno")

p3 <- SCpubr::do_BeeSwarmPlot(sample = sample, 
                              feature_to_rank = "PC_1", 
                              group.by = "seurat_clusters", 
                              continuous_feature = TRUE, 
                              viridis_color_map = "C", 
                              plot.title = "Plasma")

p4 <- SCpubr::do_BeeSwarmPlot(sample = sample, 
                              feature_to_rank = "PC_1", 
                              group.by = "seurat_clusters", 
                              continuous_feature = TRUE, 
                              viridis_color_map = "D", 
                              plot.title = "Viridis")

p5 <- SCpubr::do_BeeSwarmPlot(sample = sample, 
                              feature_to_rank = "PC_1", 
                              group.by = "seurat_clusters", 
                              continuous_feature = TRUE, 
                              viridis_color_map = "E", 
                              plot.title = "Cividis")

p6 <- SCpubr::do_BeeSwarmPlot(sample = sample, 
                              feature_to_rank = "PC_1", 
                              group.by = "seurat_clusters", 
                              continuous_feature = TRUE, 
                              viridis_color_map = "F", 
                              plot.title = "Rocket")

p7 <- SCpubr::do_BeeSwarmPlot(sample = sample, 
                              feature_to_rank = "PC_1", 
                              group.by = "seurat_clusters", 
                              continuous_feature = TRUE, 
                              viridis_color_map = "G", 
                              plot.title = "Mako")

p8 <- SCpubr::do_BeeSwarmPlot(sample = sample, 
                              feature_to_rank = "PC_1", 
                              group.by = "seurat_clusters", 
                              continuous_feature = TRUE, 
                              viridis_color_map = "H", 
                              plot.title = "Turbo")

p <- patchwork::wrap_plots(list(p1, p2, p3, p4, p5, p6, p7, p8), ncol = 2, byrow = TRUE)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-51-1.png" alt="SCpubr::do_BeeSwarmPlot modifying viridis color maps." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-51)SCpubr::do_BeeSwarmPlot modifying viridis color maps.</p>
</div>
#### 2 color gradient plots {-}

The rest of plots that do present a continuous color scale, normally define the gradient based on a combination of pair of colors provided by the user to `colors.use`. This pair of colors do not need to be named, but they do need to be **valid colors** or **HEX codes**.


```r
genes <- c("IL7R", "CCR7", "CD14", "LYZ", 
           "S100A4", "MS4A1", "CD8A", "FCGR3A", 
           "MS4A7", "GNLY", "NKG7", "FCER1A", 
           "CST3", "PPBP")

colors <- c("#006d77", "#e29578")

p <- SCpubr::do_DotPlot(sample,
                        features = genes) | 
     SCpubr::do_DotPlot(sample,
                        features = genes,
                        colors.use = colors)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-52-1.png" alt="SCpubr do_DotPlot modifying colors." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-52)SCpubr do_DotPlot modifying colors.</p>
</div>


```r
colors <- c("#006d77", "#e29578")

p <- SCpubr::do_TermEnrichmentPlot(genes = c("CD14", "LYN"),
                                   dbs_use = "GO_Biological_Process_2021",
                                   nterms = 4) | 
     SCpubr::do_TermEnrichmentPlot(genes = c("CD14", "LYN"),
                                   dbs_use = "GO_Biological_Process_2021",
                                   nterms = 4,
                                   colors.use = colors)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-53-1.png" alt="SCpubr do_TermEnrichmentPlot modifying colors." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-53)SCpubr do_TermEnrichmentPlot modifying colors.</p>
</div>


```r
genes <- c("IL7R", "CCR7", "CD14", "LYZ", 
           "S100A4", "MS4A1", "CD8A", "FCGR3A", 
           "MS4A7", "GNLY", "NKG7", "FCER1A", 
           "CST3", "PPBP")

p <- SCpubr::do_EnrichmentHeatmap(sample = sample,
                                  list_genes = genes,
                                  transpose = T,
                                  row_names_rot = 90) 
     
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-54-1.png" alt="SCpubr::do_EnrichmentHeatmap with modified colors" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-54)SCpubr::do_EnrichmentHeatmap with modified colors</p>
</div>



```r
genes <- c("IL7R", "CCR7", "CD14", "LYZ", 
           "S100A4", "MS4A1", "CD8A", "FCGR3A", 
           "MS4A7", "GNLY", "NKG7", "FCER1A", 
           "CST3", "PPBP")
colors <- c("#006d77", "#e29578")

p <- SCpubr::do_EnrichmentHeatmap(sample = sample,
                                  list_genes = genes,
                                  transpose = T,
                                  row_names_rot = 90,
                                  colors.use = colors) 
     
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-55-1.png" alt="SCpubr::do_EnrichmentHeatmap with modified colors" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-55)SCpubr::do_EnrichmentHeatmap with modified colors</p>
</div>

```r
p <- SCpubr::do_CorrelationPlot(sample = sample,
                                column_names_rot = 0)
     
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-56-1.png" alt="SCpubr::do_CorrelationPlot with normal colors" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-56)SCpubr::do_CorrelationPlot with normal colors</p>
</div>


```r
colors <- c("#006d77", "#e29578")
p <- SCpubr::do_CorrelationPlot(sample = sample,
                                column_names_rot = 0,
                                colors.use = colors)
     
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-57-1.png" alt="SCpubr::do_CorrelationPlot with modified colors" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-57)SCpubr::do_CorrelationPlot with modified colors</p>
</div>


## Plotting marginal distributions. {-}
In any **scatter plot**, it is possible to draw marginal distributions on top and bottom displaying the distribution of the dots alongside both X and Y axis. This is achieved thanks to [ggExtra package](https://www.rdocumentation.org/packages/ggExtra/versions/0.10.0). This is applicable to any plot with categorical values, such as `SCpubr::do_DimPlot()` and `SCpubr::do_CellularStatesPlot()`. 

One can trigger this behavior by using `plot_marginal_distributions = TRUE`: 


```r
genes <- list("A" = Seurat::VariableFeatures(sample)[1:5],
              "B" = Seurat::VariableFeatures(sample)[6:10],
              "C" = Seurat::VariableFeatures(sample)[11:15],
              "D" = Seurat::VariableFeatures(sample)[16:20])

p1 <- SCpubr::do_DimPlot(sample = sample,
                         plot_marginal_distributions = TRUE,
                         legend.position = "bottom",
                         plot_cell_borders = FALSE)

p2 <- SCpubr:::do_CellularStatesPlot(sample = sample,
                                     gene_list = genes,
                                     x1 = "A",
                                     y1 = "B",
                                     x2 = "C",
                                     y2 = "D",
                                     enforce_symmetry = T,
                                     legend.position = "bottom",
                                     plot_marginal_distributions = TRUE,
                                     plot_cell_borders = FALSE)

p <- p1 | p2
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-58-1.png" alt="Plotting marginal plots" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-58)Plotting marginal plots</p>
</div>

One can remove the grouping and plot only the overall density of the dots with `marginal.group = FALSE`:


```r
genes <- list("A" = Seurat::VariableFeatures(sample)[1:5],
              "B" = Seurat::VariableFeatures(sample)[6:10],
              "C" = Seurat::VariableFeatures(sample)[11:15],
              "D" = Seurat::VariableFeatures(sample)[16:20])

p1 <- SCpubr::do_DimPlot(sample = sample,
                         plot_marginal_distributions = TRUE,
                         legend.position = "bottom",
                         marginal.group = FALSE,
                         plot_cell_borders = FALSE)

p2 <- SCpubr:::do_CellularStatesPlot(sample = sample,
                                     gene_list = genes,
                                     x1 = "A",
                                     y1 = "B",
                                     x2 = "C",
                                     y2 = "D",
                                     enforce_symmetry = T,
                                     legend.position = "bottom",
                                     plot_marginal_distributions = TRUE,
                                     marginal.group = FALSE,
                                     plot_cell_borders = FALSE)

p <- p1 | p2
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-59-1.png" alt="Plotting marginal plots without grouping" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-59)Plotting marginal plots without grouping</p>
</div>

You can increase the relative ratio between the main plots and the the marginal plots with `marginal.size`. A value of 1 means an equal size between main and marginal plots. A value of 5 means half the size of the marginal plot versus the main plots.:


```r
genes <- list("A" = Seurat::VariableFeatures(sample)[1:5],
              "B" = Seurat::VariableFeatures(sample)[6:10],
              "C" = Seurat::VariableFeatures(sample)[11:15],
              "D" = Seurat::VariableFeatures(sample)[16:20])

p1 <- SCpubr::do_DimPlot(sample = sample,
                         plot_marginal_distributions = TRUE,
                         legend.position = "bottom",
                         marginal.size = 1,
                         plot_cell_borders = FALSE)

p2 <- SCpubr:::do_CellularStatesPlot(sample = sample,
                                     gene_list = genes,
                                     x1 = "A",
                                     y1 = "B",
                                     x2 = "C",
                                     y2 = "D",
                                     enforce_symmetry = T,
                                     legend.position = "bottom",
                                     plot_marginal_distributions = TRUE,
                                     marginal.size = 1,
                                     plot_cell_borders = FALSE)

p <- p1 | p2
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-60-1.png" alt="Plotting marginal plots with modified ratio" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-60)Plotting marginal plots with modified ratio</p>
</div>
Finally, one can also choose the type of distribution being displayed with `marginal.type`. This can be one of "density", "boxplot", "violin", "histogram" and "densigram".


```r
genes <- list("A" = Seurat::VariableFeatures(sample)[1:5],
              "B" = Seurat::VariableFeatures(sample)[6:10],
              "C" = Seurat::VariableFeatures(sample)[11:15],
              "D" = Seurat::VariableFeatures(sample)[16:20])

p1 <- SCpubr::do_DimPlot(sample = sample,
                         plot_marginal_distributions = TRUE,
                         legend.position = "bottom",
                         marginal.type = "histogram",
                         plot_cell_borders = FALSE)

p2 <- SCpubr:::do_CellularStatesPlot(sample = sample,
                                     gene_list = genes,
                                     x1 = "A",
                                     y1 = "B",
                                     x2 = "C",
                                     y2 = "D",
                                     enforce_symmetry = T,
                                     legend.position = "bottom",
                                     plot_marginal_distributions = TRUE,
                                     marginal.type = "histogram",
                                     plot_cell_borders = FALSE)

p <- p1 | p2
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-61-1.png" alt="Plotting marginal plots with modified distributions - histogram" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-61)Plotting marginal plots with modified distributions - histogram</p>
</div>
Marginal violin plots might require to tweak the size ratio of the marginal plots.

```r
genes <- list("A" = Seurat::VariableFeatures(sample)[1:5],
              "B" = Seurat::VariableFeatures(sample)[6:10],
              "C" = Seurat::VariableFeatures(sample)[11:15],
              "D" = Seurat::VariableFeatures(sample)[16:20])

p1 <- SCpubr::do_DimPlot(sample = sample,
                         plot_marginal_distributions = TRUE,
                         legend.position = "bottom",
                         marginal.type = "violin",
                         marginal.size = 2,
                         plot_cell_borders = FALSE)

p2 <- SCpubr:::do_CellularStatesPlot(sample = sample,
                                     gene_list = genes,
                                     x1 = "A",
                                     y1 = "B",
                                     x2 = "C",
                                     y2 = "D",
                                     enforce_symmetry = T,
                                     legend.position = "bottom",
                                     plot_marginal_distributions = TRUE,
                                     marginal.type = "violin",
                                     marginal.size = 2,
                                     plot_cell_borders = FALSE)

p <- p1 | p2
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-62-1.png" alt="Plotting marginal plots with modified distributions - violin" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-62)Plotting marginal plots with modified distributions - violin</p>
</div>


```r
genes <- list("A" = Seurat::VariableFeatures(sample)[1:5],
              "B" = Seurat::VariableFeatures(sample)[6:10],
              "C" = Seurat::VariableFeatures(sample)[11:15],
              "D" = Seurat::VariableFeatures(sample)[16:20])

p1 <- SCpubr::do_DimPlot(sample = sample,
                         plot_marginal_distributions = TRUE,
                         legend.position = "bottom",
                         marginal.type = "boxplot",
                         marginal.size = 2,
                         plot_cell_borders = FALSE)

p2 <- SCpubr:::do_CellularStatesPlot(sample = sample,
                                     gene_list = genes,
                                     x1 = "A",
                                     y1 = "B",
                                     x2 = "C",
                                     y2 = "D",
                                     enforce_symmetry = T,
                                     legend.position = "bottom",
                                     plot_marginal_distributions = TRUE,
                                     marginal.type = "boxplot",
                                     marginal.size = 2,
                                     plot_cell_borders = FALSE)

p <- p1 | p2
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-63-1.png" alt="Plotting marginal plots with modified distributions - boxplot" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-63)Plotting marginal plots with modified distributions - boxplot</p>
</div>


```r
genes <- list("A" = Seurat::VariableFeatures(sample)[1:5],
              "B" = Seurat::VariableFeatures(sample)[6:10],
              "C" = Seurat::VariableFeatures(sample)[11:15],
              "D" = Seurat::VariableFeatures(sample)[16:20])

p1 <- SCpubr::do_DimPlot(sample = sample,
                         plot_marginal_distributions = TRUE,
                         legend.position = "bottom",
                         marginal.type = "densigram",
                         plot_cell_borders = FALSE)

p2 <- SCpubr:::do_CellularStatesPlot(sample = sample,
                                     gene_list = genes,
                                     x1 = "A",
                                     y1 = "B",
                                     x2 = "C",
                                     y2 = "D",
                                     enforce_symmetry = T,
                                     legend.position = "bottom",
                                     plot_marginal_distributions = TRUE,
                                     marginal.type = "densigram",
                                     plot_cell_borders = FALSE)

p <- p1 | p2
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-64-1.png" alt="Plotting marginal plots with modified distributions - densigram" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-64)Plotting marginal plots with modified distributions - densigram</p>
</div>

## Plotting borders around cells. {-}
In any dot-based visualization, one can plot a border around the cells with `plot_cell_borders = TRUE` and the border size can be controlled with 


```r
p1 <- SCpubr::do_DimPlot(sample = sample)

p2 <- SCpubr::do_DimPlot(sample = sample,
                         plot_cell_borders = TRUE)

p3 <- SCpubr::do_DimPlot(sample = sample,
                         plot_cell_borders = TRUE,
                         border.size = 3)

p <- p1 | p2 | p3
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-65-1.png" alt="SCpubr::do_DimPlot cell borders" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-65)SCpubr::do_DimPlot cell borders</p>
</div>

```r
p1 <- SCpubr::do_FeaturePlot(sample = sample,
                             features = "CD14")

p2 <- SCpubr::do_FeaturePlot(sample = sample,
                             plot_cell_borders = TRUE,
                             features = "CD14")

p3 <- SCpubr::do_FeaturePlot(sample = sample,
                             plot_cell_borders = TRUE,
                             border.size = 3,
                             features = "CD14")

p <- p1 | p2 | p3
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-66-1.png" alt="SCpubr::do_FeaturePlot cell borders" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-66)SCpubr::do_FeaturePlot cell borders</p>
</div>

```r
p1 <- SCpubr::do_NebulosaPlot(sample = sample,
                              features = "CD14")

p2 <- SCpubr::do_NebulosaPlot(sample = sample,
                              plot_cell_borders = TRUE,
                              features = "CD14")

p3 <- SCpubr::do_NebulosaPlot(sample = sample,
                              plot_cell_borders = TRUE,
                              border.size = 3,
                              features = "CD14")

p <- p1 | p2 | p3
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-67-1.png" alt="SCpubr::do_NebulosaPlot cell borders" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-67)SCpubr::do_NebulosaPlot cell borders</p>
</div>


```r
p1 <- SCpubr::do_BeeSwarmPlot(sample = sample,
                              feature_to_rank = "PC_1",
                              group.by = "seurat_clusters")

p2 <- SCpubr::do_BeeSwarmPlot(sample = sample,
                              feature_to_rank = "PC_1",
                              group.by = "seurat_clusters",
                              plot_cell_borders = TRUE)

p3 <- SCpubr::do_BeeSwarmPlot(sample = sample,
                              feature_to_rank = "PC_1",
                              group.by = "seurat_clusters",
                              plot_cell_borders = TRUE,
                              border.size = 3)

p <- p1 | p2 | p3
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-68-1.png" alt="SCpubr::do_BeeSwarmPlot cell borders" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-68)SCpubr::do_BeeSwarmPlot cell borders</p>
</div>


```r
genes <- list("A" = Seurat::VariableFeatures(sample)[1:5],
              "B" = Seurat::VariableFeatures(sample)[6:10],
              "C" = Seurat::VariableFeatures(sample)[11:15],
              "D" = Seurat::VariableFeatures(sample)[16:20])

p1 <- SCpubr:::do_CellularStatesPlot(sample = sample,
                                     gene_list = genes,
                                     x1 = "A",
                                     y1 = "B",
                                     x2 = "C",
                                     y2 = "D",
                                     enforce_symmetry = T,
                                     legend.position = "bottom")

p2 <- SCpubr:::do_CellularStatesPlot(sample = sample,
                                     gene_list = genes,
                                     x1 = "A",
                                     y1 = "B",
                                     x2 = "C",
                                     y2 = "D",
                                     enforce_symmetry = T,
                                     legend.position = "bottom",
                                     plot_cell_borders = TRUE)

p3 <- SCpubr:::do_CellularStatesPlot(sample = sample,
                                     gene_list = genes,
                                     x1 = "A",
                                     y1 = "B",
                                     x2 = "C",
                                     y2 = "D",
                                     enforce_symmetry = T,
                                     legend.position = "bottom",
                                     plot_cell_borders = TRUE,
                                     border.size = 3)

p <- p1 | p2 | p3
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-69-1.png" alt="SCpubr::do_BeeSwarmPlot cell borders" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-69)SCpubr::do_BeeSwarmPlot cell borders</p>
</div>
