library(shiny)
library(choroplethrZip)
library(markdown)

data(df_zip_demographics)
demographics = colnames(df_zip_demographics)[2:9]

shinyUI(fluidPage(

  titlePanel("Explore Miami-Fort Lauderdale-West Palm Beach, Florida Demographics"),

  fluidRow(column(12, includeMarkdown("1.md"))),

  sidebarLayout(
    sidebarPanel(
      selectInput("value",
                  "value",
                  demographics,
                  selected="per_capita_income"),
      selectInput("num_colors",
                  "Number of Colors",
                  1:9,
                  selected=7)                  
    ),

    mainPanel(
      plotOutput("map"),
      plotOutput("boxplot")
    ),
    
#    fluidRow(column(12, includeMarkdown("1.md")))
    
  )
))
