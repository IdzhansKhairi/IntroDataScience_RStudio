## LAB 6 - CODEBOOK


## Creating Codebook using standard R API functionally

install.packages("memisc")
library(memisc)

x <- data.set(Orange) # cast the data to R dataset
typeof(x)             # to know thw type of data of x
x                     # call x and display and print x
codebook(x)           # call the codebook function



## Manually create a custom codebook

# Using class function to determine the data type.
# Using sapply function to extract more details.
# Using the Orange dataset supplied with R Studio.

x <- data.set(Orange)
class(Orange)

sapply(Orange, class)  # To know the class in the orange data set
sapply(Orange, min)    # To know the minimum value in the data set
sapply(Orange, max)    # To know the maximum value in the data set
sapply(Orange, range)  # To know the range of the data set

summary(Orange)



## ----------------- Creating my own codebook ---------------------------

# Creating Codebook by using codebook function

y <- data.set(iris)
typeof(y)           # To know the type of the whole data set
y                   # To print and display data set y
codebook(y)         # Creating a Codebook by using codebook() function
summary(y)          # Showing an overview of the data set


# Creating codebook manually

y <- data.set(iris)
typeof(y)

lapply(iris, class)    # Get to know the class of each column
sapply(iris, typeof)   # Get to know type of data in each column
sapply(y, measurement) # Get to know the measurement of each column in data set
sapply(y, mean)        # Get to know the mean of each different column
sapply(y, StdDev)      # Get to know the standard deviation of each column
summary(iris)          # Get the overview of the data set













