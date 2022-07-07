# Dim plots

DimPlots are, probably, one of the most iconic visualizations from `Seurat`. It allows the user to visualize the cells in a dimensional reduction embedding such as `PCA` or `UMAP`. The cells can be, then, colored by any desired groups. In short, this visualization allows the user to plot **any kind of categorical data** onto the cells in the dimensional reduction embedding. 

## Figure build-up
In this subsection, we will break down the several modifications that are applied to figures by `SCpubr`. First, let's plot a DimPlot. This is achieved by using `Seurat::DimPlot()` function:




```r
p <- Seurat::DimPlot(sample)
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-2-1.png" alt="Default DimPlot." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-2)Default DimPlot.</p>
</div>

Overall, this is a pretty neat visualization, but there are quite some changes that one would like to implement. For instance, shuffling the cells so that there is no overlap of cells just due to the cluster names.


```r
p <- Seurat::DimPlot(sample, 
                     shuffle = T)
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-3-1.png" alt="DimPlot with the cells shuffled." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-3)DimPlot with the cells shuffled.</p>
</div>

Furthermore, one would think about the *need* of the axes. If, by consensus, UMAPs are shown plotting the first UMAP component on the X axis and the second on the Y axis, then showing them becomes redundant, specially when one can not truly rely on the numbers shown by the scales. 


```r
p <- Seurat::DimPlot(sample, 
                     shuffle = T) + 
     Seurat::NoAxes()
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-4-1.png" alt="DimPlot without axes." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-4)DimPlot without axes.</p>
</div>

Right now, we can observe a couple of things. First, is that the dot size is rather small. Let's set it to 0.5.


```r
p <- Seurat::DimPlot(sample, 
                     shuffle = T, 
                     pt.size = 0.5) + 
     Seurat::NoAxes()
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-5-1.png" alt="DimPlot with increased dot size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-5)DimPlot with increased dot size.</p>
</div>

Still, the legend seems rather small. Let's increase it's font size and set it to bold so that it can better read.


```r
p <- Seurat::DimPlot(sample, 
                     shuffle = T, 
                     pt.size = 0.5) + 
    Seurat::NoAxes() +
    ggplot2::theme(legend.text = ggplot2::element_text(size = 12, 
                                                       face = "bold"),
                   legend.title = ggplot2::element_text(size = 12, 
                                                        face = "bold"))
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-6-1.png" alt="DimPlot with increased font size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-6)DimPlot with increased font size.</p>
</div>

We would also like to add a title to our plot, to best describe it.


```r
p <- Seurat::DimPlot(sample, 
                     shuffle = T, 
                     pt.size = 0.5) + 
     Seurat::NoAxes() +
     ggplot2::ggtitle("My awesome SC dataset") +
     ggplot2::theme(legend.text = ggplot2::element_text(size = 12, 
                                                        face = "bold"),
                    legend.title = ggplot2::element_text(size = 12, 
                                                         face = "bold"))
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-7-1.png" alt="DimPlot with title." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-7)DimPlot with title.</p>
</div>

And, naturally, we would like to increase the font size of the title and put it in bold and centered.


```r
p <- Seurat::DimPlot(sample, 
                     shuffle = T, 
                     pt.size = 0.5) + 
     Seurat::NoAxes() +
     ggplot2::ggtitle("My awesome SC dataset") +
     ggplot2::theme(plot.title = ggplot2::element_text(size = 16, 
                                                       face = "bold", 
                                                       hjust = 0.5),
                    legend.text = ggplot2::element_text(size = 12, 
                                                        face = "bold"),
                    legend.title = ggplot2::element_text(size = 12, 
                                                         face = "bold"))
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-8-1.png" alt="DimPlot with bigger and bold title." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-8)DimPlot with bigger and bold title.</p>
</div>

Now, we would like to modify the color palette. This palette has too bright colors, and we want something more toned down.


```r
num_clusters <- length(unique(sample$seurat_clusters))
color_scale <- colorspace::qualitative_hcl(num_clusters, palette = "Dark 3")
names(color_scale) <- sort(unique(sample$seurat_clusters))

p <- Seurat::DimPlot(sample, 
                     shuffle = T, 
                     pt.size = 0.5, 
                     cols = color_scale) + 
     Seurat::NoAxes() +
     ggplot2::ggtitle("My awesome SC dataset") +
     ggplot2::theme(plot.title = ggplot2::element_text(size = 16, 
                                                       face = "bold", 
                                                       hjust = 0.5),
                    legend.text = ggplot2::element_text(size = 12, 
                                                        face = "bold"),
                    legend.title = ggplot2::element_text(size = 12, 
                                                         face = "bold"))
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-9-1.png" alt="DimPlot with custom color scale." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-9)DimPlot with custom color scale.</p>
</div>

As of now, this plot looks much better and polished than the default counterpart. This, is the setting ground for `SCpubr::do_DimPlot()`. 

## Basic usage

This is the default output from `SCpubr::do_DimPlot()`. 


```r
p <- SCpubr::do_DimPlot(sample = sample)
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-10-1.png" alt="SCpubr DimPlot." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-10)SCpubr DimPlot.</p>
</div>

Even though axes are removed from UMAP reductions, the title for the axes is kept for any other reduction used. The same is applied for UMAP if the default dimension order is altered.


```r
p1 <- SCpubr::do_DimPlot(sample = sample, 
                         plot.title = "My awesome SC data set",
                         reduction = "pca")
p2 <- SCpubr::do_DimPlot(sample = sample, 
                         plot.title = "My awesome SC data set",
                         dims = c(2, 1))
p1 | p2
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-11-1.png" alt="SCpubr DimPlot with PCA embedding showing axes titles and UMAP changing default dimension component order." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-11)SCpubr DimPlot with PCA embedding showing axes titles and UMAP changing default dimension component order.</p>
</div>


We can add a title with the `plot.title` parameter.


```r
p <- SCpubr::do_DimPlot(sample = sample, 
                        plot.title = "My awesome SC data set")
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-12-1.png" alt="SCpubr DimPlot with title." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-12)SCpubr DimPlot with title.</p>
</div>

We can change the legend location and number of columns with `legend.position` and `legend.ncol`.


```r
p <- SCpubr::do_DimPlot(sample = sample, 
                        plot.title = "My awesome SC data set", 
                        legend.position = "left", 
                        legend.ncol = 2)
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-13-1.png" alt="SCpubr DimPlot with legend to the left." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-13)SCpubr DimPlot with legend to the left.</p>
</div>

## Using labels instead of a legend

In some cases, especially early on in the analysis where we do only have numbers as cluster names, we might want to remove the legend entirely, and instead plot labels on top of each cluster. This is achieved by using `label = TRUE`. This is how it looks in Seurat:


```r
p <- Seurat::DimPlot(sample, 
                     label = T)
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-14-1.png" alt="Seurat DimPlot with labels on top of the clusters." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-14)Seurat DimPlot with labels on top of the clusters.</p>
</div>

However, we can play further with other parameters of the function such as `label.color` and `label.box`. This is integrated by default in `SCpubr::do_DimPlot`. This is how it looks:


```r
p <- SCpubr::do_DimPlot(sample = sample, 
                        label = TRUE, 
                        legend = FALSE)
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-15-1.png" alt="Seurat DimPlot with labels on top of the clusters." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-15)Seurat DimPlot with labels on top of the clusters.</p>
</div>
The labels present now bold text for further readability. 

## Changing the order of plotting

By default, cells in `SCpubr::do_DimPlot()` are randomly plotted by using `shuffle = TRUE`. This is done as the default behavior of `Seurat::DimPlot()` is to plot the cells based on the factor levels of the identities. Sometimes, this way of plotting results in some clusters not being visible as another one is on top of it. However, this behavior might be intended, and even more, we would like a **specific** identity to stand out from the rest. This can be achieved by providing to `order` parameter either a vector with all the identities ordered however you want, or just some of the identities, which will then be plotted on top of the rest. However, it is still not clear whether using `order` alongside `shuffle` have unexpected side effects. For this, please use it alongside `shuffle = FALSE`. For the following example, we are going to test:

- We are going to bring cluster 5 to the front.
- `order` with one value or all values.
- `order` with `shuffle = TRUE/FALSE`.
- We will increase the dot size to better see cells in cluster 7, as this data set has a lack of overlapping clusters..


```r
# Regular SCpubr DimPlot.
p1 <- SCpubr::do_DimPlot(sample = sample,
                         reduction = "pca",
                         plot.title = "Normal DimPlot")
# Using order with one value and shuffle = TRUE.
p2 <- SCpubr::do_DimPlot(sample = sample,
                         shuffle = TRUE,
                         order = "5",
                         reduction = "pca",
                         plot.title = "shuffle = TRUE")
# Using order with one value and shuffle = FALSE.
p3 <- SCpubr::do_DimPlot(sample = sample,
                         shuffle = FALSE,
                         order = "5",
                         reduction = "pca",
                         plot.title = "shuffle = FALSE")

# Using order with all values.
p4 <- SCpubr::do_DimPlot(sample = sample,
                         shuffle = FALSE,
                         order = c("5", "8", "4",
                                   "9", "3", "1",
                                   "6", "0", "7", "2"),
                         reduction = "pca",
                         plot.title = "shuffle = FALSE all identities")
p <- (p1 | p2) / (p3 | p4)
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-16-1.png" alt="SCpubr, modifying order of plotted identities in a DimPlot" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-16)SCpubr, modifying order of plotted identities in a DimPlot</p>
</div>
We can see that cluster 5 allways plots on top of cluster 0 when `order` is set. While still not clear how `order` and `shuffle` interact, it is clear that using `order` cancels the original behavior of `shuffle`. Therefore, if both `order` and `shuffle` are set, `SCpubr::do_DimPlot()` will throw a warning.

## Modifying default colors
If wanted, we can also change the colors of the identities in the DimPlot based on a custom color scheme. For this, a **named vector** containing the names of the identities as names and the HEX codes as values has to be provided to `colors.use`: 


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

p <- SCpubr::do_DimPlot(sample = sample, 
                        colors.use = colors)
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-17-1.png" alt="SCpubr, modifying default colors in a DimPlot" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-17)SCpubr, modifying default colors in a DimPlot</p>
</div>


## Highlighting cells

One of the nice features of `Seurat::DimPlot()` is the possibility of highlighting a certain group of cells in the DimPlot. This is achieved by using the `cells.highligh` parameter. This is how the default plot looks like.


```r
# Select 1000 random cells out of clusters 1, 5 and 7.
cells.use <- sample(colnames(sample[, sample$seurat_clusters %in% c("1", "5", "7")]), 1000)
p <- Seurat::DimPlot(sample, 
                     cells.highlight = cells.use)
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-18-1.png" alt="Seurat DimPlot highlighting cells." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-18)Seurat DimPlot highlighting cells.</p>
</div>

To achieve a similar effect in `SCpubr::do_DimPlot()`, we can use the same parameter `cells.highlight`. Also, we can change the color of the highligted cells by providing single color to `colors.use` and the color of the not selected cells with `na.value`:


```r
# Select 1000 random cells out of clusters 1, 5 and 7.
cells.use <- sample(colnames(sample[, sample$seurat_clusters %in% c("1", "5", "7")]), 1000)
p1 <- SCpubr::do_DimPlot(sample = sample, 
                         cells.highlight = cells.use)
p2 <- SCpubr::do_DimPlot(sample = sample, 
                         cells.highlight = cells.use,
                         colors.use = "steelblue",
                         na.value = "grey50")
p1 | p2
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-19-1.png" alt="SCpubr DimPlot highlighting cells." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-19)SCpubr DimPlot highlighting cells.</p>
</div>

By default, the size of all cells in `SCpubr::do_DimPlot()` is the same. However, the size of the highlighted dots can be modified with the parameter `sizes.highlight` from Seurat.


```r
p <- SCpubr::do_DimPlot(sample = sample, 
                        cells.highlight = cells.use, 
                        sizes.highlight = 1)
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-20-1.png" alt="SCpubr DimPlot highlighting cells bigger dot size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-20)SCpubr DimPlot highlighting cells bigger dot size.</p>
</div>
If interested, we can also highlight whole identities with `idents.highlight` parameter. For this, just provide the desired identities to be selected. It can also work in combination with `cells.highlight`.


```r
p1 <- SCpubr::do_DimPlot(sample = sample, 
                         cells.highlight = cells.use)
p2 <- SCpubr::do_DimPlot(sample = sample, 
                         idents.highlight = c("6"))
p3 <- SCpubr::do_DimPlot(sample = sample, 
                         cells.highlight = cells.use, 
                         idents.highlight = c("6"))
p <- p1 | p2 | p3
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-21-1.png" alt="SCpubr DimPlot highlighting cells bigger dot size." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-21)SCpubr DimPlot highlighting cells bigger dot size.</p>
</div>

## Restrict the identitites shown and grey out the rest
Sometimes, we are interesting in showing only some of the identities or groups in our sample, but instead of the previous approach, we still want to keep the original colors and legend. For this, we might be inclined to just subset this sample, as follows:

```r
# We are interested in clusters 0 and 5.
p <- SCpubr::do_DimPlot(sample = sample[, sample$seurat_clusters %in% c("0", "5")])
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-22-1.png" alt="Seurat DimPlot selecting only some identities by subsetting the sample." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-22)Seurat DimPlot selecting only some identities by subsetting the sample.</p>
</div>

However, we end up losing the UMAP silhouette. For this, `SCpubr::do_DimPlot()` introduces `idents.keep` parameter, for which you can provide a vector with the identities you want to keep. This will treat the rest of the cells as `NA` and they will be colored according to `na.value` parameter:


```r
# We are interested in clusters 0 and 5.
p1 <- SCpubr::do_DimPlot(sample = sample,
                         idents.keep = c("0", "5"))
p2 <- SCpubr::do_DimPlot(sample = sample,
                         idents.keep = c("0", "5"),
                         na.value = "grey50")
p <- p1 | p2
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-23-1.png" alt="Seurat DimPlot selecting only some identities by using idents.keep." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-23)Seurat DimPlot selecting only some identities by using idents.keep.</p>
</div>

## Splitting by a category

Another useful parameter of `Seurat::DimPlot` is `split.by`, which allows you to split your DimPlot into multiple panels, each one containing a different unique value of the metadata variable you have provided to the argument. One can understand this as using the `group.by` parameter and then splitting the resulting DimPlot into different panels. In this example, we are going to use the different clusters as an example This is how it looks by default:


```r
# Using ncol = 5 to maintain some of the proportions. 
p <- Seurat::DimPlot(sample, 
                     split.by = "seurat_clusters", 
                     ncol = 5)
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-24-1.png" alt="Seurat DimPlot using split.by." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-24)Seurat DimPlot using split.by.</p>
</div>
As can be observed, this plots accomplish the task of separating the cells into each panel, but the approach followed actually makes interpretation difficult. Clusters such as Cluster 9, with fewer cells, tell pretty much nothing. Not knowing how the original UMAP looked like is a major downside of this approach. This is where `SCpubr` focus. Instead of using `Seurat`'s `split.by` parameter, it generates as many plots as unique values in the metadata to split the plot by, but uses `cells.highlight` instead, which keeps the rest of cells greyed out. This is how it looks:


```r
# Using ncol = 5 to maintain some of the proportions.
# Using legend = F to remove unwanted repeated legends.
p <- SCpubr::do_DimPlot(sample, 
                        split.by = "seurat_clusters", 
                        ncol = 5, 
                        legend = F,
                        font.size = 24)
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-25-1.png" alt="SCpubr DimPlot using split.by." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-25)SCpubr DimPlot using split.by.</p>
</div>

This way, we can see that clusters such as Cluster 7 are way more disperse than the rest, accounting not only for standalone groups of cells but also blending in other bigger clusters. 

If we are interested only in a subset of the possible values, we can use `idents.keep` alongside a vector containing the values to keep from the unique values in `split.by`:


```r
# Using ncol = 5 to maintain some of the proportions.
# Using legend = F to remove unwanted repeated legends.
p <- SCpubr::do_DimPlot(sample, 
                        split.by = "seurat_clusters", 
                        ncol = 3, 
                        idents.keep = c("0", "1", "7"),
                        legend = F,
                        font.size = 24)
p
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-26-1.png" alt="SCpubr DimPlot using split.by and idents.keep." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-26)SCpubr DimPlot using split.by and idents.keep.</p>
</div>


Actually, the user might want to change the color of the highlighted cells in this split DimPlot. This is achieved by using `colors.use` parameter and providing either a vector of **valid color representations** of equal length to unique values in `split.by` or just a single color to color all panels the same.



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

p1 <- SCpubr::do_DimPlot(sample, 
                         split.by = "seurat_clusters", 
                         ncol = 5, 
                         legend = F, 
                         colors.use = colors,
                         font.size = 24)

p2 <- SCpubr::do_DimPlot(sample, 
                         split.by = "seurat_clusters", 
                         ncol = 5, 
                         legend = F, 
                         colors.use = "#008080",
                         font.size = 24)
p1 / p2
```

<div class="figure" style="text-align: center">
<img src="03-DimPlots_files/figure-html/unnamed-chunk-27-1.png" alt="SCpubr DimPlot using split.by with a changed color" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-27)SCpubr DimPlot using split.by with a changed color</p>
</div>



