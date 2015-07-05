library(shiny)
library(choroplethr)

data(df_state_demographics , package="choroplethr", envir=environment())
data(df_county_demographics , package="choroplethr", envir=environment())

shinyServer(function(input, output) {

  output$stateMap = renderPlot({
    df_state_demographics$value  = df_state_demographics[, input$demographic]
    states = as.character(input$states)
    state_choropleth(df_state_demographics, num_colors=input$num_colors, zoom=states)
  })
  
  output$countyMap = renderPlot({
    df_county_demographics$value  = df_county_demographics[, input$demographic]
    states = as.character(input$states)
    county_choropleth(df_county_demographics, num_colors=input$num_colors, state_zoom=states)
  })
  
})
