# Violin plots

Violin plots require very little description. They are a depiction of the distribution of a variable. It makes it ideal in order to show differential enrichment patterns alongside different groups. As such, it is also included in `Seurat` under `Seurat::VlnPlot()` function. The very first time a new user encounters this function is likely going to be when querying for different QC paramters, such as the number of UMIs, the number of genes or the percentage of mitochondrial RNA. This is how it looks for the number of UMIs:





## Basic usage

```r
p <- Seurat::VlnPlot(sample, 
                     feature = "nCount_RNA")
p
```

<div class="figure" style="text-align: center">
<img src="07-ViolinPlots_files/figure-html/unnamed-chunk-2-1.png" alt="Seurat's violin plot." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-2)Seurat's violin plot.</p>
</div>
The one thing that really stands out here is, indeed, the extra dots that are being plotted alongside the violin plot. Since each dot represent a cell, it quickly becomes the dominant feature of the figure. One can play with the alpha of the dots to reduce their presence:


```r
p <- Seurat::VlnPlot(sample, 
                     feature = "nCount_RNA")
# "Surgically" add the alpha parameter in the ggplot2 object.
p$layers[[2]]$aes_params$alpha <- 0.05
p
```

<div class="figure" style="text-align: center">
<img src="07-ViolinPlots_files/figure-html/unnamed-chunk-3-1.png" alt="Seurat's violin plot with transparent dots." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-3)Seurat's violin plot with transparent dots.</p>
</div>

But still, by making the dots almost invisible, we still observe their dominance on the bigger clusters. Therefore, it's better to remove it. This, together with other modifications are the basis of `SCpubr::do_ViolinPlot()`. This is how the default plot looks like:


```r
# Basic violin plot.
p <- SCpubr::do_ViolinPlot(sample = sample, 
                           feature = "nCount_RNA")
p
```

<div class="figure" style="text-align: center">
<img src="07-ViolinPlots_files/figure-html/unnamed-chunk-4-1.png" alt="SCpubr's violin plot." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-4)SCpubr's violin plot.</p>
</div>

In addition to removing the dots, a boxplot is added to each violin shape, to get a better sense of the quantiles of the distribution. This effect can be removed by using `plot_boxplot = FALSE`. Also, legend is by default removed, as the groups are being displayed already in the X axis. 


```r
# Remove the box plots.
p <- SCpubr::do_ViolinPlot(sample = sample, 
                           feature = "nCount_RNA",
                           plot_boxplot = FALSE)
p
```

<div class="figure" style="text-align: center">
<img src="07-ViolinPlots_files/figure-html/unnamed-chunk-5-1.png" alt="SCpubr's violin plot without box plots." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-5)SCpubr's violin plot without box plots.</p>
</div>

If we want to rotate the X axis labels, we can also do that providing `rotate_x_axis_labels = TRUE/FALSE`:

```r
# Rotate x axis labels.
p <- SCpubr::do_ViolinPlot(sample = sample, 
                        feature = c("nCount_RNA"),
                        rotate_x_axis_labels = FALSE)
p
```

<div class="figure" style="text-align: center">
<img src="07-ViolinPlots_files/figure-html/unnamed-chunk-6-1.png" alt="SCpubr's violin plot rotating x axis." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-6)SCpubr's violin plot rotating x axis.</p>
</div>

## Violin plots as a means of QC

For QC analyses, users might want to also add some other features such as a line indicating where to put the cutoff. This can be achieved by using `y_cut` parameter. Currently, only one value per plot for `y_cut` can be used.


```r
# Add horizontal lines.
p <- SCpubr::do_ViolinPlot(sample = sample, 
                           feature = "nCount_RNA", 
                           y_cut = 25000)
p
```

<div class="figure" style="text-align: center">
<img src="07-ViolinPlots_files/figure-html/unnamed-chunk-7-1.png" alt="SCpubr's violin plot with horizontal line." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-7)SCpubr's violin plot with horizontal line.</p>
</div>

## Modifying aesthetics
Sometimes we might want to modify the overall look of the violin plots. For instance, the line width of both the violin shape and the box plot can be modified with `line_width` parameter, which defaults to 1.


```r
# Increase line width.
p1 <- SCpubr::do_ViolinPlot(sample = sample,
                         feature = "nCount_RNA")

p2 <- SCpubr::do_ViolinPlot(sample = sample,
                         feature = "nCount_RNA",
                         line_width = 2)

p <- p1 / p2
p
```

<div class="figure" style="text-align: center">
<img src="07-ViolinPlots_files/figure-html/unnamed-chunk-8-1.png" alt="SCpubr's violin plot with increased line width" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-8)SCpubr's violin plot with increased line width</p>
</div>

Also, the width of the box plots can be modified with `boxplot_width` parameter, which defaults to 0.2. Be aware that this parameter scales the width of the boxplot. This is, if a value of 1 is provided, the box plot will take as much space as the violin shape. It is recommended to deviate from 0.2 by a small amount.


```r
# Decrease boxplot width.
p1 <- SCpubr::do_ViolinPlot(sample = sample,
                            feature = "nCount_RNA")

p2 <- SCpubr::do_ViolinPlot(sample = sample,
                            feature = "nCount_RNA",
                            boxplot_width = 0.1)

p <- p1 / p2
p
```

<div class="figure" style="text-align: center">
<img src="07-ViolinPlots_files/figure-html/unnamed-chunk-9-1.png" alt="SCpubr's violin plot with decreased box plot width" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-9)SCpubr's violin plot with decreased box plot width</p>
</div>

