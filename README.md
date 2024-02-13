## Using R as a Research Tool

This repository contains Tutorials for the NERC E4 DTP course on "Using R as a Research Tool" at the School of Geosciences at the University of Edinburgh. 

The prerequisite for this course is to complete the Our Coding Club [Intro to R](https://ourcodingclub.github.io/tutorials/intro-to-r/) tutorial.

The aim of these tutorials is to help you understand how to begin and manage a research project in R. They will cover:

* Structuring a research project.
* Reading in and managing data.
* Data visualisation.
* Basic statistics.
* Generating reports.
* Publishing research projects.

If you are a student on the E4 DTP, log on to Learn and navigate to:

`Numeracy Modelling and Data Management (2023 - 2024)[SEM2] > Course Materials > R courses - Susan Johnston`

and follow the instructions to load the tutorial.

---

If you want to run this using the Tutorial function in R, this can be installed and run within [R](https://cloud.r-project.org/). It requires [RStudio](https://rstudio.com/products/rstudio/download/) (v1.3.1093 or later). Run the following to install:

```
install.packages(c("learnr", "devtools"))
library(devtools)
install_github("susjoh/E4StatsTutorials")
library(E4StatsTutorials)
```   

The tutorials can be accessed by clicking "Tutorial" tab in the top right pane. Alternatively you can run as follows:

`learnr::run_tutorial("Tutorial1_Introduction_to_R", "E4StatsTutorials")`

Please see the **Troubleshooting** section below if you cannot get these to run. Alternatively, tutorials can be accessed at the following links:

Part 1: https://susjoh.shinyapps.io/Tutorial1_Introduction_to_R/

Part 2: https://sejohnston.shinyapps.io/Tutorial2_E4_RMarkdown_and_Stats/ (TO BE UPDATED)

You can download the data by clicking "Code" and "Download ZIP" above and extracting the "data" folder. The answers, presentations, data and images for the Repository are also included in the ZIP bundle, so may be generally a good idea to download it. 

### Troubleshooting the Tutorial Install.

1. Double check that you have a recent version of RStudio.  If you have installed RStudio from the University Software Centre it may be too old.

2. If there is no Tutorial pane, try adding it by going to `Tools > Global Options... > Pane Layout` and selecting `Tutorial` for the top-right pane.

3. If the Tutorials still do not appear in the pane, try the following:

  * Refresh the Tutorial Pane 
  * Restart R Studio


