# Rasterized figures {-}



Many times we want to generate figures in PDF format so that we can later on modify some other aspects in image editors. The problem comes when we work with datasets of, let's say, 50.000 cells and then we save the plot as PDF, where each cell now becomes an item that needs to be tracked in the PDF file. For this, both `SCpubr::do_DimPlot()` and `SCpubr::do_FeaturePlot()` present the parameter `raster`, than if set to `TRUE` turns the image into a rasterized image. 

With this, there are two major concepts to take into account when generating rasterized images: `pt.size` and `raster.dpi`.

## Effect of point size in the plots {-}
Depending on the point size provided, if this value is lower than 1, by default the cells become plus signs.


```r
p.0.5 <- SCpubr::do_DimPlot(sample = sample, 
                            raster = TRUE,
                            pt.size = 0.5,
                            plot.title = "pt.size = 0.5",
                            raster.dpi = 512) |
         SCpubr::do_FeaturePlot(sample = sample,
                                raster = TRUE,
                                features = "CD14",
                                pt.size = 0.5,
                            raster.dpi = 512)

p.1.0 <- SCpubr::do_DimPlot(sample = sample, 
                            raster = TRUE,
                            pt.size = 1,
                            plot.title = "pt.size = 1.0",
                            raster.dpi = 512) |
         SCpubr::do_FeaturePlot(sample = sample,
                                raster = TRUE,
                                features = "CD14",
                                pt.size = 1,
                            raster.dpi = 512)

p.2.0 <- SCpubr::do_DimPlot(sample = sample, 
                            raster = TRUE,
                            pt.size = 2,
                            plot.title = "pt.size = 2.0",
                            raster.dpi = 512) |
         SCpubr::do_FeaturePlot(sample = sample,
                                raster = TRUE,
                                features = "CD14",
                                pt.size = 2,
                            raster.dpi = 512)
p <- p.0.5 / p.1.0 / p.2.0
p
```

<div class="figure" style="text-align: center">
<img src="96-RasterizeFigures_files/figure-html/unnamed-chunk-2-1.png" alt="Effect of point size in rasterized images." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-2)Effect of point size in rasterized images.</p>
</div>


## Effect of raster dpi in the plots {-}

Depending on the value provided to `raster.dpi`, the overall resolution of the plot will vary. Let's focus on setting `pt.size = 2` and vary `raster.dpi`:


```r
p.0.5 <- SCpubr::do_DimPlot(sample = sample, 
                            raster = TRUE,
                            pt.size = 2,
                            plot.title = "raster.dpi = 512",
                            raster.dpi = 512) |
         SCpubr::do_FeaturePlot(sample = sample,
                                raster = TRUE,
                                features = "CD14",
                                pt.size = 2,
                            raster.dpi = 512)

p.1.0 <- SCpubr::do_DimPlot(sample = sample, 
                            raster = TRUE,
                            pt.size = 2,
                            plot.title = "raster.dpi = 1024",
                            raster.dpi = 1024) |
         SCpubr::do_FeaturePlot(sample = sample,
                                raster = TRUE,
                                features = "CD14",
                                pt.size = 2,
                            raster.dpi = 1024)

p.2.0 <- SCpubr::do_DimPlot(sample = sample, 
                            raster = TRUE,
                            pt.size = 2,
                            plot.title = "raster.dpi = 2048",
                            raster.dpi = 2048) |
         SCpubr::do_FeaturePlot(sample = sample,
                                raster = TRUE,
                                features = "CD14",
                                pt.size = 2,
                            raster.dpi = 2048)
p <- p.0.5 / p.1.0 / p.2.0
p
```

<div class="figure" style="text-align: center">
<img src="96-RasterizeFigures_files/figure-html/unnamed-chunk-3-1.png" alt="Effect of raster dpi in rasterized images." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-3)Effect of raster dpi in rasterized images.</p>
</div>

Therefore, the optimal combination will depend on your dataset size and how you want it to look like.
