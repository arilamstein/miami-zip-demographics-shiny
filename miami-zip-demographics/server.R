list.of.packages <- c("choroplethrZip", "devtools", "shiny", "R6", "mapproj")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

library(R6)
library(shiny)
library(devtools)
library(choroplethrZip)
library(ggplot2)
library(mapproj)

if (!"choroplethrZip" %in% installed.packages()[, "Package"]) {
  install_github('arilamstein/choroplethrZip@v1.3.0')
}
library(choroplethrZip)

shinyServer(function(input, output) {
  
  output$map = renderPlot({
    # add a progress bar
    progress = shiny::Progress$new()
    on.exit(progress$close())
    progress$set(message = "Creating image. Please wait.", value = 0)
    
    df_zip_demographics$value = df_zip_demographics[, input$value]
    num_colors = as.numeric(input$num_colors)
    zip_choropleth(df_zip_demographics, 
                   num_colors=num_colors,
                   msa_zoom="Miami-Fort Lauderdale-West Palm Beach, FL") + coord_map()
  })
  
  output$boxplot = renderPlot({
    # add a progress bar
    progress = shiny::Progress$new()
    on.exit(progress$close())
    progress$set(message = "Creating image. Please wait.", value = 0)
    
    df_zip_demographics$value = df_zip_demographics[, input$value]
    boxplot(df_zip_demographics$value)
  })
})
