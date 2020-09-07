# install the libraries
library(jsonlite)
library(tidyverse)

# read in our data files
# demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)
# demo_table2 <- fromJSON(txt='demo.json')

# index specific data
claires_miles <- demo_table[2,"Total_Miles"]
car_types <- demo_table$Vehicle_Class

# filter data
filter_table <- demo_table2[demo_table2$price > 10000,]
filter_table2 <- subset(demo_table2, price > 10000 & drive == "4wd" & "clean" %in% title_status) #filter by price and drivetrain

# sample data
demo_table[sample(1:nrow(demo_table), 3),]


