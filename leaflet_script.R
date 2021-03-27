# leaflet script

library(readr)
library(leaflet)
library(ggplot2)
library(USAboundaries)
library(dplyr)
library(tools)
library(sf)

MaleBabyNames <- read_csv("MaleBabyNamesState2010.csv", 
                          col_types = cols(X5 = col_skip()))
FemaleBabyNames <- read_csv("FemaleBabyNamesState2010.csv", 
                            col_types = cols(X5 = col_skip()))
BabyNames <- read_csv("BabyNamesState2010.csv", 
                            col_types = cols(X5 = col_skip()))
View(BabyNames)
USA_sf <- maps::map("state", plot = FALSE, fill = TRUE) %>%
  sf::st_as_sf() %>%
  sf::st_transform(4326)

male_names <- merge(USA_sf, MaleBabyNames)
female_names <- merge(USA_sf, FemaleBabyNames)
full_names <- merge(USA_sf, BabyNames)
full_names$ID <- toTitleCase(full_names$ID)
male_names$ID <- toTitleCase(male_names$ID)
female_names$ID <- toTitleCase(female_names$ID)

# Now, onto the most popular male baby name per state. Here we assign the 
# bins and colors of said bins to the graph. For males, we chose Reds.
bins <- c(0, 25, 50, 100, 250, 500, 1000, 5000)
pal <- colorBin("Reds", domain = male_names$Count, bins = bins)

# Here we label the most popular male names so that we can display the labels
# on the map.
labels <- sprintf(
  "<strong>%s</strong><br/>%s: %s</sup>",
  male_names$ID, male_names$Name, male_names$Count
) %>% lapply(htmltools::HTML)

# Here we set the view over the continental USA. 
leaflet(male_names) %>%
  addTiles() %>% 
  setView(-96, 37.8, zoom = 4) %>%
  addProviderTiles(
    "MapBox", 
    options = providerTileOptions(
      id = "mapbox.light",
      accessToken = Sys.getenv('MAPBOX_ACCESS_TOKEN'))) %>%
  # Here we color the states by how many instances of the most popular names occur.
  # This allows us to see the areas where most children of those names were born.
  addPolygons(
    fillColor = ~pal(male_names$Count),
    weight = 2,
    opacity = 1,
    color = "white",
    dashArray = "3",
    fillOpacity = 0.7,
    highlight = highlightOptions(
      weight = 5,
      color = "#666",
      dashArray = "",
      fillOpacity = 0.7,
      bringToFront = TRUE),
    label = labels,
    labelOptions = labelOptions(
      style = list("font-weight" = "normal", padding = "3px 8px"),
      textsize = "15px",
      direction = "auto")) %>%
  addLegend(pal = pal, values = ~Count, opacity = 0.7, title = NULL,
            position = "bottomright")

# Now, onto the most popular female baby name per state. Here we assign the 
# bins and colors of said bins to the graph. Here we decided on Greens.
bins <- c(0, 25, 50, 100, 250, 500, 1000, 5000)
pal <- colorBin("Greens", domain = female_names$Count, bins = bins)

# Here we label the most popular female names so that we can display the labels
# on the map.
labels2 <- sprintf(
  "<strong>%s</strong><br/>%s: %s</sup>",
  female_names$ID, female_names$Name, female_names$Count
) %>% lapply(htmltools::HTML)

# Here we set the view over the continental USA. 
leaflet(female_names) %>%
  addTiles() %>% 
  setView(-96, 37.8, zoom = 4) %>%
  addProviderTiles(
    "MapBox", 
    options = providerTileOptions(
      id = "mapbox.light",
      accessToken = Sys.getenv('MAPBOX_ACCESS_TOKEN'))) %>%
  # Here we color the states by how many instances of the most popular names occur.
  # This allows us to see the areas where most children of those names were born.
  addPolygons(
    fillColor = ~pal(female_names$Count),
    weight = 2,
    opacity = 1,
    color = "white",
    dashArray = "3",
    fillOpacity = 0.7,
    highlight = highlightOptions(
      weight = 5,
      color = "#666",
      dashArray = "",
      fillOpacity = 0.7,
      bringToFront = TRUE),
    label = labels2,
    labelOptions = labelOptions(
      style = list("font-weight" = "normal", padding = "3px 8px"),
      textsize = "15px",
      direction = "auto")) %>%
  addLegend(pal = pal, values = ~Count, opacity = 0.7, title = NULL,
            position = "bottomright")

full_names <- st_join(male_names, female_names, by = ID)
head(full_names)
View(full_names)

selectInput("state", "State Name:",
            c("Alabama", "Alaska", "Arizona", "Arkansas",
              "California", "Colorado", "Connecticut",
              "Delaware", "Florida", "Georgia", "Hawaii",
              "Idaho", "Illinois", "Indiana", "Iowa",
              "Kansas", "Kentucky", "Louisiana", "Maine",
              "Maryland", "Massachusetts", "Michigan",
              "Minnesota", "Mississippi", "Missouri",
              "Montana", "Nebraska", "Nevada", "New Hampshire",
              "New Jersey", "New Mexico", "New York",
              "North Carolina", "North Dakota", "Ohio",
              "Oklahoma", "Oregon", "Pennsylvania",
              "Rhode Island", "South Carolina",
              "South Dakota", "Tennessee", "Texas",
              "Utah", "Vermont", "Virginia", "Washington",
              "West Virginia", "Wisconsin", "Wyoming"),
            multiple = TRUE)