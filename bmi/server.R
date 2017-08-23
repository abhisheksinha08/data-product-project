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
  
        output$Documentation <- renderText({
                "<h3>Documentation</h3>
1. Enter Height and Select Unit from the Drop Down List. 
                <br/> 2. Enter Weight and select unit from drop down list. 
                <br/>3. System will calculate the BMI.<hr/><br/><h3>Results</h3>"
        })
        
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
      
      paste0("<ul><li><b>BMI: </b>",bmi,".</li><li>", bmiMessage,"</li></ul>")
      
  })
})
