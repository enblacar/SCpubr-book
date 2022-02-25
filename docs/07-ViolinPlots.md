# Violin plots

Violin plots require very little description. They are a depiction of the distribution of a variable. It makes it ideal in order to show differential enrichment patterns alongside different groups. As such, it is also included in `Seurat` under `Seurat::VlnPlot()` function. The very first time a new user encounters this function is likely going to be when querying for different QC paramters, such as the number of UMIs, the number of genes or the percentage of mitochondrial RNA. This is how it looks for the number of UMIs:





## Basic usage

```r
p <- Seurat::VlnPlot(sample, 
                     features = "nCount_RNA")
p
```
The one thing that really stands out here is, indeed, the extra dots that are being plotted alongside the violin plot. Since each dot represent a cell, it quickly becomes the dominant feature of the figure. One can play with the alpha of the dots to reduce their presence:


```r
p <- Seurat::VlnPlot(sample, 
                     features = "nCount_RNA")
# "Surgically" add the alpha parameter in the ggplot2 object.
p$layers[[2]]$aes_params$alpha <- 0.05
p
```

But still, by making the dots almost invisible, we still observe their dominance on the bigger clusters. Therefore, it's better to remove it. This, together with other modifications are the basis of `SCpubr::do_VlnPlot()`. This is how the default plot looks like:


```r
p <- SCpubr::do_VlnPlot(sample = sample, 
                        features = "nCount_RNA")
p
```

In addition to removing the dots, a boxplot is added to each violin shape, to get a better sense of the quantiles of the distribution. This effect can be removed by using `plot_boxplot = FALSE`. Also, legend is by default removed, as the groups are being displayed already in the X axis. 


```r
p <- SCpubr::do_VlnPlot(sample = sample, 
                        features = "nCount_RNA",
                        plot_boxplot = FALSE)
p
```

If we want to rotate the X axis labels, we can also do that providing `rotate_x_labels = TRUE/FALSE`:

```r
p <- SCpubr::do_VlnPlot(sample = sample, 
                        features = c("nCount_RNA"),
                        rotate_x_labels = TRUE,)
p
```

We can also do that for specific violin plots when more than one feature is queried. For this, `rotate_x_labels` has to be a vector of logical values (TRUE or FALSE) of length equal to the number of features.


```r
p <- SCpubr::do_VlnPlot(sample = sample, 
                        features = c("nCount_RNA", "nFeature_RNA"),
                        rotate_x_labels = c(FALSE, TRUE),
                        ncol = 1)
p
```
However, please note that if the names of the current identities are long enough, this will result in them overlapping one another.


## Violin plots as a means of QC

For QC analyses, users might want to also add some other features such as a line indicating where to put the cutoff. This can be achieved by using `y_cut` parameter. Currently, only one value per plot for `y_cut` can be used.


```r
p <- SCpubr::do_VlnPlot(sample = sample, 
                        features = "nCount_RNA", 
                        y_cut = 30000)
p
```
When multiple features are queried, the user can set up different horizontal lines parsing them as a vector to `y_cut`. Also, the same can be achieved for the individual plot titles by using the `individual.titles` parameter. The only restriction, is that the vector has to be of the same length as the number of features. If for a particular plot, we do not want to modify anything, use `NA` instead.


```r
p <- SCpubr::do_VlnPlot(sample = sample, 
                        features = c("nCount_RNA", "nFeature_RNA"), 
                        y_cut = c(NA, 5000), 
                        individual.titles = c("UMIs", NA),
                        ncol = 1)
p
```

## Modifying default colors

Same as with other categorical representations, we can modify the default color palette by providing a custom one to `colors.use`. This has to be a named vector of HEX values with the names of the groups as names of the values:


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

p <- SCpubr::do_VlnPlot(sample = sample, 
                        features = "nCount_RNA",
                        colors.use = colors)
p
```
