library(shiny)
library(datasets)

preMPG <- function(wt, qsec, am) -3.1855*wt+1.5998*qsec+4.2995*am  
shinyServer(function(input, output) {
    
    # sorted columns are colored now because CSS are attached to them
    output$mytable2 <- renderDataTable({
        library(ggplot2)
        mtcars
    }, options = list(bSortClasses = TRUE,aLengthMenu = c(5, 32),iDisplayLength = 5))
    
    # Generate the predicted value of mpg
    output$prediction <- renderPrint({
        preMPG(input$wt,input$qsec,input$am)})
    
    # Enter the value of explanatory variables
    output$inputValue <- renderPrint({c(input$wt,input$qsec,input$am)})
})