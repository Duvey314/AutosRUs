# import libraries
library(ggplot2)
library(dplyr)
library(tidyverse)

# pull in our data
mpg_data <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
suspension <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# perform multiple linear regression on mpg data to predict mpg
head(mpg_data) # inspect the data
lm(mpg ~ AWD + `vehicle weight` + `ground clearance` ,data=mpg_data)
summary(lm(mpg ~ AWD + `vehicle weight` + `ground clearance` ,data=mpg_data))

# only the ground clearance seemed to effect mpg. Lets try with other variables
lm(mpg ~ `spoiler angle` + `vehicle length` + AWD + `ground clearance` ,data=mpg_data)
summary(lm(mpg ~ `spoiler angle` + `vehicle length` + AWD + `ground clearance` ,data=mpg_data))

# check all of them just to be sure
summary(lm(mpg ~ `spoiler angle` + `vehicle length` + AWD + `ground clearance` + `vehicle weight`, data=mpg_data))
