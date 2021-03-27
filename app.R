library(shiny)
library(shinydashboard)
library(leaflet)
library(rgdal)
library(dplyr)
library(USAboundaries)
library(tools)

#------------Chloropeth Maps-------------
MaleBabyNames <- read_csv("MaleBabyNamesState2010.csv", 
                          col_types = cols(X5 = col_skip()))
FemaleBabyNames <- read_csv("FemaleBabyNamesState2010.csv", 
                            col_types = cols(X5 = col_skip()))
USA_sf <- maps::map("state", plot = FALSE, fill = TRUE) %>%
  sf::st_as_sf() %>%
  sf::st_transform(4326)

male_names <- merge(USA_sf, MaleBabyNames)
female_names <- merge(USA_sf, FemaleBabyNames)

male_names$ID <- toTitleCase(male_names$ID)
female_names$ID <- toTitleCase(female_names$ID)

full_baby_names

# Now, onto the most popular male baby name per state. Here we assign the 
# bins and colors of said bins to the graph. For males, we chose Reds.
bins <- c(0, 25, 50, 100, 250, 500, 1000, 5000)
m_pal <- colorBin("Reds", domain = male_names$Count, bins = bins)

bins <- c(0, 25, 50, 100, 250, 500, 1000, 5000)
f_pal <- colorBin("Greens", domain = female_names$Count, bins = bins)

# -------------Shiny App-----------------
# Define UI for miles per gallon app ----
ui <- dashboardPage(
  skin = "red", 
  dashboardHeader(title = "Baby Names"),
  dashboardSidebar(
    subtitle = a("This is just a small project I did, collecting most popular baby
    names by state, divided by assigned sex and by year. Hawaii and Alaska are
    missing from the visualization, but are listed below:", br(), br(), "Most common traditionally 
                 male name in Alaska: William at 57", br(), "in Hawaii: Noah at 88.",
                 br(), br(), "Most common traditionally female name in Alaska: Sophia
                 at 62.", br(), "in Hawaii: Isabella at 70.", br(), br(), "Scrolling to the bottom of 'Full Dataset' will allow you to put in search parameters!", br(), br(), "Data 
                 is avaliable from the Social Security Administration.")
  ),
  dashboardBody(
    tabsetPanel(type = "tab",
                tabPanel("Traditionally Male Names - 2010", fluidRow(box(width = 12, leafletOutput(outputId = "mymalemap")))),
                tabPanel("Traditionally Female Names - 2010", fluidRow(box(width = 12, leafletOutput(outputId = "myfemalemap")))),
                tabPanel("Full Dataset, 1950s-2015 by 10 Years", fluidRow(box(width = 12, dataTableOutput(outputId = "summary_table")))))
    # add leaflet
    
  )
)

# Define server logic to plot various variables against mpg ----
server <- function(input, output) {
  
  output$mymalemap <- renderLeaflet(leaflet(male_names) %>%
                                  addTiles() %>% 
                                  setView(-96, 37.8, zoom = 4) %>%
                                  addProviderTiles(
                                    "MapBox", 
                                    options = providerTileOptions(
                                      id = "mapbox.light",
                                      accessToken = Sys.getenv('MAPBOX_ACCESS_TOKEN'))) %>%
                                  addPolygons(
                                    fillColor = ~m_pal(male_names$Count),
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
                                    label = (labels <- sprintf(
                                      "<strong>%s</strong><br/>%s: %s</sup>",
                                      male_names$ID, male_names$Name, male_names$Count
                                    ) %>% lapply(htmltools::HTML)),
                                    labelOptions = labelOptions(
                                      style = list("font-weight" = "normal", padding = "3px 8px"),
                                      textsize = "15px",
                                      direction = "auto"))
                                  )
  output$myfemalemap <- renderLeaflet(leaflet(female_names) %>%
                                      addTiles() %>% 
                                      setView(-96, 37.8, zoom = 4) %>%
                                      addProviderTiles(
                                        "MapBox", 
                                        options = providerTileOptions(
                                          id = "mapbox.light",
                                          accessToken = Sys.getenv('MAPBOX_ACCESS_TOKEN'))) %>%
                                      addPolygons(
                                        fillColor = ~f_pal(female_names$Count),
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
                                        label = (labels <- sprintf(
                                          "<strong>%s</strong><br/>%s: %s</sup>",
                                          female_names$ID, female_names$Name, female_names$Count
                                        ) %>% lapply(htmltools::HTML)),
                                        labelOptions = labelOptions(
                                          style = list("font-weight" = "normal", padding = "3px 8px"),
                                          textsize = "15px",
                                          direction = "auto"))
  )
  
  output$summary_table <- renderDataTable(full_baby_names)
  #data_input_ordered <- data_input()[order(match(data_input()$Id, ))]
  
}

shinyApp(ui, server)