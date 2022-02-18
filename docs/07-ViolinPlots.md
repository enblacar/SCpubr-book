# Violin plots

Violin plots require very little description. They are a depiction of the distribution of a variable. It makes it ideal in order to show differential enrichment patterns alongside different groups. As such, it is also included in `Seurat` under `Seurat::VlnPlot()` function. The very first time a new user encounters this function is likely going to be when querying for different QC paramters, such as the number of UMIs, the number of genes or the percentage of mitochondrial RNA. This is how it looks for the number of UMIs:





## Basic violin plots.

```r
p <- Seurat::VlnPlot(sample, 
                     features = "nCount_RNA")
p
```

<div class="figure" style="text-align: center">
<img src="07-ViolinPlots_files/figure-html/unnamed-chunk-2-1.png" alt="Seurat's violin plot." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-2)Seurat's violin plot.</p>
</div>
The one thing that really stands out here is, indeed, the extra dots that are being plotted alongside the violin plot. Since each dot represent a cell, it quickly becomes the dominant feature of the figure. One can play with the alpha of the dots to reduce their presence:


```r
p <- Seurat::VlnPlot(sample, 
                     features = "nCount_RNA")
# "Surgically" add the alpha parameter in the ggplot2 object.
p$layers[[2]]$aes_params$alpha <- 0.05
p
```

<div class="figure" style="text-align: center">
<img src="07-ViolinPlots_files/figure-html/unnamed-chunk-3-1.png" alt="Seurat's violin plot with transparent dots." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-3)Seurat's violin plot with transparent dots.</p>
</div>

But still, by making the dots almost invisible, we still observe their dominance on the bigger clusters. Therefore, it's better to remove it. This, together with other modifications are the basis of `SCpubr::do_VlnPlot()`. This is how the default plot looks like:


```r
p <- SCpubr::do_VlnPlot(sample = sample, 
                        features = "nCount_RNA")
p
```

<div class="figure" style="text-align: center">
<img src="07-ViolinPlots_files/figure-html/unnamed-chunk-4-1.png" alt="SCpubr's violin plot." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-4)SCpubr's violin plot.</p>
</div>

In addition to removing the dots, a boxplot is added to each violin shape, to get a better sense of the quantiles of the distribution. This effect can be removed by using `plot_boxplot = FALSE`. Also, legend is by default removed, as the groups are being displayed already in the X axis. 


```r
p <- SCpubr::do_VlnPlot(sample = sample, 
                        features = "nCount_RNA",
                        plot_boxplot = FALSE)
p
```

<div class="figure" style="text-align: center">
<img src="07-ViolinPlots_files/figure-html/unnamed-chunk-5-1.png" alt="SCpubr's violin plot without box plots." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-5)SCpubr's violin plot without box plots.</p>
</div>

If we want to rotate the X axis labels, we can also do that providing `rotate_x_labels = TRUE/FALSE`, being the value a vector of logical values (TRUE or FALSE) of length equal to the number of features.


```r
p <- SCpubr::do_VlnPlot(sample = sample, 
                        features = c("nCount_RNA", "nFeature_RNA"),
                        rotate_x_labels = c(FALSE, TRUE),
                        ncol = 1)
p
```

<div class="figure" style="text-align: center">
<img src="07-ViolinPlots_files/figure-html/unnamed-chunk-6-1.png" alt="SCpubr's violin plot rotating x axis." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-6)SCpubr's violin plot rotating x axis.</p>
</div>
However, please note that if the names of the current identities are long enough, this will result in them overlapping one another.


## Violin plots as a means of QC

For QC analyses, users might want to also add some other features such as a line indicating where to put the cutoff. This can be achieved by using `y_cut` parameter. Currently, only one value per plot for `y_cut` can be used.


```r
p <- SCpubr::do_VlnPlot(sample = sample, 
                        features = "nCount_RNA", 
                        y_cut = 30000)
p
```

<div class="figure" style="text-align: center">
<img src="07-ViolinPlots_files/figure-html/unnamed-chunk-7-1.png" alt="SCpubr's violin plot with horizontal line." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-7)SCpubr's violin plot with horizontal line.</p>
</div>
When multiple features are queried, the user can set up different horizontal lines parsing them as a vector to `y_cut`. Also, the same can be achieved for the individual plot titles by using the `individual.titles` parameter. The only restriction, is that the vector has to be of the same length as the number of features. If for a particular plot, we do not want to modify anything, use `NA` instead.


```r
p <- SCpubr::do_VlnPlot(sample = sample, 
                        features = c("nCount_RNA", "nFeature_RNA"), 
                        y_cut = c(NA, 5000), 
                        individual.titles = c("UMIs", NA),
                        ncol = 1)
p
```

<div class="figure" style="text-align: center">
<img src="07-ViolinPlots_files/figure-html/unnamed-chunk-8-1.png" alt="SCpubr's violin plot with multiple features." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-8)SCpubr's violin plot with multiple features.</p>
</div>
