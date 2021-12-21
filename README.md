# R Programming Notes
### **Written by : Muhammad Idzhans Khairi**

Learn More R by swirl :
```R
> install.packages("swirl")
> library(swirl)
> install_course("R Programming")
> swirl()
```

You can also getting help by :
* help()
* ?

## The symbol "<-" is called *assignment*.
To assign a word "hello" to a variable x, you type :
```R
> x <- "hello"
> "hello" -> x
```
To print or retrieve the value x, type :
```R
> x
> print(x)
```
To comment your command, use symbol '#' :
```R
> x <- "hello" #first time programming in R
```
The [1] indicates that your screen printout is starting at vector item number one.


## Basic Data Types
Basic classes of objects :
* Character
* Numeric
* Integer
* Complex
* Logical (true/false)
* You can refresh or clear your list of your variable by rm(list = ls())

To check which class of an object, use **class()** command :
```R
> x <- "hello"
> class(x)

> y <- 10
> class(y)
```


## Vectors
To create vector with more than 1 element, use **c()** function :
```R
#Create a vector
> apple <- c('Red', 'Green', 'Yellow')
> print(apple)
[1] "Red"  "Green"  "Yellow"
```
* NA = missing value
* NaN = not a number due to undefined mathematical operations
```R
> x <- c(1,2,3,4,NA,0/0)
> x
[1]   1   2   3   4  NA NaN

> is.na(x)
[1] FALSE FALSE FALSE FALSE  TRUE  TRUE

> is.nan(x)
[1] FALSE FALSE FALSE FALSE FALSE  TRUE

> class(x)
[1] "numeric"
```


## Matrices
To create two dimensional collection of values that all have the same type. Use **matrix()** function :
```R
> M <- matrix(c('a','a','b','c','b','a'), nrow=2, ncol=3)
> M
     [,1] [,2] [,3]
[1,] "a"  "b"  "b" 
[2,] "a"  "c"  "a" 
```


## Arrays
Arrays can be in any number of dimension. Example below is (3 X 4) dimension :
```R
> a <- array(c('blue', 'red', 'yellow'), dim = c(3,4,2))
> a

, , 1

     [,1]     [,2]     [,3]     [,4]    
[1,] "blue"   "blue"   "blue"   "blue"  
[2,] "red"    "red"    "red"    "red"   
[3,] "yellow" "yellow" "yellow" "yellow"

, , 2

     [,1]     [,2]     [,3]     [,4]    
[1,] "blue"   "blue"   "blue"   "blue"  
[2,] "red"    "red"    "red"    "red"   
[3,] "yellow" "yellow" "yellow" "yellow"
```


## Data Frames
* Meant to store tabular data
* Can use **row.names** indicate information of a data frame.
* Like matrix except each column can contain different data type. Use **data.frame()** function :
```R
# Create the data frame
BMI <- data.frame (
  gender = c("Male", "Male", "Female"),
  height = c(152, 171.5, 165),
  weight = c(81, 93, 78),
  Age = c(42, 38, 26)
)
print(BMI)

   gender height weight Age
1   Male  152.0     81  42
2   Male  171.5     93  38
3 Female  165.0     78  26
```
### Another example :
```R
> x <- 1:5
> y <- c("a", "b", "c", "d", "e")
> df <- data.frame(x, y) #To store x and y in tabular data form
> ncol(df) #To find number of columns in the data frame
> nrow(df) #To find number of rows in the data frame
> View(df) #To show the tabular data in data frames
```


## Lists
To create a vector with different classes, use **list()** :
```R
> x <- list(3, "c")
> y <- list(1, "a", TRUE, 1+4i)
> z <- list(var1 = 1:4, var2 = 0.6)

#To subset a list, you need a double square bracket :
> x[[1]]
[1] 3
> x[[2]]
[1] "c"
> z$var1
[1] 1 2 3 4
```


## Factors
* Similar to vector, except factor are limited to a fixed set of possible values.
* Always character irrespective of whether it is numeric or character or Boolean etc.
* Useful in statistical modelling
* Use **factor()** function to create factors.
* Use **nlevels()** function to gives count of levels.
```R
> apple <- c('green', 'green', 'yellow', 'red', 'red', 'red', 'green')
> factor <- factor(apple)

> factor
[1] green  green  yellow red    red    red    green 
Levels: green red yellow
> nlevels(factor)
[1] 3
```


## Subsetting
* \[ always return object of the same class. Can use to select more than one element.
* \[\[ used to extract elements of a list of data frame.
* \$ used to extract elements of a list or data frame by name.
```R
> x <- c("a", "b", "c", "c", "d", "a")
> x[1]
[1] "a"
> x[2]
[1] "b"
> x[1:4]
[1] "a" "b" "c" "c"

> u <- x > "a"
> u
[1] FALSE  TRUE  TRUE  TRUE  TRUE FALSE
> x[u]
[1] "b" "c" "c" "d"
```
```R
> BMI <- data.frame(
+   gender = c("Male", "Male", "Male"),
+   height = c(152, 171.5, 165),
+   weight = c(81, 93, 78),
+   Age = c(42, 38, 26)
+ )
> print(BMI)
  gender height weight Age
1   Male  152.0     81  42
2   Male  171.5     93  38
3   Male  165.0     78  26

> BMI$gender
[1] "Male" "Male" "Male"
> BMI$height
[1] 152.0 171.5 165.0
> BMI[[1]]
[1] "Male" "Male" "Male"
> BMI[1]
  gender
1   Male
2   Male
3   Male
```


## Mixing Objects
Object can be explicitly forced from one class to another using **as.** functions :
```R
> x <-0:6
> x
[1] 0 1 2 3 4 5 6

> class(x)
[1] "integer"
> as.numeric(x)
[1] 0 1 2 3 4 5 6
> as.logical(x)
[1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
> as.character(x)
[1] "0" "1" "2" "3" "4" "5" "6"
> as.complex(x)
[1] 0+0i 1+0i 2+0i 3+0i 4+0i 5+0i 6+0i
```


## Missing Values
* **is.na()** used to test if they are NA (missing values).
* **is.nan()** used to test for NaN (not a number).
* A NaN value is also NA but the converse is not true.
```R
> x <- c(1, 2, NA, 10, 3)
> is.na(x)
[1] FALSE FALSE  TRUE FALSE FALSE
> is.nan(x)
[1] FALSE FALSE FALSE FALSE FALSE

> x <- c(1, 2, NaN, NA, 4)
> is.na(x)
[1] FALSE FALSE  TRUE  TRUE FALSE
> is.nan(x)
[1] FALSE FALSE  TRUE FALSE FALSE
```


## Removing NA values
A common task is to remove missing values (NAs).
```R
> x <- c(1, 2, NA, 4, 5)
> bad <- is.na(x)
> x[bad]
[1] NA
> x[!bad]
[1] 1 2 4 5
> x[!is.na(x)]
[1] 1 2 4 5
```
Another example when there are multiple things :
```R
> x <- c(1, 2, NA, 4, NA, 5)
> y <- c("a", NA, "b", "d", "f", NA)

> good <- complete.cases(x)
> good
[1]  TRUE  TRUE FALSE  TRUE FALSE  TRUE

> good <- complete.cases(y)
> good
[1]  TRUE FALSE  TRUE  TRUE  TRUE FALSE

> good <- complete.cases(x, y)
> good
[1]  TRUE FALSE FALSE  TRUE FALSE FALSE

> x[good]
[1] 1 4
> y[good]
[1] "a" "d"
```


## Control Structures (If-Else and ifelse)
**Syntax :**
```R
#If-Else Condition
if(cond1 = true) {command1} else {command 2}
if(cond1 = true) {command1} else if(cond2 = true) {command2} else {command3}

if(cond1 = true){
  command1
} else if(cond2 = true){
  command2
} else {
  command3
}

#ifelse Condition
ifelse(cond, yes, no)
```


## Control Structure (for loop / repeat loop / while loop)
**Syntax :**
```R
# For Loop and few version of for loop
for('variable' in 'sequence') {expression}

x <- c("a", "b", "c", "d")

for(i in 1:4) {
  print(x[i])
}

for(letter in x){
  print(letter)
}

for(i in seq_along(x)){
  print(x[i])
}

for(i in 1:length(x)){
  print(x[i])
}


# Repeat Loop
repeat{(cond) expr}
repeat{if(i > 25) break else{print(i); i <- i +5}}
repeat{
  if(i > 25){
    break
  }
  else{
    print(i)
    i <- i + 5
  }
}
[1] 10
[1] 15
[1] 20
[1] 25


# While loop
while(condition) {expression}
```


## Control Structure (switch)
**Syntax :**
```R
switch(expression,...)

AA <- 'foo'
switch(AA, foo = {print('foo')}, bar = {print('bar')}, {print('default')})
switch(AA,
       foo = {print('foo')},
       bar = {print('bar')},
       {print('default')}
       )
[1] "foo"
```


## The paste function
The **paste** function is to paste two or more objects together.
```R
> paste("a", "b", sep = "")
[1] "ab"
> paste("a", "b", sep="***")
[1] "a***b"
> paste("a", "b", "c", sep = "***")
[1] "a***b***c"
```


## R Function
* We can create our own function which refered as **user defined functions**.
* 3 types of function :
  - Calling a function without an Argument
  - Calling a function with Arguments Values (by position and by name)
  - Calling a function with default Arguments
### Calling a function
```R
# Create a function to print squares of numbers in sequence
new.function <- function(a) {
  for(i in 1:a) {
    b <- i^2
    print(b)
  }
}

# Call the function new.function suppliying 6 as an argument.
> new.function(6)
[1] 1
[1] 4
[1] 9
[1] 16
[1] 25
[1] 36
```
### Calling a function without an Argument
```R
# Create a function without an argument
new.function <- function() {
  for(i in 1:5) {
    print(i^2)
  }
}

# Call the function without suppliying an argument
> new.function()
[1] 1
[1] 4
[1] 9
[1] 16
[1] 25
```
### Calling a function with Argument Values (by position and by name)
```R
# Create a function with arguments
new.function <- function(a, b, c) {
  result <- a * b + c
  print(result)
}

# Call the function by position of arguments
> new.function(5, 3, 11)
[1] 26

# Call the function by names of the arguments (can be done without order)
> new.function(a = 11, b = 5, c = 3)
[1] 58
```
### Calling a function with default argument
```R
# Create a function with arguments
new.function <- function(a = 3, b = 6) {
  result <- a * b
  print(result)
}

# Call the function without giving any argument
> new.function()
[1] 18

# Call the function with giving new values of the argument
> new.function(9, 5)
[1] 45
```



## Looping on the Command Line
* Alternatives to writing **for-loop** and **while-loop**
* lapply : loop over a list
* sapply : same as lapply but simplify the result
* apply  : apply a function over the margins of an array of matrix
* tapply : apply a function over subsets of a vector

### apply()
* used on apply a function to margins of an array or matrix
```R
# "2" is for row and "4" is for column
> x <- matrix(1:8, 2, 4)
> x
     [,1] [,2] [,3] [,4]
[1,]    1    3    5    7
[2,]    2    4    6    8

# "1" means the row
> apply(x, 1, mean)
[1] 4 5

# "2" means column
> apply(x, 2, mean)
[1] 1.5 3.5 5.5 7.5

> apply(x, 1, function(x) x/2)
     [,1] [,2]
[1,]  0.5    1
[2,]  1.5    2
[3,]  2.5    3
[4,]  3.5    4
```
### lapply()
* take a list, a function, and other arguments
```R
> x <- list(a=1:5, b=6:10)
> x
$a
[1] 1 2 3 4 5

$b
[1]  6  7  8  9 10

> lapply(x, mean)
$a
[1] 3

$b
[1] 8
```
```R
> x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
> x
$a
     [,1] [,2]
[1,]    1    3
[2,]    2    4

$b
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6

> lapply(x, function(x) x[,1]/2) # [row, column]
$a
[1] 0.5 1.0

$b
[1] 0.5 1.0 1.5
```
### sapply()
* Will try to simplify the result of lapply if possible
* Output of sapply will always be either a vector or matrix or list
```R
> x <- list(a = 1:5, b = 6:10)
> x
$a
[1] 1 2 3 4 5

$b
[1]  6  7  8  9 10

> lapply(x, mean)
$a
[1] 3

$b
[1] 8

> sapply(x, mean)
a b 
3 8 
```
### tapply()
* Lets you iterate over a data type called factor. Therefore, good for grouping purpose.
```R
> name <- c("ting", "ting", "ting", "chong", "chong", "chong")
> subject <- c("IT", "CS", "AI", "IT", "CS", "AI")
> marks <- c(90, 95, 80, 90, 99, 85)
> dt <- data.frame(name, subject, marks)
> dt
   name subject marks
1  ting      IT    90
2  ting      CS    95
3  ting      AI    80
4 chong      IT    90
5 chong      CS    99
6 chong      AI    85

# To get sum of marks based on name, you type :
> tapply(dt$marks, dt$name, sum)
chong  ting 
  274   265 
  
# To get mean for each subject
> tapply(dt$marks, dt$subject, mean)
  AI   CS   IT 
82.5 97.0 90.0 

# Spliting using split()
> split(dt, dt$name)
$chong
   name subject marks
4 chong      IT    90
5 chong      CS    99
6 chong      AI    85

$ting
  name subject marks
1 ting      IT    90
2 ting      CS    95
3 ting      AI    80

> split(dt, dt$subject)
$AI
   name subject marks
3  ting      AI    80
6 chong      AI    85

$CS
   name subject marks
2  ting      CS    95
5 chong      CS    99

$IT
   name subject marks
1  ting      IT    90
4 chong      IT    90
```



## Debugging
1. message
   - A generic notification/diagnostic produced by the message function
   - Execution of the function continues
2. warning
   - Indication something is wrong but not necesserily fatal
   - Execution continues
   - Generation by warning function
3. error
   - Indication fatal problem has occured
   - Execution stops
   - produced by stop function
4. condition
   - Generic concept indicationg something unexpected can occur
   - Programmers can create their own conditions.

### Debugging Tools
1. traceback
   - Prints out the function call stack after an error occurs
   - Does nothing if there's no error
2. debug
   - Flags a function for debug mode which allows you to step through execution of a function in debug mode.
3. browser
   - Suspends the execution of a function wherever it is called and puts the function in debug mode
4. trace
   - Allows you to insert debugging code into a function in specific places
5. recover
   - allows you to modify the error behavior so that you can browse the function call stack



## Shiny
- Shiny is a web application framework for R
- Shiny allows you to create a graphical interface so that users can interact with your visualizations, models, and algorithms without needed to know R themselves.
- Using Shiny, the time to create simple, yet powerful, web-based interactive data products in R is minimized.
- Shiny is made by the fine folks at R Studio.

### Some Mild Prerequisites
Shiny doesn't really require it, nut as with all web programming a little knowledge of HTML, CSS and Javascript is very helpful.

- HTML gives a webpasge structure and sectioning as well as markup instruction.
- CSS gives the style
- Javascript for interactivity

Shiny uses Bootstrap (no relation to the statistics bootstrap) style, which seems to look nice renders well on mobile platforms.

### If you're interested in learning more about HTML, CSS, and Javascript we recommend any one of the following resources :
- Mozilla Developer Network Tutorials
- HTML & CSS from Khan Academy
- Tutorials from Free Code Camp
