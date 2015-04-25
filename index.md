---
title       : Predict Fuel Consumption
subtitle    : 24 Apr 2014
author      : FW.Tang
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

This is a simple function for you to predict the fuel consumption of your car in miles per gallon (mpg).

The prediction model takes two inputs to predict the mpg.

A scattered plot of mtcars data is presented to give a visual idea of mpg with different weight and transimission type.


--- .class #id 

## About the Simple Prediction Function

1. User is required to enter two inputs:
 - transmission type (ie. automatic or manual)
 - weight of the car in lb/1000 (eg. slide to 3.25 if the weight is 3250lb )

2. Click on "Submit" button.

3. The predicted miles per gallon will be shown in "Predicted MPG" field.

4. The predicted value will also be shown as "Yellow" dot in the chart.

--- .class #id 

## Simple Prediction Function

A subset of mtcars data is extracted, ie. mpg (miles per gallon), 
am (transmission type; automatic=0, manual=1) and wt (weight of the car in lb/1000).




```r
data(mtcars)
df_cars<-subset(mtcars, select=c("mpg", "am", "wt"))
df_cars$am<-as.factor(df_cars$am)
```



PredictMPG takes in am and wt as input and prediction is made by calling predict function.

```r
predictMPG <- function(am, weight){
        newIn<-data.frame(as.factor(am), weight)
        colnames(newIn)<-c("am", "wt")
        fit<-lm(mpg~am+wt, data=df_cars)
        prediction<-predict(fit, newIn, interval="prediction")
        prediction[1]
} 
```

--- .class #id 

## Simple Prediction Function (cont'n)

Run the predictMPG() function by supplying am=0 and wt=3


```r
am<-0
wt<-3
predictMPG(am, wt)
```

```
## [1] 21.26312
```

--- .class #id 

## Use the Function

The simple function is availble at https://fwtang.shinyapps.io/PredictMPG/.

Have Fun!




### Thank you.
