#
# Using R as a Research Tool
# Learning how to import and explore data.
# Written by [] 2024-02-13, University of Edinburgh
#
#



#----------------------------------------
# 0. Warming up
#----------------------------------------

# Exercise 1

x <- rnorm(100, mean = 0, sd = 1)
y <- runif(100, min = 0, max = 1)

# Exercise 2

??"standard deviation"
sort(x, decreasing = T)
sort(y, decreasing = T)

#----------------------------------------
# 1. Set up the working environment
#----------------------------------------

# Install packages once only!

# install.packages(tidyverse)
# install.packages(palmerpenguins)

# Load the libraries

library(tidyverse)
library(palmerpenguins)

#----------------------------------------
# 2. Load data
#----------------------------------------

# Exercise 3

Peru_Soil_Data <- read_delim("data/Peru_Soil_Data.txt")
head(Peru_Soil_Data)
str(Peru_Soil_Data)

Peru_Soil_Data <- read.table("data/Peru_Soil_Data.txt", header = T)
Peru_Soil_Data_Problematic <- read.table("problem_data/Peru_Soil_Data_Problematic.txt", header = T, sep = "\t")


#----------------------------------------
# 3. Manage data
#----------------------------------------

# Sorting Data

# sort by Soil pH value:
arrange(Peru_Soil_Data, Soil_pH)

# sort by decreasing Soil pH value:
arrange(Peru_Soil_Data, -Soil_pH)

# sort by habitat and then soil pH within habitat:
arrange(Peru_Soil_Data, Habitat, Soil_pH)

# Subsetting columns

select(Peru_Soil_Data, River_Basin)
select(Peru_Soil_Data, -River_Basin)

select(Peru_Soil_Data, River_Basin, Magnesium, Sodium)
select(Peru_Soil_Data, -River_Basin, -Magnesium, -Sodium)

# Adding columns.

Peru_Soil_Data$River_Basin
Peru_Soil_Data$log_Calcium <- log10(Peru_Soil_Data$Calcium)
head(select(Peru_Soil_Data, Site, Calcium, log_Calcium))

# Subsetting rows with filter()

filter(Peru_Soil_Data, Habitat == "floodplain", River_Basin == "Manu")

# Exercise 4

# Create a new data frame, Peru_Upland_Soil, which includes row only from upland habitats.

Peru_Upland_Soil <- filter(Peru_Soil_Data, Habitat == "upland")

# Edit this data frame so that it only includes data from the Manu and Los Amigos river basins (Hint: use $\%in\%$)

Peru_Upland_Soil <- filter(Peru_Upland_Soil, River_Basin %in% c("Manu", "Los_Amigos"))

# Edit this data frame again so that it is sorted by increasing Calcium levels.

Peru_Upland_Soil <- arrange(Peru_Upland_Soil, Calcium)

# Create a new column called Sum_Ca_Mg that is the sum of the calcium and magnesium columns.

Peru_Upland_Soil$Sum_Ca_Mg <- Peru_Upland_Soil$Calcium + Peru_Upland_Soil$Magnesium

# Write to file: remember to create a results folder!

write_delim(Peru_Upland_Soil, "results/Peru_Upland_Soil.txt", delim = "\t")

# Explore the group_by() and summarise() function in dplyr

Peru_Soil_Data %>% group_by(Habitat) %>% summarise(Mean_Phosphorus = mean(Phosphorus),
                                                   Mean_Calcium = mean(Calcium))

#----------------------------------------
# 4. Visualise data with base graphics
#----------------------------------------

# histogram
hist(Peru_Soil_Data$Calcium)

# plot
plot(Magnesium ~ Calcium, data = Peru_Soil_Data, col = "red")

# boxplot
boxplot(Magnesium ~ River_Basin, data = Peru_Soil_Data)

#----------------------------------------
# 5. Visualise data with ggplot2
#----------------------------------------

ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, col = species)) +
  geom_point()+
  stat_smooth(method = "lm") +
  labs(x = "Bill length (mm)", y = "Bill depth (mm)") +
  facet_wrap(~species)

ggsave("billlength_vs_depth.png", width = 12, height = 8, units = "cm", dpi = 300)


# Exercise 5

# 1

ggplot(penguins, aes(x = bill_depth_mm, y = flipper_length_mm, col = bill_length_mm)) +
  geom_point() +
  scale_colour_gradient(low = "red", high = "purple")

# 2

ggplot(penguins, aes(x= flipper_length_mm)) +
  geom_histogram()


# 3

ggplot(penguins, aes(x = species, y = flipper_length_mm)) +
  geom_boxplot()
# 4

penguins_v2 <- filter(penguins, !is.na(sex))

ggplot(penguins_v2, aes(x = species, y = flipper_length_mm, fill = sex)) +
  geom_boxplot()

# 5

ggplot(penguins_v2, aes(x = species, y = flipper_length_mm, fill = sex)) +
  geom_boxplot() +
  theme_bw()

# 6

ggplot(penguins_v2, aes(x = species, y = flipper_length_mm, fill = sex)) +
  geom_boxplot() +
  facet_wrap(~species, scales = "free")

# 7

ggplot(penguins, aes(x = bill_length_mm, y = flipper_length_mm, col = species)) +
  geom_point(shape = 17, size = 3, alpha = 0.5) +
  theme(axis.text.x = element_text(angle = 90),
        legend.position = "top",
        axis.title = element_text(size = 14),
        panel.background = element_rect(fill = "lightblue"))


# * Using `theme()`, try to:
#   * Orientate the x axis labels to 90 degrees.
# * Place the legend at the top of the graph, and/or remove it altogether.
# * Make the axis title size bigger.
# * Turn the plot background to be "lightblue".
#
# * Using `geom_point`, try to:
#   * Change the shape, size and transparency of the points.

