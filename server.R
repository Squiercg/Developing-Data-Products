library(shiny)
library(datasets)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  formulaTextPoint <- reactive({
    paste("mpg ~", "as.integer(", input$variable, ")")
  })
  
  output$mpgBoxPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = mpgData,
            outline = input$outliers)
  })
})
