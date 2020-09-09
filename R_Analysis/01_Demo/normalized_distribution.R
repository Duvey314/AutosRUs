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

# create sample set with slice_sample
sample_table2 <- slice_sample(population_table, n = 50) #randomly sample 50 data points
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

# t-test for sample_n
t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven))) #compare sample versus population means

# t-test for slice_sample
t.test(log10(sample_table2$Miles_Driven),mu=mean(log10(population_table$Miles_Driven))) #compare sample versus population means

# 2 sample t-test
n_sample_table <- population_table %>% sample_n(50) #generate 50 randomly sampled data points
n_sample_table2 <- population_table %>% sample_n(50) #generate another 50 randomly sampled data points

t.test(log10(n_sample_table$Miles_Driven),log10(n_sample_table2$Miles_Driven)) #compare means of two samples

slice_sample_table <- slice_sample(population_table, n = 50) # generate 50 samples
slice_sample_table2 <- slice_sample(population_table, n = 50) # generate another 50

t.test(log10(slice_sample_table$Miles_Driven), log10(slice_sample_table2$Miles_Driven)) #compare means of two samples
