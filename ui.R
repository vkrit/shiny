library(shiny)
library(ggplot2)  

shinyUI(fluidPage(
    title = 'Fuel Consumption Prediction',
    sidebarLayout(
        sidebarPanel(
            h4('Specification:'),
            conditionalPanel(
                'input.dataset === "mtcars"',
                helpText('1.View the Dataset: Motor Trend Car Road Tests'),        
                helpText('- Click the column header to sort a column.'),
                helpText('- Change the number of records in display.'),
                helpText('2.Enter the Car Attributes'),
                helpText('3.Press "Submit" to forecast the MPG')
            ),
            numericInput('wt', 'Weight (lb/1000) Min:3 Max:6', 3, min = 1, max = 6, step=0.01),
            numericInput('qsec', '1/4 mile time (sec) Min:15 Max:20', 17, min = 15, max = 20, step=0.01),
            numericInput('am', 'Transmission (0 = automatic, 1 = manual)', 1, min = 0, max = 1, step=1),
            submitButton('Submit')
        ),
        mainPanel(
            h4("Dataset: Motor Trend Car Road Tests"),
            tabsetPanel(
                id = 'dataset',
                tabPanel('mtcars', dataTableOutput('mytable2'))),
            h5("The Atrribute Value You Entered: Weight, 1/4 mile time, Transmission"),
            verbatimTextOutput("inputValue"),
            h5("Predict Fuel Consumption Based on Motor Trend Car Road Tests"),
            verbatimTextOutput("prediction")
            
        )
    )
)
)