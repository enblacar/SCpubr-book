# Dim plots

DimPlots are, probably, one of the most iconic visualizations from `Seurat`. It allows the user to visualize the cells in a dimensional reduction embedding such as `PCA` or `UMAP`. The cells can be, then, colored by any desired groups. In short, this visualization allows the user to plot **any kind of categorical data** onto the cells in the dimesional reduction embedding. This is achieved by using `Seurat::DimPlot()` funtion:






```r
Seurat::DimPlot(sample)
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-2-1.png" alt="Default DimPlot." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-2)Default DimPlot.</p>
</div>

Overall, this is a pretty neat visualization, but there are quite some changes that one would like to implement. For instance, shuffling the cells so that there is no overlap of cells just due to the cluster names.


```r
Seurat::DimPlot(sample, shuffle = T)
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-3-1.png" alt="DimPlot with the cells shuffled." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-3)DimPlot with the cells shuffled.</p>
</div>

Furthermore, one would think about the *need* of the axes. If, by consensus, UMAPs are shown plotting the first UMAP component on the X axis and the second on the Y axis, then showing them becomes redundant, specially when one can not truly rely on the numbers shown by the scales. 


```r
Seurat::DimPlot(sample, shuffle = T) + Seurat::NoAxes()
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-4-1.png" alt="DimPlot without axes." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-4)DimPlot without axes.</p>
</div>

Right now, we can observe a couple of things. First, is that the dot size is rather small. Let's set it to 0.5.


```r
Seurat::DimPlot(sample, shuffle = T, pt.size = 0.5) + Seurat::NoAxes()
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-5-1.png" alt="DimPlot with increased dot size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-5)DimPlot with increased dot size.</p>
</div>

Still, the legend seems rather small. Let's increase it's font size and set it to bold so that it can better read.


```r
Seurat::DimPlot(sample, shuffle = T, pt.size = 0.5) + 
  Seurat::NoAxes() +
  ggplot2::theme(legend.text = ggplot2::element_text(size = 16, face = "bold"),
                 legend.title = ggplot2::element_text(size = 16, face = "bold"))
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-6-1.png" alt="DimPlot with increased font size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-6)DimPlot with increased font size.</p>
</div>

We would also like to add a title to our plot, to best describe it.


```r
Seurat::DimPlot(sample, shuffle = T, pt.size = 0.5) + 
  Seurat::NoAxes() +
  ggplot2::ggtitle("My awesome SC dataset") +
  ggplot2::theme(legend.text = ggplot2::element_text(size = 16, face = "bold"),
                 legend.title = ggplot2::element_text(size = 16, face = "bold"))
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-7-1.png" alt="DimPlot with title." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-7)DimPlot with title.</p>
</div>

And, naturally, we would like to increase the font size of the title and put it in bold and centered.


```r
Seurat::DimPlot(sample, shuffle = T, pt.size = 0.5) + 
  Seurat::NoAxes() +
  ggplot2::ggtitle("My awesome SC dataset") +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 20, face = "bold", hjust = 0.5),
                 legend.text = ggplot2::element_text(size = 16, face = "bold"),
                 legend.title = ggplot2::element_text(size = 16, face = "bold"))
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-8-1.png" alt="DimPlot with bigger and bold title." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-8)DimPlot with bigger and bold title.</p>
</div>

Now, we would like to modify the color palette. This palette has too bright colors, and we want something more toned down.


```r
num_clusters <- length(unique(sample$seurat_clusters))
color_scale <- colortools::setColors("#457b9d", num_clusters)
names(color_scale) <- sort(unique(sample$seurat_clusters))

Seurat::DimPlot(sample, shuffle = T, pt.size = 0.5, cols = color_scale) + 
  Seurat::NoAxes() +
  ggplot2::ggtitle("My awesome SC dataset") +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 20, face = "bold", hjust = 0.5),
                 legend.text = ggplot2::element_text(size = 16, face = "bold"),
                 legend.title = ggplot2::element_text(size = 16, face = "bold"))
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-9-1.png" alt="DimPlot with custom color scale." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-9)DimPlot with custom color scale.</p>
</div>

The legend on the right side seems off, what if we were to have long cluster names? It would inevitable take a lot of space from the actual plot. Let's better put it on the bottom.


```r
num_clusters <- length(unique(sample$seurat_clusters))
color_scale <- colortools::setColors("#457b9d", num_clusters)
names(color_scale) <- sort(unique(sample$seurat_clusters))

Seurat::DimPlot(sample, shuffle = T, pt.size = 0.5, cols = color_scale) + 
  ggpubr::theme_pubr(legend = "bottom") +
  Seurat::NoAxes() +
  ggplot2::ggtitle("My awesome SC dataset") +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 20, face = "bold", hjust = 0.5),
                 legend.text = ggplot2::element_text(size = 16, face = "bold"),
                 legend.title = ggplot2::element_text(size = 16, face = "bold"))
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-10-1.png" alt="DimPlot with legend at the bottom." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-10)DimPlot with legend at the bottom.</p>
</div>

Still, there are too many columns in the legend. Let's rearrange it into four columns.


```r
num_clusters <- length(unique(sample$seurat_clusters))
color_scale <- colortools::setColors("#457b9d", num_clusters)
names(color_scale) <- sort(unique(sample$seurat_clusters))

Seurat::DimPlot(sample, shuffle = T, pt.size = 0.5, cols = color_scale) + 
  ggpubr::theme_pubr(legend = "bottom") +
  Seurat::NoAxes() +
  ggplot2::ggtitle("My awesome SC dataset") +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 20, face = "bold", hjust = 0.5),
                 legend.text = ggplot2::element_text(size = 16, face = "bold"),
                 legend.title = ggplot2::element_text(size = 16, face = "bold")) + 
  ggplot2::guides(color = ggplot2::guide_legend(ncol = 4,
                                                byrow = F))
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-11-1.png" alt="DimPlot with legend at the bottom in four columns." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-11)DimPlot with legend at the bottom in four columns.</p>
</div>

But now the legend icon sizes are too small! We have to fix this.


```r
num_clusters <- length(unique(sample$seurat_clusters))
color_scale <- colortools::setColors("#457b9d", num_clusters)
names(color_scale) <- sort(unique(sample$seurat_clusters))

Seurat::DimPlot(sample, shuffle = T, pt.size = 0.5, cols = color_scale) + 
  ggpubr::theme_pubr(legend = "bottom") +
  Seurat::NoAxes() +
  ggplot2::ggtitle("My awesome SC dataset") +
  ggplot2::theme(plot.title = ggplot2::element_text(size = 20, face = "bold", hjust = 0.5),
                 legend.text = ggplot2::element_text(size = 16, face = "bold"),
                 legend.title = ggplot2::element_text(size = 16, face = "bold")) + 
  ggplot2::guides(color = ggplot2::guide_legend(ncol = 4,
                                                byrow = F,
                                                override.aes = list(size = 4)))
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-12-1.png" alt="DimPlot with legend at the bottom in four columns." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-12)DimPlot with legend at the bottom in four columns.</p>
</div>

As of now, this plot looks much better and polished than the default counterpart. This, is the setting ground for `SCpubr::do_DimPlot()`. 

## Regular DimPlots

This is the default output from `SCpubr::do_DimPlot()`. 


```r
SCpubr::do_DimPlot(sample)
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-13-1.png" alt="SCpubr DimPlot." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-13)SCpubr DimPlot.</p>
</div>

We can add a title with the `plot.title` parameter.


```r
SCpubr::do_DimPlot(sample, plot.title = "My awesome SC data set")
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-14-1.png" alt="SCpubr DimPlot with title." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-14)SCpubr DimPlot with title.</p>
</div>

We can change the legend location and number of columns with `legend.position` and `legend.ncol`.


```r
SCpubr::do_DimPlot(sample, 
                   plot.title = "My awesome SC data set", 
                   legend.position = "left", 
                   legend.ncol = 4)
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-15-1.png" alt="SCpubr DimPlot with legend to the left." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-15)SCpubr DimPlot with legend to the left.</p>
</div>


## Highlighting cells

One of the nice features of `Seurat::DimPlot()` is the possibility of highlighting a certain group of cells in the DimPlot. This is achieved by using the `cells.highligh` parameter. This is how the default plot looks like.


```r
# Select 1000 random cells out of clusters 1, 5 and 7.
cells.use <- sample(colnames(sample[, sample$seurat_clusters %in% c("1", "5", "7")]), 1000)
Seurat::DimPlot(sample, cells.highlight = cells.use)
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-16-1.png" alt="Seurat DimPlot highlighting cells." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-16)Seurat DimPlot highlighting cells.</p>
</div>

This is how SCpubr returns this plot. For this, the same parameter has to be set up.


```r
# Select 1000 random cells out of clusters 1, 5 and 7.
cells.use <- sample(colnames(sample[, sample$seurat_clusters %in% c("1", "5", "7")]), 1000)
SCpubr::do_DimPlot(sample, cells.highlight = cells.use)
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-17-1.png" alt="SCpubr DimPlot highlighting cells." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-17)SCpubr DimPlot highlighting cells.</p>
</div>

By default, the size of all cells in `SCpubr::do_DimPlot()` is the same. However, the size of the highlighted dots can be modified with the parameter `sizes.highlight` from Seurat.


```r
# Select 1000 random cells out of clusters 1, 5 and 7.
cells.use <- sample(colnames(sample[, sample$seurat_clusters %in% c("1", "5", "7")]), 1000)
SCpubr::do_DimPlot(sample, cells.highlight = cells.use, sizes.highlight = 2)
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-18-1.png" alt="SCpubr DimPlot highlighting cells bigger dot size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-18)SCpubr DimPlot highlighting cells bigger dot size.</p>
</div>

## Splitting by a category

Another useful paramter of `Seurat::DimPlot` is `split.by`, which allows you to split your DimPlot into multiple panels, each one containing a different unique value of the metadata variable you have provided to the argument. One can understand this as using the `group.by` parameter and then splitting the resulting DimPlot into different panels. In this example, we are going to use the different clusters as an example This is how it looks by default:


```r
# Using ncol = 5 to maintain some of the proportions. 
Seurat::DimPlot(sample, split.by = "seurat_clusters", ncol = 5)
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-19-1.png" alt="Seurat DimPlot using split.by." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-19)Seurat DimPlot using split.by.</p>
</div>
As can be observed, this plots accomplish the task of separating the cells into each panel, but the approach followed actually makes interpretation difficult. Clusters such as Cluster 9, with fewer cells, tell pretty much nothing. Not knowing how the original UMAP looked like is a major downside of this approach. This is where `SCpubr` focus. Instead of using `Seurat`'s `split.by` parameter, it generates as many plots as unique values in the metadata to split the plot by, but uses `cells.highlight` instead, which keeps the rest of cells greyed out. This is how it looks:


```r
# Using ncol = 5 to maintain some of the proportions.
# Using legend = F to remove unwanted repeated legends.
SCpubr::do_DimPlot(sample, split.by = "seurat_clusters", ncol = 5, legend = F)
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-20-1.png" alt="SCpubr DimPlot using split.by." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-20)SCpubr DimPlot using split.by.</p>
</div>

This way, we can see that clusters such as Cluster 7 are way more disperse than the rest, accounting not only for standalone groups of cells but also blending in other bigger clusters. Actually, the user might want to change the color of the highlighted cells in this split DimPlot. This is achieved by using `colors.split` parameter and providing either a color name recognized by `ggplot2` or (recommended) a HEX code.



```r
# Using ncol = 5 to maintain some of the proportions.
# Using legend = F to remove unwanted repeated legends.
SCpubr::do_DimPlot(sample, split.by = "seurat_clusters", ncol = 5, legend = F, colors.split = "black")
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-21-1.png" alt="SCpubr DimPlot using split.by with a changed color" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-21)SCpubr DimPlot using split.by with a changed color</p>
</div>



Furthermore, one might also want to color each cluster by the original color. This can be achieved by using the argument `colorss.split`, either providing a named vector of each cluster (or metadata variable unique value) as names and color hex codes as values or `TRUE`, thus resorting to the default `SCpubr` categorical coloring. 


```r
# Using ncol = 5 to maintain some of the proportions.
# Using legend = F to remove unwanted repeated legends.
SCpubr::do_DimPlot(sample, split.by = "seurat_clusters", ncol = 5, legend = F, colors.split = TRUE)
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-22-1.png" alt="SCpubr DimPlot using split.by with default SCpubr colors" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-22)SCpubr DimPlot using split.by with default SCpubr colors</p>
</div>






