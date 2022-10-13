# Feature plots 
Another flagship function in `Seurat` is `Seurat::FeaturePlot()`. It is basically the counterpart of `Seurat::DimPlot()` which, instead of coloring the cells based on a categorical color scale, it uses a continuous scale instead, according to a variable provided by the user. This can range from gene expression, to metadata variables such as the number of genes, or even values such as a principal component. 





## Basic usage

This is SCpubr's take on `Seurat::FeaturePlot()`:

```r
# Seurat's Feature Plot.
p1 <- Seurat::FeaturePlot(sample, 
                          features = "PC_1")

# SCpubr's Feature Plot.
p2 <- SCpubr::do_FeaturePlot(sample = sample,
                             features = "PC_1")

p <- p1 | p2
p
```

<div class="figure" style="text-align: center">
<img src="04-FeaturePlots_files/figure-html/unnamed-chunk-2-1.png" alt="SCpubr do_FeaturePlot vs Seurat FeaturePlot" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-2)SCpubr do_FeaturePlot vs Seurat FeaturePlot</p>
</div>

By default, `SCpubr::do_FeaturePlot()` enlarges the dots a bit and modifies the legend, to better stand out. Even though axes are removed from UMAP reductions, the title for the axes is kept for any other reduction used. The same is applied for UMAP if the default dimension order is altered.


```r
# Use case with PCA embedding.
p1 <- SCpubr::do_FeaturePlot(sample = sample, 
                             features = "CD14",
                             plot.title = "Plotting PCA coordinates",
                             reduction = "pca")

# Use case with non-canonical dimensions.                             
p2 <- SCpubr::do_FeaturePlot(sample = sample, 
                             features = "CD14",
                             plot.title = "Plotting UMAP coordinates in a different order",
                             dims = c(2, 1))

p <- p1 | p2
p
```

<div class="figure" style="text-align: center">
<img src="04-FeaturePlots_files/figure-html/unnamed-chunk-3-1.png" alt="SCpubr Feature showing axes titles." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-3)SCpubr Feature showing axes titles.</p>
</div>

## Multiple features

`SCpubr::do_FeaturePlot()` can tackle multiple queries at the same time. Plots can be rearranged as desired with `ncol` parameter:


```r
# Query multiple features at the same time.
p <- SCpubr::do_FeaturePlot(sample, features = c("nCount_RNA", 
                                                 "nFeature_RNA", 
                                                 "percent.mt", 
                                                 "CD14"), 
                            plot.title = "A collection of features", 
                            ncol = 2)

p
```

<div class="figure" style="text-align: center">
<img src="04-FeaturePlots_files/figure-html/unnamed-chunk-4-1.png" alt="SCpubr FeaturePlot, with 4 features and 2 columns" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-4)SCpubr FeaturePlot, with 4 features and 2 columns</p>
</div>

## Working with subsets of cells

One of the things that can be misleading is that it could be the case that a **very specific subset of cells are driving the ends of the color scales**. Let's say that we have identified that clusters 2, 5, and 8 are responsible for this behavior. We would like to plot the values without taking those cells into consideration. The very first thing that comes to mind is, indeed, removing the cells completely, resulting in the following:


```r
# Subset the cells in the Seurat object to remove unwanted cells.
cells.plot <- colnames(sample[, !(sample$seurat_clusters %in% c("2", "5", "8"))])

p <- SCpubr::do_FeaturePlot(sample[, cells.plot], 
                            features = c("CD14"))

p
```

<div class="figure" style="text-align: center">
<img src="04-FeaturePlots_files/figure-html/unnamed-chunk-5-1.png" alt="SCpubr FeaturePlot, removing cells from clusters 2, 5 and 8" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-5)SCpubr FeaturePlot, removing cells from clusters 2, 5 and 8</p>
</div>

However, this falls back to the same problem as with `Seurat::DimPlot` with the `split.by` parameter. We lose the overall context of where the cells are, as we lost the original **UMAP silhouette**. This can be fixed by using the `cells.highlight` parameter:


```r
# Using cells.highlight parameter to select the cells we want to include in the plot.
p <- SCpubr::do_FeaturePlot(sample = sample, 
                            cells.highlight = cells.plot, 
                            features = c("CD14"))

p
```

<div class="figure" style="text-align: center">
<img src="04-FeaturePlots_files/figure-html/unnamed-chunk-6-1.png" alt="SCpubr FeaturePlot, masking cells from clusters 2, 5 and 8" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-6)SCpubr FeaturePlot, masking cells from clusters 2, 5 and 8</p>
</div>
This way, by adding the cells back and modifying the legend, we accomplish the desired effect. Furthermore, `SCpubr::do_FeaturePlot()` also accepts a vector of the identities to plot, as long as they are part of `levels(seurat_object)`. This can be achieved by using the `idents.highlight` instead.


```r
# Selecting given identitites to include in the plot.
p <- SCpubr::do_FeaturePlot(sample = sample, 
                            idents.highlight = levels(sample)[!(levels(sample) %in% c("0", "2", "5", "8"))], 
                            features = c("CD14"))

p
```

<div class="figure" style="text-align: center">
<img src="04-FeaturePlots_files/figure-html/unnamed-chunk-7-1.png" alt="SCpubr FeaturePlot, masking cells from clusters 2, 5 and 8 using idents.highlight" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-7)SCpubr FeaturePlot, masking cells from clusters 2, 5 and 8 using idents.highlight</p>
</div>
## Splitting the FeaturePlot by a variable

In some cases, we want to visualize a given feature, let's say, the expression of `LYN` across another variable, for instance `seurat_clusters`. This can be achieved easily in `Seurat` by using the `split.by` parameter. For the sake of representation, let's reduce the number of clusters.


```r
# Group clusters into three values for visualization purposes.
sample$new_clusters <- as.character(sample$seurat_clusters)
sample$new_clusters[sample$new_clusters %in% c("0", "1", "2", "3")] <- "Cluster 1"
sample$new_clusters[sample$new_clusters %in% c("4", "5", "6")] <- "Cluster 2"
sample$new_clusters[sample$new_clusters %in% c("7", "8", "9")] <- "Cluster 3"

# Seurat Feature Plot using split.by.
p <- Seurat::FeaturePlot(sample, 
                         features = "LYN", 
                         split.by = "new_clusters")
p
```

<div class="figure" style="text-align: center">
<img src="04-FeaturePlots_files/figure-html/unnamed-chunk-8-1.png" alt="Seurat FeaturePlot split by clusters." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-8)Seurat FeaturePlot split by clusters.</p>
</div>
Apart from the general aesthetic discrepancies mentioned before, there are two main aspects missing. First, is the loss of the **UMAP silhouette**. Secondly, knowing that, by default, the color scale is shared across all the plots, we would like to know the range of values this color scale is displaying. In this two aspects is where `SCpubr::do_FeaturePlot()` delves into: 


```r
# SCpubr Feature Plot using split.by
p <- SCpubr::do_FeaturePlot(sample = sample, 
                            features = "LYN", 
                            split.by = "new_clusters")

p
```

<div class="figure" style="text-align: center">
<img src="04-FeaturePlots_files/figure-html/unnamed-chunk-9-1.png" alt="SCpubr FeaturePlot split by clusters." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-9)SCpubr FeaturePlot split by clusters.</p>
</div>

This way, we are able to achieve a better understandable plot. Furthermore, we can query multiple features. In the following example, we provide each of the three possible examples of features:

- `LYN` is a gene located in the rownames of the count matrix (`rownames(sample)``).
- `nCount_RNA` is a metadata variable located in `colnames(sample@meta.data)`.
- `PC_1` is a column of a dimensional reduction embedding, located in `colnames(sample@reductions[["pca"]][[]])`


```r
# Use split.by with multiple features.
p <- SCpubr::do_FeaturePlot(sample, 
                            features = c("LYN", "nCount_RNA", "PC_1"), 
                            split.by = "new_clusters")
                            
p
```

<div class="figure" style="text-align: center">
<img src="04-FeaturePlots_files/figure-html/unnamed-chunk-10-1.png" alt="SCpubr FeaturePlot split by clusters using multiple features." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-10)SCpubr FeaturePlot split by clusters using multiple features.</p>
</div>

We can even subset the previous plot to any set ofidentities in `split.by` we are particularly interested in. The color scale also limits itself to contain only the values in the selected identities. This can be achieved by provided a vector with the identities to `split.by.idents` parameter.


```r
# Using split.by.idents parameter alongside split.by.
p <- SCpubr::do_FeaturePlot(sample, 
                            features = c("LYN", "nCount_RNA", "PC_1"), 
                            split.by = "seurat_clusters", 
                            split.by.idents = c("2", "5"))

p
```

<div class="figure" style="text-align: center">
<img src="04-FeaturePlots_files/figure-html/unnamed-chunk-11-1.png" alt="SCpubr FeaturePlot split by clusters using multiple features and selected identities." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-11)SCpubr FeaturePlot split by clusters using multiple features and selected identities.</p>
</div>

## Apply symmetrical color scales
There are times in which we want to color the Feature plot using a two-end continuous color scale. We can achieve this by using `enforce_symmetry = TRUE`:


```r
# Enforce two-end symmetrical color scale.
p1 <- SCpubr::do_FeaturePlot(sample, 
                             features = "PC_1",
                             enforce_symmetry = FALSE)

p2 <- SCpubr::do_FeaturePlot(sample, 
                             features = "PC_1",
                             enforce_symmetry = TRUE)

p <- p1 | p2
p
```

<div class="figure" style="text-align: center">
<img src="04-FeaturePlots_files/figure-html/unnamed-chunk-12-1.png" alt="SCpubr FeaturePlot using a two-end continuous scale." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-12)SCpubr FeaturePlot using a two-end continuous scale.</p>
</div>
As one can observe, this parameters sets a scale centered around 0, with the two ends being of the same value. This allows for direct comparison between the colors.
