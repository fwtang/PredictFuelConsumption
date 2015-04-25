# load packages
library(UsingR); 
require(rCharts); library(datasets); library(knitr)

#load dataset "mtcars" and selected fields
data(mtcars)
df_cars<-subset(mtcars, select=c("mpg", "am", "wt"))
df_cars$am<-as.factor(df_cars$am)

# predict MPG function
predictMPG <- function(am, weight){
        #create dataframe based on the inputs
        newIn<-data.frame(as.factor(am), weight)
        colnames(newIn)<-c("am", "wt")
        
        #create the model and run the prediction
        fit<-lm(mpg~am+wt, data=df_cars)
        prediction<-predict(fit, newIn, interval="prediction")
        prediction[1]
} 


shinyServer(
        function(input, output) {
                
                # generate a scattered plot using the mtcars dataset
                # overlay the predicted mpg as Yellow dot in the chart
                output$myChart <- renderChart({
                        newdf<-data.frame(predictMPG(input$am, input$weight), as.factor(input$am), input$weight)
                        colnames(newdf)<-c("mpg", "am", "wt")
                        r1 <- rPlot(mpg ~ wt, data = df_cars, type = "point", color="am")
                        r1$layer(data=newdf, type="point", color=list(const='yellow'), copy_layer=TRUE )
                        r1$addParams(dom = 'myChart')
                        return(r1)
                })
                
                # display other output fields
                output$out_am <- renderPrint({input$am})        
                output$out_weight <- renderPrint({input$weight})
                output$prediction <- renderPrint({predictMPG(input$am, input$weight)})
                        
        }
)