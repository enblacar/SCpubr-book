# Save the figures {-}



Creating good plots is just half of the process. It is equally important to *properly save them*. This is the purpose of `SCpubr::savePlot`. This function is a very handy tool to save your plots easily in different formats, such as `.pdf`, `.png`, `.jpeg`, `.tiff` and `.svg`. This can be achieved by providing the following to `output_format` parameter:

- `"all"`: This will store the provided plot in all 5 formats.
- `"publication"`: This will store the plot in `.pdf`, `.png` and `.svg`. 
- *Individual format*: Provide the desired format and it will only be saved on that one.

*Width* and *Height* are set by default to 8 inches each, so the plot is squared. However, it is really important that these parameters are modified to the user's need. The name of the file can be provided with `file_name` parameter and the path to store the files can be specified in `figure_path`. If not provided, `figure_path` will default to the current working environment and `file_name` will default to a combination of the current date and time. Here are some examples.


```r
# Generate a plot.
p <- SCpubr::do_DimPlot(sample = sample)

# Default parameters.
SCpubr::savePlot(plot = p)

# Specifying the name and folder.
SCpubr::savePlot(plot = p,
                 figure_path = "/path/to/my/figures/",
                 file_name = "my_figure")

# Specify to also create a new folder.
SCpubr::savePlot(plot = p,
                 figure_path = "/path/to/my/figures/",
                 file_name = "my_figure",
                 create_path = TRUE)

# Set dimensions for the figure.
SCpubr::savePlot(plot = p,
                 figure_path = "/path/to/my/figures/",
                 file_name = "my_figure",
                 create_path = TRUE,
                 width = 8,
                 height = 8)

# Set quality (dpi).
SCpubr::savePlot(plot = p,
                 figure_path = "/path/to/my/figures/",
                 file_name = "my_figure",
                 create_path = TRUE,
                 width = 8,
                 height = 8,
                 dpi = 300)
```
