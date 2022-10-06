# TF Activity inference analysis

**This section is highly similar to Pathway Activity inference analysis as it makes use of the same source package and visualizations.**

Transcriptional Factor (TF) Activity inference analysis can also be carried out in a SC dataset. Same as with the previous chapter, we will use [decoupleR](https://github.com/saezlab/decoupleR) ([P.Badia-i-Mompel *et al*. 2022](https://academic.oup.com/bioinformaticsadvances/article/2/1/vbac016/6544613?login=true)). For this, [dorothea](https://github.com/saezlab/dorothea/) is used. This allows for the computation of activity scores on a cell basis depicting how much (or little) each cell is enriched in a TF and its dowstream targets (regulon).

In order to visualize the enrichment of our cells in the pathways, the results need to be computed:




```r
# Define your sample and assay.
sample <- your_seurat_object
assay <- "your_normalized_data_assay"

# Retrieve prior knowledge network.
network <- decoupleR::get_dorothea(organism = "human",
                                   levels = c("A", "B", "C"))

# Run weighted means algorithm.
activities <- decoupleR::run_wmean(mat = as.matrix(sample@assays[[assay]]@data),
                                   network = network,
                                   .source = "source",
                                   .targe = "target",
                                   .mor = "mor",
                                   times = 100,
                                   minsize = 5)
```

With this, we can proceed to plot our results with `SCpubr::do_TFActivityPlot()`.

## Heatmap of averaged scores

The most informative and, perhaps, straightforward approach is to visualize the resulting scores averaged by the groups we have defined, as a heatmap. This is the default output of `SCpubr::do_TFActivityPlot()`.


```r
# General heatmap.
out <- SCpubr::do_TFActivityPlot(sample = sample,
                                 activities = activities)
p <- out$heatmaps$average_scores
p
```

<div class="figure" style="text-align: center">
<img src="24-TFActivityPlots_files/figure-html/unnamed-chunk-3-1.png" alt="SCpubr do_TFActivityPlot heatmap output." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-3)SCpubr do_TFActivityPlot heatmap output.</p>
</div>

## Select the number of top TFs to plot

We can select the number of TFs to include in the analysis by using `n_tfs` variable.


```r
# Increase number of TFs included in the analysis.
out <- SCpubr::do_TFActivityPlot(sample = sample,
                                 activities = activities,
                                 n_tfs = 40)
p <- out$heatmaps$average_scores
p
```

<div class="figure" style="text-align: center">
<img src="24-TFActivityPlots_files/figure-html/unnamed-chunk-4-1.png" alt="SCpubr do_TFActivityPlot heatmap output with increased TFs." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-4)SCpubr do_TFActivityPlot heatmap output with increased TFs.</p>
</div>

## Feature plots of the scores

Perhaps we are interested into visualizing the scores as a Feature plot. This way we can observe trends of enrichment in the activities. This can be achieved by providing `plot_FeaturePlots = TRUE`.


```r
# Retrieve feature plots.
out <- SCpubr::do_TFActivityPlot(sample = sample,
                                 activities = activities,
                                 plot_FeaturePlots = TRUE)
p1 <- SCpubr::do_DimPlot(sample)
p2 <- out$feature_plots$GLI2
p <- p1 | p2
p
```

<div class="figure" style="text-align: center">
<img src="24-TFActivityPlots_files/figure-html/unnamed-chunk-5-1.png" alt="SCpubr do_TFActivityPlot feature plot output." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-5)SCpubr do_TFActivityPlot feature plot output.</p>
</div>

## Geyser plots of the scores

In the same fashion as with the feature plots, we can also visualize the scores as Geyser plots, to get a sense of the distribution of the scores alongside the groups. This can be achieved by providing `plot_GeyserPlots = TRUE`.


```r
# Retrieve Geyser plots.
out <- SCpubr::do_TFActivityPlot(sample = sample,
                                 activities = activities,
                                 plot_GeyserPlots = TRUE)
p1 <- SCpubr::do_DimPlot(sample)
p2 <- out$geyser_plots$GLI2
p <- p1 | p2
p
```

<div class="figure" style="text-align: center">
<img src="24-TFActivityPlots_files/figure-html/unnamed-chunk-6-1.png" alt="SCpubr do_TFActivityPlot geyser plot output." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-6)SCpubr do_TFActivityPlot geyser plot output.</p>
</div>

## Use non-symmetrical color scales

If one wants to just plot a continuous color scale for the Feature plots and the Geyser plots, this can be achieved by using `enforce_symmetry = FALSE`.


```r
# Use non-symmetrical color scale.
out <- SCpubr::do_TFActivityPlot(sample = sample,
                                 activities = activities,
                                 plot_GeyserPlots = TRUE,
                                 plot_FeaturePlots = TRUE,
                                 enforce_symmetry = FALSE)
p1 <- out$feature_plots$GLI2
p2 <- out$geyser_plots$GLI2

out <- SCpubr::do_TFActivityPlot(sample = sample,
                                 activities = activities,
                                 plot_GeyserPlots = TRUE,
                                 plot_FeaturePlots = TRUE,
                                 enforce_symmetry = TRUE)
p3 <- out$feature_plots$GLI2
p4 <- out$geyser_plots$GLI2

p <- (p1 | p2) / (p3 | p4)
p
```

<div class="figure" style="text-align: center">
<img src="24-TFActivityPlots_files/figure-html/unnamed-chunk-7-1.png" alt="SCpubr do_TFActivityPlot non-symmetrical color scale." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-7)SCpubr do_TFActivityPlot non-symmetrical color scale.</p>
</div>

## Order geysers by the mean

We can also decide not to order the Geyser plots by the mean of the values. We can do that by providing `geyser_order_by_mean = FALSE`.


```r
# Not order Geyser plot by mean values.
out <- SCpubr::do_TFActivityPlot(sample = sample,
                                 activities = activities,
                                 plot_GeyserPlots = TRUE,
                                 enforce_symmetry = TRUE,
                                 geyser_order_by_mean = FALSE)
p1 <- out$geyser_plots$GLI2

out <- SCpubr::do_TFActivityPlot(sample = sample,
                                 activities = activities,
                                 plot_GeyserPlots = TRUE,
                                 enforce_symmetry = TRUE,
                                 geyser_order_by_mean = TRUE)
p2 <- out$geyser_plots$GLI2

p <- p1 | p2
p
```

<div class="figure" style="text-align: center">
<img src="24-TFActivityPlots_files/figure-html/unnamed-chunk-8-1.png" alt="SCpubr do_TFActivityPlot not ordering by mean values." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-8)SCpubr do_TFActivityPlot not ordering by mean values.</p>
</div>

## Plot another variable in the geyser plots

Furthermore, we can also recolor the Geyser plots based on another variable of our choice. We can achieve this by using `geyser_color.by` and `geyser_scale_type`, providing the name of the variable to plot and the type it is (continuous, categorical).


```r
# Plot a third variable in Geyser plots.
out <- SCpubr::do_TFActivityPlot(sample = sample,
                                 activities = activities,
                                 plot_GeyserPlots = TRUE,
                                 geyser_color.by = "seurat_clusters",
                                 geyser_scale_type = "categorical")
p1 <- out$geyser_plots$GLI2

out <- SCpubr::do_TFActivityPlot(sample = sample,
                                 activities = activities,
                                 plot_GeyserPlots = TRUE,
                                 geyser_color.by = "nCount_RNA",
                                 geyser_scale_type = "continuous")
p2 <- out$geyser_plots$GLI2

p <- p1 | p2
p
```

<div class="figure" style="text-align: center">
<img src="24-TFActivityPlots_files/figure-html/unnamed-chunk-9-1.png" alt="SCpubr do_TFActivityPlot using color.by." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-9)SCpubr do_TFActivityPlot using color.by.</p>
</div>

## Split the heatmap into different groups

We can also further divide the heatmap into groups. This can be achieved using `split.by` parameter.


```r
# Split the heatmap by another variable.
sample$split.me <- ifelse(sample$seurat_clusters %in% c("0", "3", "7"), "Group A","Group B")

out <- SCpubr::do_TFActivityPlot(sample = sample,
                                 activities = activities,
                                 split.by = "split.me")
p <- out$heatmaps$average_scores
p
```

<div class="figure" style="text-align: center">
<img src="24-TFActivityPlots_files/figure-html/unnamed-chunk-10-1.png" alt="SCpubr do_TFActivityPlot splitting the heatmap." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-10)SCpubr do_TFActivityPlot splitting the heatmap.</p>
</div>
