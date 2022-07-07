# Common features across plots {-}



This page aims to assess common functionalities present across the different functions in the package.

## Changing the font size.
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
p <- SCpubr::do_DotPlot(sample = sample,
                        features = "CD14") | 
     SCpubr::do_DotPlot(sample = sample,
                        features = "CD14",
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
                                   enforce_simmetry = T) |
     SCpubr::do_CellularStatesPlot(sample = sample,
                                   gene_list = genes,
                                   x1 = "A",
                                   y1 = "B",
                                   x2 = "C",
                                   y2 = "D",
                                   enforce_simmetry = T,
                                   font.size = 18)
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-10-1.png" alt="SCpubr do_CellularStatesPlot increasing font.size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-10)SCpubr do_CellularStatesPlot increasing font.size.</p>
</div>

## Change font type of the plots.

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
p <- SCpubr::do_DotPlot(sample = sample,
                        features = "CD14",
                        font.type = "mono") | 
     SCpubr::do_DotPlot(sample = sample,
                        features = "CD14",
                        font.type = "sans") |
     SCpubr::do_DotPlot(sample = sample,
                        features = "CD14",
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
                                   enforce_simmetry = T,
                                   font.type = "mono") |
     SCpubr::do_CellularStatesPlot(sample = sample,
                                   gene_list = genes,
                                   x1 = "A",
                                   y1 = "B",
                                   x2 = "C",
                                   y2 = "D",
                                   enforce_simmetry = T,
                                   font.type = "sans") |
     SCpubr::do_CellularStatesPlot(sample = sample,
                                   gene_list = genes,
                                   x1 = "A",
                                   y1 = "B",
                                   x2 = "C",
                                   y2 = "D",
                                   enforce_simmetry = T,
                                   font.type = "serif")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-19-1.png" alt="SCpubr do_CellularStatesPlot changing font type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-19)SCpubr do_CellularStatesPlot changing font type.</p>
</div>

## Adding plot titles, subtitles and captions to plots.

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
p <- SCpubr::do_DotPlot(sample = sample,
                        features = "CD14", 
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
                                   enforce_simmetry = T,
                                   plot.title = "This is a title",
                                   plot.subtitle = "This is a subtitle",
                                   plot.caption = "This is a caption")
p
```

<div class="figure" style="text-align: center">
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-28-1.png" alt="SCpubr do_CellularStatesPlot adding title, subtitle and caption." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-28)SCpubr do_CellularStatesPlot adding title, subtitle and caption.</p>
</div>

### Further customization 

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

## Change between legend types in continuous variables.

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
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-30-1.png" alt="SCpubr do_FeaturePlot changing font type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-30)SCpubr do_FeaturePlot changing font type.</p>
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
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-31-1.png" alt="SCpubr do_NebulosaPlot changing font type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-31)SCpubr do_NebulosaPlot changing font type.</p>
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
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-32-1.png" alt="SCpubr do_BeeSwarmPlot changing font type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-32)SCpubr do_BeeSwarmPlot changing font type.</p>
</div>



```r
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
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-33-1.png" alt="SCpubr do_DotPlot changing font type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-33)SCpubr do_DotPlot changing font type.</p>
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
<img src="95-CommonFeatures_files/figure-html/unnamed-chunk-34-1.png" alt="SCpubr do_TermEnrichmentPlot changing font type." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-34)SCpubr do_TermEnrichmentPlot changing font type.</p>
</div>

## Relocating the legend

## Modifying colors

### Categorical variables

### Continuous variables
