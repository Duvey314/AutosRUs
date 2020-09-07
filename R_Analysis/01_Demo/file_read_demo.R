# install the libraries
library(jsonlite)
library(tidyverse)

# read in our data files
# demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)
# demo_table2 <- fromJSON(txt='demo.json')
demo_table3 <- read.csv('demo2.csv',check.names = F,stringsAsFactors = F)

# index specific data
claires_miles <- demo_table[2,"Total_Miles"]
car_types <- demo_table$Vehicle_Class

# filter data
filter_table <- demo_table2[demo_table2$price > 10000,]
filter_table2 <- subset(demo_table2, price > 10000 & drive == "4wd" & "clean" %in% title_status) #filter by price and drivetrain

# sample data
demo_table[sample(1:nrow(demo_table), 3),]

# mutate data
demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE) #add columns to original data frame

# groupby and summarize
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer)) #create summary table
summarize_demo2 <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer),Maximum_Price=max(price),Num_Vehicles=n()) #create summary table with multiple columns
