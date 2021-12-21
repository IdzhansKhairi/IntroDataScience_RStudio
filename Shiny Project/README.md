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


## HTML Tags in Shiny
Shiny provides several wrapper functions for using standard HTML tags in your ui.R, including h1() through h6(), p(), a(), div(), and span().
- See ?builder for more details.

