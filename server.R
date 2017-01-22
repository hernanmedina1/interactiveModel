#
# server code for interactive model shiny app
# Hernan L. Medina
# January 22, 2017
#

library(shiny)
library(UsingR)
data(kid.weights)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$dPlot <- renderPlot({

    ddata <- subset(kid.weights, gender == input$dsubset)
    ddata <-  ddata[, c(input$dvariable, "weight")]
    x <- ddata[, 1]
    y <- ddata[, 2]
    r <- lm(y ~ x)
    a <- round(r$coefficients[1],4)
    b <- round(r$coefficients[2],4)
    n <- nchar(input$dvariable)
    xlab <- paste(toupper(substring(input$dvariable,1,1)), substring(input$dvariable, 2, n), sep='')
    ylab <- 'Weight'
    main <- paste('Weight =', a, '+', b, '*', xlab)
    plot(x, y, xlab=xlab, ylab=ylab, main=main)
    abline(a = a, b = b, col="blue")

  })

  output$dF1 <- renderText({
        g <- switch(input$dsubset, M = 'male', F = 'female')
        paste('The blue line represents weight as a function of',
              input$dvariable, 'for', g, 'children.')
  })

})
