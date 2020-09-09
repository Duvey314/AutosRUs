library(ggplot2)
library(dplyr)
library(tidyverse)

# distribution of weights
ggplot(mtcars,aes(x=wt)) + geom_density() #visualize distribution using density plot

# shapiro-wilk Normailty test
shapiro.test(mtcars$wt)

# check for normalized distribution 
population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F) #import used car dataset
plt <- ggplot(population_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

# create sample set with sample_n
sample_table <- population_table %>% sample_n(50) #randomly sample 50 data points
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

# creat sample set with slice_sample
sample_table <- slice_sample(population_table, n = 50) #randomly sample 50 data points
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot
