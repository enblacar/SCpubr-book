# Nebulosa plots

This plot comes straight from the [Nebulosa package](http://bioconductor.org/packages/release/bioc/html/Nebulosa.html). For more information, here is their [vignette](http://bioconductor.org/packages/release/bioc/vignettes/Nebulosa/inst/doc/nebulosa_seurat.html). In short, it computes a "density" of whether the surrounding cells (in the UMAP embedding) also express the variable that you provide to the function, same variables that one could feed to `Seurat::FeaturePlot()`. This is how their default plot looks like:





## Basic usage

```r
p <- Nebulosa::plot_density(sample,
                            features = "CD14")
p
```

<div class="figure" style="text-align: center">
<img src="05-NebulosaPlots_files/figure-html/unnamed-chunk-2-1.png" alt="Nebulosa plot" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-2)Nebulosa plot</p>
</div>

This way, not only we do know which clusters are enriched in CD14, we also know the regions of it with the highest density of cells expressing it. Minor modifications, on the line of the rest of plots, are applied in `SCpubr`:

```r
p <- SCpubr::do_NebulosaPlot(sample = sample, 
                             features = "CD14")
p
```

<div class="figure" style="text-align: center">
<img src="05-NebulosaPlots_files/figure-html/unnamed-chunk-3-1.png" alt="SCpubr Nebulosa plot." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-3)SCpubr Nebulosa plot.</p>
</div>

Then, this type visualization becomes a natural partner to `Seurat::FeaturePlot()' as not only we are able to visualize the expression of a variable, but also query the density of the surrounding cells. Here is an example:


```r
p1 <- SCpubr::do_FeaturePlot(sample = sample, 
                             features = "CD14") 
p2 <- SCpubr::do_NebulosaPlot(sample = sample, 
                              features = "CD14")
p1 | p2
```

<div class="figure" style="text-align: center">
<img src="05-NebulosaPlots_files/figure-html/unnamed-chunk-4-1.png" alt="SCpubr FeaturePlot and NebulosaPlot." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-4)SCpubr FeaturePlot and NebulosaPlot.</p>
</div>

[Nebulosa](https://github.com/powellgenomicslab/Nebulosa/blob/master/R/plotting.R) package also offers the option to query multiple features at the same time:


```r
p <- SCpubr::do_NebulosaPlot(sample, 
                             features = c("CD14", "CD8A"))
p
```

<div class="figure" style="text-align: center">
<img src="05-NebulosaPlots_files/figure-html/unnamed-chunk-5-1.png" alt="SCpubr Nebulosa plot with multiple features." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-5)SCpubr Nebulosa plot with multiple features.</p>
</div>

## Compute joint densities
But, more intriguingly, it can also compute the **joint** density of the features. This is achieved by parsing `joint = TRUE`.


```r
p <- SCpubr::do_NebulosaPlot(sample = sample, 
                             features = c("CD14", "CD8A"), 
                             joint = TRUE)
p 
```

<div class="figure" style="text-align: center">
<img src="05-NebulosaPlots_files/figure-html/unnamed-chunk-6-1.png" alt="SCpubr Nebulosa plot with joint density" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-6)SCpubr Nebulosa plot with joint density</p>
</div>

If we were interested in retrieving only the joint density plot, we can accomplish it with `return_only_joint` parameter. Please note that, since this will return only one plot, if wanted to modify the plot title, use `plot.title` instead:


```r
features.use <- c("CD14", "CD8A")

p <- SCpubr::do_NebulosaPlot(sample = sample, 
                             features = c("CD14", "CD8A"), 
                             joint = TRUE, 
                             return_only_joint = TRUE,
                             plot.title = "Joint density CD14+-CD8A+")

p
```

<div class="figure" style="text-align: center">
<img src="05-NebulosaPlots_files/figure-html/unnamed-chunk-7-1.png" alt="SCpubr Nebulosa plot with joint density, selecting only the last plot" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-7)SCpubr Nebulosa plot with joint density, selecting only the last plot</p>
</div>


