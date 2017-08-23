#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        
        # Application title
        titlePanel("BMI Calculator"),
        
        # Sidebar with a slider input for number of bins 
        sidebarLayout(
                sidebarPanel(
                        numericInput("height","Height", min = 1, max=250, value=72),
                        selectInput("heightType","", c("Inches"="in","Centimeters"="cm")),
                        numericInput("weight","Weight", value=75),
                        selectInput("weightType","", c("Kilos"="kg","Pounds"="lb"))
                        
                ),
                
                # Show a plot of the generated distribution
                mainPanel(width=8,
                          
                          htmlOutput("Documentation"),
                          htmlOutput("ReturnValue")
                )
        )
)
)
