library(shiny)
library(shinydashboard)
library(leaflet)
library(rgdal)
library(dplyr)
library(USAboundaries)
library(tools)
library(readr)

#------------Chloropeth Maps-------------
male_names_50s
female_names_50s

bins <- c(0, 25, 50, 100, 250, 500, 1000, 5000)
m_pal_50s <- colorBin("Reds", domain = male_names_50s$Count, bins = bins)

bins <- c(0, 25, 50, 100, 250, 500, 1000, 5000)
f_pal_50s <- colorBin("Greens", domain = female_names_50s$Count, bins = bins)

# -------------Shiny App-----------------
# Define UI for miles per gallon app ----
ui <- dashboardPage(
  skin = "red", 
  dashboardHeader(title = "Baby Names"),
  dashboardSidebar(
    subtitle = a("This is just a small project I did, collecting most popular baby
    names by state, divided by assigned sex and by year. Hawaii and Alaska are
    missing from the visualization, unfortunately.", br(), br(), "Data 
                 is avaliable from the Social Security Administration.")
  ),
  dashboardBody(
    tabsetPanel(type = "tab",
                tabPanel("50s Male Names", fluidRow(box(width = 12, leafletOutput(outputId = "mymalemap_50s")))),
                tabPanel("50s Female Names", fluidRow(box(width = 12, leafletOutput(outputId = "myfemalemap_50s")))))
    # add leaflet
  )
)

server <- function(input, output) {
  
  output$mymalemap_50s <- renderLeaflet(leaflet(male_names_50s) %>%
                                      addTiles() %>% 
                                      setView(-96, 37.8, zoom = 4) %>%
                                      addProviderTiles(
                                        "MapBox", 
                                        options = providerTileOptions(
                                          id = "mapbox.light",
                                          accessToken = Sys.getenv('MAPBOX_ACCESS_TOKEN'))) %>%
                                      addPolygons(
                                        fillColor = ~m_pal_50s(male_names_50s$Count),
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
                                          male_names_50s$ID, male_names_50s$Name, male_names_50s$Count
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
}

shinyApp(ui, server)