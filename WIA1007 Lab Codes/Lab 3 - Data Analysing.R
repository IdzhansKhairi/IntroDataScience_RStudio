## LAB 3 WIA1007 - ANALYSE DATASET


## Assign dataset in a vvariable
L3 <- read.csv(Lab3_Data)

## Read and show dataset
print(L3)
L3

## Show column names
colnames(L3)

## To know the size of the table with the functions that prints its dimension.(Rows x Columns)
dim(L3)

## Show numbers of row
nrow(L3)

## Show number of column
length(L3)
ncol(L3)

## To check the structure of dataset
str(L3)

## Provide Standard statistical output for each column
summary(L3)


## Extract upper row in dataset and prints them

head(L3)     # Default - Show the first 6 rows

head(L3, 2)  # Show the first 2 rows

head(L3, -1) # Show all rows except last row


## Extraxt lower row in dataset and prints them

tail(L3)     # Default - Show the last 6 rows

tail(L3, 2)  # Show the last two rows

tail(L3, -1) # Show all rows except first row


## Value of Ozone in 47th row
L3[43, "Ozone"]


## Missing value in the ozone column

is.na(L3[ , "Ozone"])      # To test if there's is NA value

sum(is.na(L3[ , "Ozone"])) # Count the numbers of NA values in Ozone column

sum(is.na(L3))             # Count number of NA values in dataset

colSums(is.na(L3))         # Count number of NA values in dataset for each column

rowSums(is.na(L3))         # Count number of NA values in dataset for each row


## Calculate mean in Ozone column without NA value
mean(na.omit(L3[ , "Ozone"]))

## mean Solar.R value of subset with "Ozone > 31" and "Temp > 90"
subsetsolar <- subset(L3, Ozone > 31 & Temp > 90, select = Solar.R)
mean(subsetsolar[ , "Solar.R"], na.rm = TRUE)   # na.rm is to remove NA value
mean(subsetsolar$Solar.R)

## Data type of month column
typeof(L3[ , "Month"])

## Mean of temp when month is 6
subsetmonth <- subset(L3, Month == 6, select = Temp)
mean(subsetmonth[ , "Temp"], na.rm = TRUE)
mean(subsetmonth$Temp)

# Maximum ozone value in the month of May
subsetozone <- subset(L3, Month == 5, select = Ozone)
max(subsetozone[ , "Ozone"], na.rm = TRUE)
min(subsetozone[ , "Ozone"], na.rm = TRUE)
mean(subsetozone[ , "Ozone"], na.rm = TRUE)

