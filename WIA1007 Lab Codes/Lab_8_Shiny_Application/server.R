library(shiny)

shinyServer(function(input, output) {
  
  # Find the number of solution
  numOfSolution <- reactive({
    
    a <- input$a_value
    b <- input$b_value
    c <- input$c_value
    
    test <- (b*b) - (4*a*c)
    if(input$solution){
      
      if(test == 0){
        print("There is only 1 solution.")
      }else if(test > 0) {
        print("There are 2 unique solutions.")
      }else{
        print("There are no solutions.")
      }
      
    }else {
      print("Mark the checkbox to see number of solutions!!!")
    }
    
    
  })
  
  # Find the solutions
  theSolutions <- reactive({
    
    a <- input$a_value
    b <- input$b_value
    c <- input$c_value
    
    test <- (b*b) - (4*a*c)
    
    if(input$solutions){
      
      if(test == 0){
        x <- (-b + sqrt((b*b) - 4*a*c))/(2*a)
        print(paste("x = ", x))
      }else if(test > 0){
        x <- (-b + sqrt((b*b) - 4*a*c))/(2*a)
        y <- (-b - sqrt((b*b) - 4*a*c))/(2*a)
        print(paste("x = ", x, ", ", y))
      }else{
        print("There are no real solution")
      }
      
    }else{
      print("Mark the checkbox to see the solutions!!!")
    }
    
    
  })
  
  # Output for Quadratic
  output$plotGraph <- renderPlot ({
    
    a <- input$a_value
    b <- input$b_value
    c <- input$c_value
    
    minX <- input$rangeX[1]
    maxX <- input$rangeX[2]
    minY <- input$rangeY[1]
    maxY <- input$rangeY[2]
    
    curve(a*x^2 + b*x + c, from = minX, to = maxX, ylim = c(minY, maxY), col = "red", lwd=2)
    abline(h=0)
    abline(v=0)
    
  })
  
  
  # Output for number of solution
  output$numSolution <- renderText({
    numOfSolution()
  })
  
  # Output for the solutions
  output$solution <- renderText({
    theSolutions()
  })
  
})