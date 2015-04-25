# load packages
library(shiny)
require(rCharts); library(datasets); library(knitr)


shinyUI(fluidPage(
        
        titlePanel("Predict Your Car Fuel Consumption"),
        tags$hr(),
        
        # simple instruction on the UI
        h4("How to use the prediction function:"),
        h5("1. Select 'Transmission Type'"),
        h5("2. Slide the slider to enter the 'Weight'"),
        h5("3. Click on 'Submit' button"),
        h5("4. Predicted mpg value will be displayed in 'Result - Predicted MPG' field"),
        h5("5. Predicted mpg will be denoted in the chart as YELLOW dot"),
        tags$hr(),
        
        fluidRow(
                column(5,
                       h3("Input: "),
                       radioButtons("am", "Transmission Type ('am'):",
                                    choices = c("Automatic (0)"="0", "Manual (1)"="1"), 
                                    selected="0", inline = TRUE),
                       sliderInput("weight", "Weight (lb/1000) ('wt'): ", value = 3, min = 1.5, max = 6, 0.05),
                       submitButton('Submit')
                ),
                column(6,
                       h3('Result:'),
                       h5('Transmission Type Entered:'),
                       verbatimTextOutput("out_am"),
                       h5('Weight lb/1000 entered:'),
                       verbatimTextOutput("out_weight"),
                       h4('Predicted MPG: '),
                       verbatimTextOutput("prediction")
                )
        ),
        tags$hr(),
        h3("Chart: "),
        fluidRow(
                column(2, 
                       showOutput("myChart", "polycharts")
                )
        )
))