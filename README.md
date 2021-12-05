# R Programming Notes

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
