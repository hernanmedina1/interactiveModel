#
# user interface code for interactive model shiny app
# Hernan L. Medina
# January 22, 2017
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Children's Weights Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
       sidebarPanel('Data used in this app is the kid.weights dataset from package UsingR.
                    Variables are gender, age (months), weight (pounds), and height (inches).
                    You can change the plot and the linear regression by changing the gender
                    (male of female) or the independent variable (age or height)). When you
                    do that, the regression formula changes, the plot elements change, and
                    the footnote below the plot changes.',

             selectInput('dsubset', 'Choose Male or Female:',
                         choices = c('Female' = 'F',
                                     'Male' = 'M')),

             selectInput('dvariable', 'Choose Age or Height:',
                         choices = c('Age' = 'age',
                                     'Height' = 'height'))

    ),

    # Show a plot of the generated distribution
    mainPanel(h4("Exploration of Factors Related to Weight"),
       plotOutput("dPlot"),
       textOutput("dF1")
    )
  )
))
