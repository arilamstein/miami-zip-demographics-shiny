library(shiny)
library(choroplethrMaps)

data(state.map)
state.names = unique(state.map$region)

data(df_state_demographics, package="choroplethr")
demographic_choices = colnames(df_state_demographics)[2:ncol(df_state_demographics)]

shinyUI(fluidPage(

  titlePanel("Shiny Statistical Maps"),

  sidebarLayout(
    sidebarPanel(
      selectInput("demographic",
                  label = "Select demographic",
                  choices = demographic_choices,
                  selected = "total_population"),
      
      sliderInput(inputId = "num_colors",
                  label   = "Select number of colors",
                  min     = 1,
                  max     = 9,
                  value   = 7),
      
      selectInput(inputId  = "states", 
                  label    = "States",
                  choices  = state.names,
                  selected = state.names,
                  multiple = TRUE)
    ),

    mainPanel(
      plotOutput("stateMap"),
      plotOutput("countyMap")
    )
  )
))
