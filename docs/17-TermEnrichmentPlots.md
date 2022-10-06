# Term Enrichment Plots

One key downstream analysis in Single Cell analysis revolves having a list of candidate genes (i.e: DE genes) and one wants to know whether these genes are enriched for a specific biological function, pathway or cell type. This can be easily done using the [enrichR package](https://github.com/wjawaid/enrichR), which is an R interface to their website, [Enrichr](https://maayanlab.cloud/Enrichr/). This package allows to query a list of genes to more than 100 databases and retrieve the terms that are enriched for the list of genes, together with an adjusted p-value. This process, together with data processing and visualization is comprised in `SCpubr::do_TermEnrichmentPlot()`. 

First of all, `enrichR` allows you to select the site to query the results for. This can be provided with the `site` parameter and can be one of the following: 
- Enrichr.
- FlyEnrichr.
- WormEnrichr.
- YeastEnrichr.
- FishEnrichr.

Then, we also need to specify the databases to query against. The complete list of databases can be consulted using: 


```r
dbs <- sort(enrichR::listEnrichrDbs()[, 'libraryName'])
```

The databases to use need to be provided as a character vector to `dbs_use` parameter. However, one can also provide one of the following pre-defined options:

- "A": Will perform a query to 4 databases for cell types (Azimuth, Descartes, PanglaoDB and Descartes) and 4 databases for functional terms (MsigDB, GO-BP, GO-MF and KEGG). This is the default option if this parameter is not provided.
- "B": Performs a query for the cell type databases (Azimuth, Descartes, PanglaoDB and Descartes).
- "C": Performs a query for the functional terms (MsigDB, GO-BP, GO-MF and KEGG).

Any of the previous option will return a list of plots. The plots can, then, be assembled together.


```r
# Genes related to breast cancer.
genes <- c("ABCB1", "ABCG2", "AHR", "AKT1", "AR")
p <- SCpubr::do_TermEnrichmentPlot(genes = genes,
                                   dbs_use = "C")
patchwork::wrap_plots(p, ncol = 1)
```

<div class="figure" style="text-align: center">
<img src="17-TermEnrichmentPlots_files/figure-html/unnamed-chunk-2-1.png" alt="SCpubr do_TermEnrichmentPlot use case." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-2)SCpubr do_TermEnrichmentPlot use case.</p>
</div>

## Modifying the number of terms to retrieve.

Depending on the focus of the analysis, we might want to only focus on one database but retrieve more terms from it. This can be achieved by using `nterms` parameter. 


```r
# Genes related to breast cancer.
genes <- c("ABCB1", "ABCG2", "AHR", "AKT1", "AR")
p <- SCpubr::do_TermEnrichmentPlot(genes = genes,
                                   dbs_use = "GO_Biological_Process_2021",
                                   nterms = 15)
p
```

<div class="figure" style="text-align: center">
<img src="17-TermEnrichmentPlots_files/figure-html/unnamed-chunk-3-1.png" alt="SCpubr do_TermEnrichmentPlot with increased terms." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-3)SCpubr do_TermEnrichmentPlot with increased terms.</p>
</div>


## Modifying the length of the terms

Another issue with these plots is that, normally, the term itself takes too much space. For this, terms are wrapped according to a cutoff defined in `nchar_wrap` parameter. If the term has more characters than the value provided, it will be split more or less in half, always preserving whole words. 


```r
# Genes related to breast cancer.
genes <- c("ABCB1", "ABCG2", "AHR", "AKT1", "AR")
p1 <- SCpubr::do_TermEnrichmentPlot(genes = genes,
                                    dbs_use = "GO_Biological_Process_2021",
                                    nterms = 15)
p2 <- SCpubr::do_TermEnrichmentPlot(genes = genes,
                                    dbs_use = "GO_Biological_Process_2021",
                                    nterms = 15,
                                    nchar_wrap = 30)
p <- p1 / p2
p
```

<div class="figure" style="text-align: center">
<img src="17-TermEnrichmentPlots_files/figure-html/unnamed-chunk-4-1.png" alt="SCpubr do_TermEnrichmentPlot with reduced term length." width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-4)SCpubr do_TermEnrichmentPlot with reduced term length.</p>
</div>
In the same way, one can further enhance the limit in order to have each term in just one row.

## Increase the font size of the labels

If you want to increase the font size of the labels - this is, anything that is not part of the legend or the titles, use `text_labels_size` parameter:


```r
# Genes related to breast cancer.
genes <- c("ABCB1", "ABCG2", "AHR", "AKT1", "AR")
p1 <- SCpubr::do_TermEnrichmentPlot(genes = genes,
                                   dbs_use = "GO_Biological_Process_2021")
p2 <- SCpubr::do_TermEnrichmentPlot(genes = genes,
                                   text_labels_size = 6,
                                   dbs_use = "GO_Biological_Process_2021")

p <- p1 / p2
p
```

<div class="figure" style="text-align: center">
<img src="17-TermEnrichmentPlots_files/figure-html/unnamed-chunk-5-1.png" alt="SCpubr do_TermEnrichmentPlot with modified fontsize" width="100%" height="100%" />
<p class="caption">(\#fig:unnamed-chunk-5)SCpubr do_TermEnrichmentPlot with modified fontsize</p>
</div>
