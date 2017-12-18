library(shiny)
library(datasets)


mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$mpgPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = mpgData,
            outline = input$outliers,col = c("yellow","red","green"))
  })
  output$text<-renderText({
   "DESCRIPTION: I have use mtcars as base dataset and use radiobuttons. 
    The boxplots are used to for each mpg vs cylinder,transmission,gear. 
    The outliers are also used as check box to ensure that boxplots value chnages with outliers.
    The description part is added as text. The server.UI actually contains the code. 
    It uses boxplot to plot and add the data to variable ( used in the UI.R function) Please not that
    the variable name will be exactly same."
  })
})