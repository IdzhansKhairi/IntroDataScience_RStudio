# Plotting Quadratic Graph

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Quadratic Graph Generator"),
  
  sidebarLayout(
    sidebarPanel(
      
      # User can change the range of the graph axis
      sliderInput("rangeX", "What is the range of x-axis?", -100, 100, value = c(-50, 50)),
      sliderInput("rangeY", "What is the range of y-axis?", -100, 100, value = c(-50, 50)),
      
      # User need to enter the value for a, b, c for ax2+bx+c
      h3("For ax2+bx+c, please enter the value of a, b, and c :"),
      numericInput("a_value", "Enter the value of a :", value = 1, min = -100, max = 100, step = 1),
      numericInput("b_value", "Enter the value of b :", value = 0, min = -100, max = 100, step = 1),
      numericInput("c_value", "Enter the value of c :", value = 0, min = -100, max = 100, step = 1),
      
      checkboxInput("solution", "Show/Hide Number of Solution", value = TRUE),
      checkboxInput("solutions", "Show/Hide The Solution(s)", value = TRUE),
      submitButton("submit")
      
    ),
    
    mainPanel(
      
      h3("Quadratic Function Generated"),
      plotOutput("plotGraph"),
      
      h3("Number of solution(s) : "),
      textOutput("numSolution"),
      
      h3("The Solution(s) : "),
      textOutput("solution")
      
    )
    
  )
  
))