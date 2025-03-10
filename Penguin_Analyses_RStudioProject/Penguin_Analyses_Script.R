#------------------------------------------------------------------------------#
### Penguin Analyses Script: Data Import and Wrangling, Vis & Stats.        ####
#------------------------------------------------------------------------------#

### Load the necessary libraries #####
library(dplyr)
library(tidyplots)
library(ggplot2)
library(readr)

### Import the data ####
data_field <- read_csv("data/palmerpenguins_fielddata.csv")
data_lab <- read_csv("data/palmerpenguins_labdata.csv")

### Join the data #### 
data_penguins <- full_join(data_field, data_lab)

### Compute MW SD of delta15N & delta13C per species and sex ####
data_penguins %>% 
  group_by(species, sex) %>% 
  summarize(mean15N = mean(delta15N, na.rm = T),
            sd15N = sd(delta15N, na.rm = T),
            mean13C = mean(delta13C, na.rm = T),
            sd13C = sd(delta13C, na.rm = T))

### Plot distributions of delta15N & delta13C per species and sex ####
### Plot distributions of delta15N & delta13C per species and sex ####
data_penguins %>% 
  tidyplot(x = sex, y = delta15N, color = sex) %>% 
  add_data_points_jitter(saturation = .1) %>% 
  split_plot(species)

data_penguins %>% 
  tidyplot(x = sex, y = delta13C, color = sex) %>% 
  add_data_points_jitter(saturation = .1) %>% 
  split_plot(species)