# Sankey and alluvial plots



Sankey and alluvial plots are a set of visualizations that help depicting how the cells "flow" from a given group to another. This can be particular interesting, let's say, when we have a merged dataset that has samples from different subtypes and we want to see how the cells from each subtype distribute along the different clusters in our sample. Or, similarly, how the cells from each cluster distribute across the different individual datasets.

This is how we can achieve basic Sankey or alluvial plots:


```r
# Generate a more fine-grained clustering.
sample <- Seurat::FindSubCluster(sample, cluster = c("0", "5"), graph.name = "SCT_snn")
#> Modularity Optimizer version 1.3.0 by Ludo Waltman and Nees Jan van Eck
#> 
#> Number of nodes: 4428
#> Number of edges: 146366
#> 
#> Running Louvain algorithm...
#> Maximum modularity in 10 random starts: 0.7966
#> Number of communities: 6
#> Elapsed time: 0 seconds
sample$sub.cluster <- paste0("sub_", sample$sub.cluster)

# Compute basic sankey plot.
p1 <- SCpubr::do_SankeyPlot(sample = sample,
                            first_group = "sub.cluster",
                            last_group = "seurat_clusters",
                            type = "sankey")

# Compute basic alluvial plot.
p2 <- SCpubr::do_SankeyPlot(sample = sample,
                            first_group = "sub.cluster",
                            last_group = "seurat_clusters",
                            type = "alluvial")

p <- p1 / p2
p
```

<div class="figure" style="text-align: center">
<img src="07--SankeyPlots_files/figure-html/unnamed-chunk-2-1.png" alt="Basic Sankey and Alluvial plots." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-2)Basic Sankey and Alluvial plots.</p>
</div>
The key aspects of this figure is that one has to provide the starting and end groups to `first_group` and `last_group` parameters, and the type of plot to `type`, making it either alluvial or sankey. The major difference between both is simply that the alluvial plot has not space between the groups. This allows for a more compact visualization, although it can get quite messy depending on the colors. We can keep adding as many groups as we want in between by using `middle_groups` parameter.



```r
sample$assignment <- ifelse(sample$seurat_clusters %in% c("0", "2", "4"), "A", "B")

# Add more groups.
p1 <- SCpubr::do_SankeyPlot(sample = sample,
                            first_group = "sub.cluster",
                            middle_groups = c("seurat_clusters", "assignment"),
                            last_group = "orig.ident",
                            type = "sankey")

p2 <- SCpubr::do_SankeyPlot(sample = sample,
                            first_group = "sub.cluster",
                            middle_groups = c("seurat_clusters", "assignment"),
                            last_group = "orig.ident",
                            type = "alluvial")

p <- p1 / p2
p
```

<div class="figure" style="text-align: center">
<img src="07--SankeyPlots_files/figure-html/unnamed-chunk-3-1.png" alt="Basic Sankey and Alluvial plots with more groups." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-3)Basic Sankey and Alluvial plots with more groups.</p>
</div>

By default, the color of the nodes and the fill is white, so that they can not be seen. One Can modify this by using `node.fill` and `node.color`. 


```r
sample$assignment <- ifelse(sample$seurat_clusters %in% c("0", "2", "4"), "A", "B")

# Control the color and fill of the nodes.
p1 <- SCpubr::do_SankeyPlot(sample = sample,
                            first_group = "sub.cluster",
                            middle_groups = c("seurat_clusters", "assignment"),
                            last_group = "orig.ident",
                            type = "sankey",
                            node.fill = "grey95",
                            node.color = "black")

p2 <- SCpubr::do_SankeyPlot(sample = sample,
                            first_group = "sub.cluster",
                            middle_groups = c("seurat_clusters", "assignment"),
                            last_group = "orig.ident",
                            type = "alluvial",
                            node.fill = "grey95",
                            node.color = "black")

p <- p1 / p2
p
```

<div class="figure" style="text-align: center">
<img src="07--SankeyPlots_files/figure-html/unnamed-chunk-4-1.png" alt="Basic Sankey and Alluvial plots with modified colors for the nodes." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-4)Basic Sankey and Alluvial plots with modified colors for the nodes.</p>
</div>
As can be seen, the text labels, then, overlap the limits of the nodes. We can fix that using the `width` parameter:


```r
sample$assignment <- ifelse(sample$seurat_clusters %in% c("0", "2", "4"), "A", "B")

# Control the width of the nodes.
p1 <- SCpubr::do_SankeyPlot(sample = sample,
                            first_group = "sub.cluster",
                            middle_groups = c("seurat_clusters", "assignment"),
                            last_group = "orig.ident",
                            type = "sankey",
                            node.fill = "grey95",
                            node.color = "black")

p2 <- SCpubr::do_SankeyPlot(sample = sample,
                            first_group = "sub.cluster",
                            middle_groups = c("seurat_clusters", "assignment"),
                            last_group = "orig.ident",
                            type = "sankey",
                            node.fill = "grey95",
                            node.color = "black",
                            width = 0.5)

p <- p1 / p2
p
```

<div class="figure" style="text-align: center">
<img src="07--SankeyPlots_files/figure-html/unnamed-chunk-5-1.png" alt="Basic Sankey and Alluvial plots with modified width of the nodes." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-5)Basic Sankey and Alluvial plots with modified width of the nodes.</p>
</div>

We can also control the alignment of the labels (goes different by the different groups by default) using the `hjust` parameter. This will modify it for all the nodes.


```r
sample$assignment <- ifelse(sample$seurat_clusters %in% c("0", "2", "4"), "A", "B")

# Control the alignment of the labels.
p1 <- SCpubr::do_SankeyPlot(sample = sample,
                            first_group = "sub.cluster",
                            middle_groups = c("seurat_clusters", "assignment"),
                            last_group = "orig.ident",
                            type = "sankey",
                            node.fill = "grey95",
                            node.color = "black",
                            width = 0.5)

p2 <- SCpubr::do_SankeyPlot(sample = sample,
                            first_group = "sub.cluster",
                            middle_groups = c("seurat_clusters", "assignment"),
                            last_group = "orig.ident",
                            type = "sankey",
                            node.fill = "grey95",
                            node.color = "black",
                            width = 0.5,
                            hjust = 0.5)

p <- p1 / p2
p
```

<div class="figure" style="text-align: center">
<img src="07--SankeyPlots_files/figure-html/unnamed-chunk-6-1.png" alt="Basic Sankey and Alluvial plots with modified label alignment." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-6)Basic Sankey and Alluvial plots with modified label alignment.</p>
</div>

We can also turn the text into labels, which will then be colored based on the end nodes. We can toggle it by using `use_labels = TRUE`.


```r
sample$assignment <- ifelse(sample$seurat_clusters %in% c("0", "2", "4"), "A", "B")

# Use text or labels for the nodes.
p1 <- SCpubr::do_SankeyPlot(sample = sample,
                            first_group = "sub.cluster",
                            middle_groups = c("seurat_clusters", "assignment"),
                            last_group = "orig.ident",
                            type = "sankey")

p2 <- SCpubr::do_SankeyPlot(sample = sample,
                            first_group = "sub.cluster",
                            middle_groups = c("seurat_clusters", "assignment"),
                            last_group = "orig.ident",
                            type = "sankey",
                            use_labels = TRUE,
                            text_color = "white")

p <- p1 / p2
p
```

<div class="figure" style="text-align: center">
<img src="07--SankeyPlots_files/figure-html/unnamed-chunk-7-1.png" alt="Sankey plots with texts and labels." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-7)Sankey plots with texts and labels.</p>
</div>


One can also increase the gaps between the nodes. This is done by providing a number to `space`. This number would act as "invisible" cells in between the nodes. So one needs to think in terms of how many cells do we have in our dataset. The bigger the dataset, the higher the number we need to notice a difference. It is set by default to 5% of the total number of cells in the dataset.


```r
sample$assignment <- ifelse(sample$seurat_clusters %in% c("0", "2", "4"), "A", "B")

# Modify the space between nodes.
p1 <- SCpubr::do_SankeyPlot(sample = sample,
                            first_group = "sub.cluster",
                            middle_groups = c("seurat_clusters", "assignment"),
                            last_group = "orig.ident",
                            type = "sankey",
                            space =  1000)

p2 <- SCpubr::do_SankeyPlot(sample = sample,
                            first_group = "sub.cluster",
                            middle_groups = c("seurat_clusters", "assignment"),
                            last_group = "orig.ident",
                            type = "sankey",
                            space = 5000)

p <- p1 / p2
p
```

<div class="figure" style="text-align: center">
<img src="07--SankeyPlots_files/figure-html/unnamed-chunk-8-1.png" alt="Sankey plots with modified spaces between the nodes." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-8)Sankey plots with modified spaces between the nodes.</p>
</div>

Finally, we can modify the default colors by providing our own to `colors.first`, `colors.middle` and `colors.last`. It has to be a named vector with 


```r
sample$assignment <- ifelse(sample$seurat_clusters %in% c("0", "2", "4"), "A", "B")

# Modify the space between nodes.
p <- SCpubr::do_SankeyPlot(sample = sample,
                          first_group = "sub.cluster",
                          middle_groups = c("seurat_clusters", "assignment"),
                          last_group = "orig.ident",
                          type = "sankey",
                          colors.first = stats::setNames(SCpubr::do_ColorPalette(colors.use = "steelblue", 
                                                                                 n = length(unique(sample$sub.cluster))),
                                                         unique(sample$sub.cluster)))
p
```

<div class="figure" style="text-align: center">
<img src="07--SankeyPlots_files/figure-html/unnamed-chunk-9-1.png" alt="Sankey plots with modified spaces between the nodes." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-9)Sankey plots with modified spaces between the nodes.</p>
</div>


