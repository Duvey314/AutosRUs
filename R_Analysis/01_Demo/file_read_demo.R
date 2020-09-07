# demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)
#library(jsonlite)
#demo_table2 <- fromJSON("http://citibikenyc.com/stations/json")
demo_table2 <- fromJSON(txt='demo.json')
