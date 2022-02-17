# Nebulosa plots

This plot comes straight from the [Nebulosa package](http://bioconductor.org/packages/release/bioc/html/Nebulosa.html). For more information, here is their [vignette](http://bioconductor.org/packages/release/bioc/vignettes/Nebulosa/inst/doc/nebulosa_seurat.html). In short, it computes a "density" of whether the surrounding cells (in the UMAP embedding) also express the variable that you provide to the function, same variables that one could feed to `Seurat::FeaturePlot()`. This is how their default plot looks like:




```r
Nebulosa::plot_density(sample, "CD14")
```

<div class="figure" style="text-align: center">
<img src="05-NebulosaPlots_files/figure-html/unnamed-chunk-2-1.png" alt="Nebulosa plot" width="672" />
<p class="caption">(\#fig:unnamed-chunk-2)Nebulosa plot</p>
</div>

This way, not only we do know which clusters are enriched in CD14, we also know the regions of it with the hightest density of cells expressing it. Minor modifications, on the line of the rest of plots, are applied in `SCpubr`:

```r
SCpubr::do_NebulosaPlot(sample, features = "CD14")
```

<div class="figure" style="text-align: center">
<img src="05-NebulosaPlots_files/figure-html/unnamed-chunk-3-1.png" alt="SCpubr Nebulosa plot." width="672" />
<p class="caption">(\#fig:unnamed-chunk-3)SCpubr Nebulosa plot.</p>
</div>

Then, this type visualization becomes a natural partner to `Seurat::FeaturePlot()' as not only we are able to visualize the expression of a variable, but also query the density of the surrounding cells. Here is an example:


```r
SCpubr::do_FeaturePlot(sample, features = "CD14") | SCpubr::do_NebulosaPlot(sample, features = "CD14")
```

<div class="figure" style="text-align: center">
<img src="05-NebulosaPlots_files/figure-html/unnamed-chunk-4-1.png" alt="SCpubr FeaturePlot and NebulosaPlot." width="768" />
<p class="caption">(\#fig:unnamed-chunk-4)SCpubr FeaturePlot and NebulosaPlot.</p>
</div>

[Nebulosa](https://github.com/powellgenomicslab/Nebulosa/blob/master/R/plotting.R) package also offers the option to query multiple features at the same time:


```r
SCpubr::do_NebulosaPlot(sample, features = c("CD14", "CD8A"))
```

<div class="figure" style="text-align: center">
<img src="05-NebulosaPlots_files/figure-html/unnamed-chunk-5-1.png" alt="SCpubr Nebulosa plot with multiple features." width="960" />
<p class="caption">(\#fig:unnamed-chunk-5)SCpubr Nebulosa plot with multiple features.</p>
</div>

But, more intriguingly, it can also compute the **joint** density of the two features. This is achieved by parsing `joint = TRUE`.


```r
SCpubr::do_NebulosaPlot(sample, features = c("CD14", "CD8A"), joint = TRUE)
```

<div class="figure" style="text-align: center">
<img src="05-NebulosaPlots_files/figure-html/unnamed-chunk-6-1.png" alt="SCpubr Nebulosa plot with joint density" width="1440" />
<p class="caption">(\#fig:unnamed-chunk-6)SCpubr Nebulosa plot with joint density</p>
</div>

If we were interested in retrieving only the joint density plot, we can accomplish it as:


```r
p <- SCpubr::do_NebulosaPlot(sample, features = c("CD14", "CD8A"), joint = TRUE, combine = F)
p[[3]]
```

<div class="figure" style="text-align: center">
<img src="05-NebulosaPlots_files/figure-html/unnamed-chunk-7-1.png" alt="SCpubr Nebulosa plot with joint density, selecting only the last plot" width="672" />
<p class="caption">(\#fig:unnamed-chunk-7)SCpubr Nebulosa plot with joint density, selecting only the last plot</p>
</div>

## Modify color maps
Same as in `SCpubr::do_FeaturePlot()`, it is also change the color map of the plot to one of the eight possible ones defined in [viridis](https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html). This is achieved by using `viridis_color_map` parameter and the color map name or code (capital letter). Options are:

- A - magma color map.
- B - inferno color map.
- C - plasma color map.
- D - viridis color map.
- E - cividis color map.
- F - rocket color map.
- G - mako color map.
- H - turbo  color map.


```r
p1 <- SCpubr::do_NebulosaPlot(sample = sample, features = "CD8A", viridis_color_map = "A", plot.title = "Magma")
p2 <- SCpubr::do_NebulosaPlot(sample = sample, features = "CD8A", viridis_color_map = "B", plot.title = "Inferno")
p3 <- SCpubr::do_NebulosaPlot(sample = sample, features = "CD8A", viridis_color_map = "C", plot.title = "Plasma")
p4 <- SCpubr::do_NebulosaPlot(sample = sample, features = "CD8A", viridis_color_map = "D", plot.title = "Viridis")
p5 <- SCpubr::do_NebulosaPlot(sample = sample, features = "CD8A", viridis_color_map = "E", plot.title = "Cividis")
p6 <- SCpubr::do_NebulosaPlot(sample = sample, features = "CD8A", viridis_color_map = "F", plot.title = "Rocket")
p7 <- SCpubr::do_NebulosaPlot(sample = sample, features = "CD8A", viridis_color_map = "G", plot.title = "Mako")
p8 <- SCpubr::do_NebulosaPlot(sample = sample, features = "CD8A", viridis_color_map = "H", plot.title = "Turbo")
#> Warning in check_viridis_color_map(viridis_color_map =
#> viridis_color_map, : The selected option is not the most
#> adequate for a continuous color scale.

p <- patchwork::wrap_plots(list(p1, p2, p3, p4, p5, p6, p7, p8), ncol = 2, byrow = TRUE)
p
```

<div class="figure" style="text-align: center">
<img src="05-NebulosaPlots_files/figure-html/unnamed-chunk-8-1.png" alt="SCpubr Nebulosa plot modifying viridis color maps." width="960" />
<p class="caption">(\#fig:unnamed-chunk-8)SCpubr Nebulosa plot modifying viridis color maps.</p>
</div>
