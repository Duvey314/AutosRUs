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

# two sample t test for comparing samples
mpg_data <- read.csv('mpg_modified.csv') #import dataset
mpg_1999 <- mpg_data %>% filter(year==1999) #select only data points where the year is 1999
mpg_2008 <- mpg_data %>% filter(year==2008) #select only data points where the year is 2008

t.test(mpg_1999$hwy,mpg_2008$hwy,paired = T) #compare the mean difference between two samples

# ANOVA Test
mtcars_filt <- mtcars[,c("hp","cyl")] #filter columns from mtcars dataset
mtcars_filt$cyl <- factor(mtcars_filt$cyl) #convert numeric column to factor

aov(hp ~ cyl,data=mtcars_filt) #compare means across multiple levels

summary(aov(hp ~ cyl,data=mtcars_filt)) # wrap aov in summary function to see p value

# correlation coefficient
head(mtcars)

plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() #create scatter plot

cor(mtcars$hp,mtcars$qsec) #calculate correlation coefficient

# regression matrix
used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F) #read in dataset
used_matrix <- as.matrix(used_cars[,c("Selling_Price","Present_Price","Miles_Driven")]) #convert data frame into numeric matrix
cor(used_matrix)

# linear regression
lm(qsec ~ hp,mtcars) #create linear model

summary(lm(qsec ~ hp,mtcars)) 

model <- lm(qsec ~ hp,mtcars) #create linear model
yvals <- model$coefficients['hp']*mtcars$hp + model$coefficients['(Intercept)'] #determine y-axis values from linear model

plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model

# multiple variable linear regression
lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars) #generate multiple linear regression model

# summary data
summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)) #generate summary statistics
