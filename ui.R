library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("MTCARS MILES PER GALLON"),
  sidebarPanel(
    radioButtons("variable", "Variable:",
                list("Cylinders" = "cyl", 
                     "Transmission" = "am", 
                     "Gears" = "gear")),
    
    checkboxInput("outliers", "Show outliers", TRUE)
  ),
  
  mainPanel(
    h3(textOutput("caption")),
    
    plotOutput("mpgPlot")
  )
))