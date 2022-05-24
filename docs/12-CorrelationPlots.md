# Correlation matrix heatmaps

A common analysis to perform with your single cell data is to assess how much different subsets of your data are correlated between them. For this, correlation matrices are used, typically displayed as heatmaps. This is implemented in `SCpubr::do_CorrelationPlot()`. Right now, it only works for a single use case: computing the correlation matrix of the highly variable genes between the desired groups. Further use cases will be implemented in the future.



## Using Highly Variable Genes

<div class="figure" style="text-align: center">
<img src="12-CorrelationPlots_files/figure-html/unnamed-chunk-2-1.png" alt="SCpubr::do_CorrelationPlot with default parameters." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-2)SCpubr::do_CorrelationPlot with default parameters.</p>
</div>
By default, it computes the correlation over the current identities in the object. This can be changed by providing another metadata variable to `group.by`. 

<div class="figure" style="text-align: center">
<img src="12-CorrelationPlots_files/figure-html/unnamed-chunk-3-1.png" alt="SCpubr::do_CorrelationPlot with custom grouping." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-3)SCpubr::do_CorrelationPlot with custom grouping.</p>
</div>

Axes labels can also be rotated.

<div class="figure" style="text-align: center">
<img src="12-CorrelationPlots_files/figure-html/unnamed-chunk-4-1.png" alt="SCpubr::do_CorrelationPlot with rotated axis labels." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-4)SCpubr::do_CorrelationPlot with rotated axis labels.</p>
</div>

## Changing the color scale

Color scale can be modified using `colors.use` parameter.

<div class="figure" style="text-align: center">
<img src="12-CorrelationPlots_files/figure-html/unnamed-chunk-5-1.png" alt="SCpubr::do_CorrelationPlot with rotated axis labels and modified color scale." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-5)SCpubr::do_CorrelationPlot with rotated axis labels and modified color scale.</p>
</div>
