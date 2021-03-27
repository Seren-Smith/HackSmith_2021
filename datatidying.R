# data tidying
library(dplyr)

setwd("C:/Users/jewel/OneDrive/Documents/Personal_Projects/name_generator/")
state_name_list <- list.files("babynames")

getwd()
setwd("C:/Users/jewel/OneDrive/Documents/Personal_Projects/name_generator/babynames")
getwd()

datalist = lapply(state_name_list, function(x)read.csv(x, header=T)) 
datalist
dataset = do.call("rbind", datalist) 

# ABOVE NO LONGER NECESSARY
dataset <- read_csv("dataset.csv", 
                    col_types = cols(X5 = col_skip()))
dataset <- toTitleCase(dataset$ID)
setwd("C:/Users/jewel/OneDrive/Documents/Personal_Projects/name_generator")
write.csv(dataset, "dataset.csv")

dataset <- filter(dataset, Count >= 5)
dataset <- filter(dataset, Year >= 1950)
dataset <- filter(dataset, (Year == 1950 | Year == 1960 |
                                        Year == 1970 | Year == 1980 |
                                        Year == 1990 | Year == 2000 |
                                        Year == 2010 | Year == 2015))

dataset
glimpse(dataset)

dataset_50s <- filter(dataset, Year == 1950)
dataset_60s <- filter(dataset, Year == 1960)
dataset_70s <- filter(dataset, Year == 1970)
dataset_80s <- filter(dataset, Year == 1980)
dataset_90s <- filter(dataset, Year == 1990)
dataset_00s <- filter(dataset, Year == 2000)
dataset_10s <- filter(dataset, Year == 2010)
dataset_15 <- filter(dataset, Year == 2015)

