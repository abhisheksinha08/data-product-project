#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$ReturnValue <- renderText({
      height <- input$height
      if(input$heightType=='in')
      {
          height <- height * 2.5
      }
      height <- height/100.0
      
      weight <- input$weight
      if(input$weightType=='lb')
      {
          weight <- weight * 0.45
      }
      
      bmi<-weight / (height)^2
      
      bmiMessage <- "You are Under Weight."
      
      if(bmi>=18.5)
      {
          bmiMessage <- "You have Normal Weight."
      }
      
      if(bmi>=25)
      {
          bmiMessage <- "You are Over Weight."
      }
      
      if(bmi>=30)
      {
          bmiMessage <- "You are Obese."
      }
      
      paste0("BMI: ",bmi,".", bmiMessage)
      
  })
})
