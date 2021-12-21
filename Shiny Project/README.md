# R Studio Shiny

## Shiny
- Shiny is a web application framework for R
- Shiny allows you to create a graphical interface so that users can interact with your visualizations, models, and algorithms without needed to know R themselves.
- Using Shiny, the time to create simple, yet powerful, web-based interactive data products in R is minimized.
- Shiny is made by the fine folks at R Studio.


## Some Mild Prerequisites
Shiny doesn't really require it, nut as with all web programming a little knowledge of HTML, CSS and Javascript is very helpful.

- HTML gives a webpasge structure and sectioning as well as markup instruction.
- CSS gives the style
- Javascript for interactivity

Shiny uses Bootstrap (no relation to the statistics bootstrap) style, which seems to look nice renders well on mobile platforms.


## If you're interested in learning more about HTML, CSS, and Javascript we recommend any one of the following resources :
- Mozilla Developer Network Tutorials
- HTML & CSS from Khan Academy
- Tutorials from Free Code Camp


## Getting Started
- Make sure you have the latest release of R installed.
- If on Windows, make sure that you have Rtools installed.
```R
install.packages("shiny")
library(shiny)
```
- Great tutorial at https://shiny.rstudio.com/tutorial/
- Basically, this notes is walking through that tutorial offering some of our insights.


## A Shiny Project
A shiny project is a directory containing at least two files :
- ui.R (for user interface) controls how your app looks.
- server.R that controls what your app does.
### Sample Code :
```R
# Intro to Shiny Apps
library(shiny)

shinyUI(fluidPage( 

    titlePanel("Data Science FTW"), # Application title

    sidebarLayout(
        sidebarPanel(
            h3("Siderbar Text")
        ),

        mainPanel(
            h3("Main Panel Text")
        )
    )
))
```
### Sample Output :
![Intro To Shiny](https://github.com/IdzhansKhairi/IntroDataScience_RStudio/blob/main/Shiny%20Project/Media/Shiny%20Practice%201.png)

## HTML Tags in Shiny
Shiny provides several wrapper functions for using standard HTML tags in your ui.R, including h1() through h6(), p(), a(), div(), and span().
- See ?builder for more details.

### Sample Code :
```R
#HTML Tags

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("HTML Tags"),
  
  sidebarLayout(
    sidebarPanel(
      h1("H1 Text"),
      h2("H2 Text"),
      h3("H3 Text"),
      em("Emphasized Text")
    ),
    
    mainPanel(
      h3("Main Panel Text"),
      code("Some Code!")
    )
  )
))
```
### Sample Output
![HTML Tags](https://github.com/IdzhansKhairi/IntroDataScience_RStudio/blob/main/Shiny%20Project/Media/Shiny%20Practice%202.png)


## App with Inputs and Outputs
- Shiny provides several types of inputs including buttons, checkboxes, text boxes, and calendars.
- First let's experiment with the slider input.
- This simple app will display number that is slected with a slider.

### Sample Code (ui.R) :
```R
# Slider App

library(shiny)

shinyUI(fluidPage(
  titlePanel("Slider App"),
  
  sidebarLayout(
    sidebarPanel(
      h1("Move the slider!"),
      sliderInput("slider2", "Slider Me !", 0, 100, 0)
    ),
    mainPanel(
      h3("Slider Value : "),
      textOutput("text1")
    )
  )
  
))
```
### Sample Code (server.R)
```R
library(shiny)

shinyServer(function(input, output) {
  
  #Take input from ui.R form slider2
  #Display the output as text1
  output$text1 = renderText(input$slider2 + 10) #+10 is used to manipulate the output as in figure
  
})
```
### Sample Output
As we can see in the figure below, when the input is 42, the display output is 52.
![Slider App](https://github.com/IdzhansKhairi/IntroDataScience_RStudio/blob/main/Shiny%20Project/Media/Shiny%20Practice%203.png)


## Apps with Plots
- Allowing users to manipulate data and to see the results of their manipulation as a plot can be very useful.
- Shiny provides the plotOutput() function for **ui.R** and the renderPlot() function for **server.R** for taking user input and creating plots.

### Sample Code (ui.R) :
```R
# Plot Random Numbers

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Plot Random Numbers"),
  
  sidebarLayout(
    sidebarPanel(
      # Step size is little buttons how much you steps
      numericInput("numberic", "How Many Random Numbers Should be Plotted?",
                   value = 1000, min = 1, max = 1000, step = 1),
      # 2 values allow for max and min
      sliderInput("sliderX", "Pick Minimum and Maximum X Values",
                  -100, 100, value = c(-50, 50)),
      
      sliderInput("sliderY", "Pick Minimum and Maximum Y Values",
                  -100, 100, value = c(-50, 50)),
      
      checkboxInput("show_xlab", "Show/Hide X Axis Label", value = TRUE),
      checkboxInput("show_ylab", "Show/Hide Y Axis Label", value = TRUE),
      checkboxInput("show_title", "Show/Hide Title"),
    ),
    mainPanel(
      h3("Graph of Random Points"),
      plotOutput("plot1")
    )
  )
  
))
```
### Sample Code (server.R) :
```R
library(shiny)

shinyServer(function(input, output) {
  #Because it is plot, the statement is renderPlot()
  output$plot1 <- rederPlot ({
    set.seed(2016-05-25)
    number_of_points <- input$numeric 
    
    minX <- input$sliderX[1] #As a vector
    maxX <- input$sliderX[2]
    minY <- input$sliderY[1]
    maxY <- input$sliderY[2]
    
    dataX <- runif(number_of_points, minX, maxY)
    dataY <- runif(number_of_points, minY, maxY)
    
    # If there's input, it will show the label
    xlab <- ifelse(input$show_xlab, "X Axis", "")
    ylab <- ifelse(input$show_ylab, "Y Axis", "")
    main <- ifelse(input$show_title, "Title", "")
    
   #xlim = x limit
    plot(dataX, dataY, xlab = xlab, ylab = ylab, main = main,
         xlim = c(-100, 100), ylim = c(-100, 100))
  })
  
})
```
### Sample Output :
![Plot Random Numbers](https://github.com/IdzhansKhairi/IntroDataScience_RStudio/blob/main/Shiny%20Project/Media/Shiny%20Practice%204.png)


## Reactivity
- Is like a recipie that manipulates inputs from Shiny and then returns a value.
- Provides a way for your app to respond since inputs will change depending on how users interact with your user interface.
- Expression wrapped by a reactive() should be expressios that are subject to change.

