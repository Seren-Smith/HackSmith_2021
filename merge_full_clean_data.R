# combine with sf

library(readr)
library(leaflet)
library(ggplot2)
library(USAboundaries)
library(dplyr)
library(tools)
library(sf)

USA_sf <- maps::map("state", plot = FALSE, fill = TRUE) %>%
  sf::st_as_sf() %>%
  sf::st_transform(4326)

# 50s
top_male_baby_names_50s <- read_csv("top_male_baby_names_50.csv", 
                                   col_types = cols(X5 = col_skip()))
top_female_baby_names_50s <- read_csv("top_female_baby_names_50.csv",
                                   col_types = cols(X5 = col_skip()))

top_male_baby_names_50s$ID <- tolower(top_male_baby_names_50s$ID)
top_female_baby_names_50s$ID <- tolower(top_female_baby_names_50s$ID)

male_names_50s <- merge(top_male_baby_names_50s, USA_sf)
female_names_50s <- merge(top_female_baby_names_50s, USA_sf)
male_names_50s$ID <- toTitleCase(male_names_50s$ID)
female_names_50s$ID <- toTitleCase(female_names_50s$ID)

# 60s
top_male_baby_names_60s <- read_csv("top_male_baby_names_60.csv", 
                                    col_types = cols(X5 = col_skip()))
top_female_baby_names_60s <- read_csv("top_female_baby_names_60.csv",
                                      col_types = cols(X5 = col_skip()))

top_male_baby_names_60s$ID <- tolower(top_male_baby_names_60s$ID)
top_female_baby_names_60s$ID <- tolower(top_female_baby_names_60s$ID)

male_names_60s <- merge(top_male_baby_names_60s, USA_sf)
female_names_60s <- merge(top_female_baby_names_60s, USA_sf)
male_names_60s$ID <- toTitleCase(male_names_60s$ID)
female_names_60s$ID <- toTitleCase(female_names_60s$ID)

# 70s
top_male_baby_names_70s <- read_csv("top_male_baby_names_70.csv", 
                                    col_types = cols(X5 = col_skip()))
top_female_baby_names_70s <- read_csv("top_female_baby_names_70.csv",
                                      col_types = cols(X5 = col_skip()))

top_male_baby_names_70s$ID <- tolower(top_male_baby_names_70s$ID)
top_female_baby_names_70s$ID <- tolower(top_female_baby_names_70s$ID)

male_names_70s <- merge(top_male_baby_names_70s, USA_sf)
female_names_70s <- merge(top_female_baby_names_70s, USA_sf)
male_names_70s$ID <- toTitleCase(male_names_70s$ID)
female_names_70s$ID <- toTitleCase(female_names_70s$ID)

# 80s
top_male_baby_names_80s <- read_csv("top_male_baby_names_80.csv", 
                                    col_types = cols(X5 = col_skip()))
top_female_baby_names_80s <- read_csv("top_female_baby_names_80.csv",
                                      col_types = cols(X5 = col_skip()))

top_male_baby_names_80s$ID <- tolower(top_male_baby_names_80s$ID)
top_female_baby_names_80s$ID <- tolower(top_female_baby_names_80s$ID)

male_names_80s <- merge(top_male_baby_names_80s, USA_sf)
female_names_80s <- merge(top_female_baby_names_80s, USA_sf)
male_names_80s$ID <- toTitleCase(male_names_80s$ID)
female_names_80s$ID <- toTitleCase(female_names_80s$ID)

# 90s
top_male_baby_names_90s <- read_csv("top_male_baby_names_90.csv", 
                                    col_types = cols(X5 = col_skip()))
top_female_baby_names_90s <- read_csv("top_female_baby_names_90.csv",
                                      col_types = cols(X5 = col_skip()))

top_male_baby_names_90s$ID <- tolower(top_male_baby_names_90s$ID)
top_female_baby_names_90s$ID <- tolower(top_female_baby_names_90s$ID)

male_names_90s <- merge(top_male_baby_names_90s, USA_sf)
female_names_90s <- merge(top_female_baby_names_90s, USA_sf)
male_names_90s$ID <- toTitleCase(male_names_90s$ID)
female_names_90s$ID <- toTitleCase(female_names_90s$ID)

# 00s
top_male_baby_names_00s <- read_csv("top_male_baby_names_00.csv", 
                                    col_types = cols(X5 = col_skip()))
top_female_baby_names_00s <- read_csv("top_female_baby_names_00.csv",
                                      col_types = cols(X5 = col_skip()))

top_male_baby_names_00s$ID <- tolower(top_male_baby_names_00s$ID)
top_female_baby_names_00s$ID <- tolower(top_female_baby_names_00s$ID)

male_names_00s <- merge(top_male_baby_names_00s, USA_sf)
female_names_00s <- merge(top_female_baby_names_00s, USA_sf)
male_names_00s$ID <- toTitleCase(male_names_00s$ID)
female_names_00s$ID <- toTitleCase(female_names_00s$ID)

# 10s
top_male_baby_names_10s <- read_csv("top_male_baby_names_10.csv", 
                                    col_types = cols(X5 = col_skip()))
top_female_baby_names_10s <- read_csv("top_female_baby_names_10.csv",
                                      col_types = cols(X5 = col_skip()))

top_male_baby_names_10s$ID <- tolower(top_male_baby_names_10s$ID)
top_female_baby_names_10s$ID <- tolower(top_female_baby_names_10s$ID)

male_names_10s <- merge(top_male_baby_names_10s, USA_sf)
female_names_10s <- merge(top_female_baby_names_10s, USA_sf)
male_names_10s$ID <- toTitleCase(male_names_10s$ID)
female_names_10s$ID <- toTitleCase(female_names_10s$ID)

# 15
top_male_baby_names_15 <- read_csv("top_male_baby_names_15.csv", 
                                    col_types = cols(X5 = col_skip()))
top_female_baby_names_15 <- read_csv("top_female_baby_names_15.csv",
                                      col_types = cols(X5 = col_skip()))

top_male_baby_names_15$ID <- tolower(top_male_baby_names_15$ID)
top_female_baby_names_15$ID <- tolower(top_female_baby_names_15$ID)
male_names_10$ID <- toTitleCase(male_names_10$ID)
female_names_10$ID <- toTitleCase(female_names_10$ID)

male_names_15 <- merge(top_male_baby_names_15, USA_sf)
female_names_15 <- merge(top_female_baby_names_15, USA_sf)
male_names_15$ID <- toTitleCase(male_names_15$ID)
female_names_15$ID <- toTitleCase(female_names_15$ID)

# full join all names by gender
male_names_50_60 <- full_join(male_names_50s, male_names_60s)
male_names_50_70 <- full_join(male_names_50_60, male_names_70s)
male_names_50_80 <- full_join(male_names_50_70, male_names_80s)
male_names_50_90 <- full_join(male_names_50_80, male_names_90s)
male_names_50_00 <- full_join(male_names_50_90, male_names_90s)
male_names_50_10 <- full_join(male_names_50_00, male_names_10s)
male_names_full <- full_join(male_names_50_10, male_names_15)
male_names_full$ID <- toTitleCase(male_names_full$ID)

female_names_50_60 <- full_join(female_names_50s, female_names_60s)
female_names_50_70 <- full_join(female_names_50_60, female_names_70s)
female_names_50_80 <- full_join(female_names_50_70, female_names_80s)
female_names_50_90 <- full_join(female_names_50_80, female_names_90s)
female_names_50_00 <- full_join(female_names_50_90, female_names_90s)
female_names_50_10 <- full_join(female_names_50_00, female_names_10s)
female_names_full <- full_join(female_names_50_10, female_names_15)
female_names_full$ID <- toTitleCase(female_names_full$ID)

write.csv(male_names_full, "male_baby_names_full.csv", row.names = FALSE)
write.csv(female_names_full, "female_baby_names_full.csv", row.names = FALSE)

full_baby_names <- full_join(female_names_full, male_names_full)
write.csv(full_baby_names, "full_baby_names.csv", row.names = FALSE)
