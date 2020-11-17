## Using R as a Research Tool

This repository contains Tutorials for the NERC E4 DTP course on "Using R as a Research Tool" at the School of Geosciences at the University of Edinburgh. These lessons will cover:

* Structuring a research project.
* Reading in and managing data.
* Data visualisation.
* Basic statistics.
* Generating reports.
* Publishing research projects.

This package requires RStudio (v1.3.1093 or later). Run the following to install:

    install.packages(c("learnr", "devtools"))
    library(devtools)
    install_github("susjoh/E4StatsTutorials")
    library(E4StatsTutorials)
    
The tutorials can be accessed by clicking "Tutorial" tab in the top right pane.

### Troubleshooting

If there is no Tutorial pane, try adding it by going to `Tools > Global Options... > Pane Layout` and selecting `Tutorial` for the top-right pane.

If the Tutorials still do not appear in the pane, try the following:

1. Refresh the Tutorial Pane 
2. Restart R Studio
3. If they don't work, then you can run the tutorials as follows (unfortunately they may open as a new window):

        learnr::run_tutorial("Tutorial1_E4_Introduction_to_R", "E4StatsTutorials")
        learnr::run_tutorial("Tutorial2_E4_RMarkdown_and_Stats", "E4StatsTutorials")

The presentations, data and images for the Repository are also included in this directory, so it's a good idea to download it also. Go to the green "Code" button (top right) and select "Download ZIP".


