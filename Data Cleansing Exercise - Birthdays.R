## BIRTHDAYS - DATA CLEANSING EXERCISE

# At the beginning of the year, the TAs filled out a questionnaire about themselves. Unfortunantely, they failed to specify a standard date format, so they all entered their birthdays in different ways.
# Today, we will clean the birthdays so they can be easily processed and worked with in R

library(lubridate)
library(stringr)
library(dplyr)

tas <- read.csv("https://cs.brown.edu/courses/cs100/studios/data/5/birthdays.csv", stringsAsFactors = FALSE)
tas    # To print and display the data.


# Notice that we don't know one of the birthday. So we remove them using na.omit() function
tas <- na.omit(tas)
tas    # Print to see that NA value is removed


# Combining the birthdate and birthyear
fullbirthday <- paste(tas$Birthdate, tas$Birthyear)
fulbirthday   # See how it has been combined


# Notice that the fullbirthday is so messy with different entry and not standardize. Standardize birthday formats using str_replace()
# Standardize one by one into yyyymmdd with no spaces

bd <- str_replace(fullbirthday, "3.10 1998", "19981003")
bd

bd <- str_replace(bd, "31-May 1996", "19960531")  # Replace fullbirthday with bd so that the variable was kept
bd

bd <- str_replace(bd, "August 29th 1998", "19980829")
bd

bd <- str_replace(bd, "Sept. 20 1998", "19980920")
bd

bd <- str_replace(bd, "June 11th 1998", "19980611")
bd

bd <- str_replace(bd, "4/26 1999", "19990426")
bd

bd <- str_replace(bd, "16-Nov 1997", "19971116")
bd

bd <- str_replace(bd, "Dec 18 1997", "19971218")
bd

bd <- str_replace(bd, "November 3rd 1997", "19971103")
bd


# ymd function takes in a vector of strings and converts each string to a Date
birthdays <- ymd(bd)

# Add the 'birthdays' vector to your 'tas' data frame as a new variable, "Birthdays".
tas$birthdays <- birthdays

# Now your data is clean! Now we can calculate the mean age of the TAs. Use today() function.
tas$age <- (today() - tas%birthdays)/365    # Adding new for age column
mean(tas$age)                               # Calculate mean for age


# Joon is a former CS100 TA. Joon's birthday is April 10th 1993. Insert Joon into data frame using rbind() function and recalculate average age.
joon <- c("Joon", "1993-04-10")
tas <- rbind(tas, joon)
tas$age <- (today() - tas$birthdays)/365


# To save the clean data as an csv file :
filename_csv <- paste("cleanBirthdays", today(), ".csv", sep = " ")
write.csv(tas, file = filename_csv)

# To save the clean data as an rds file :
# '.rds' is R's unique data format.
# Benefits using '.rds' is that it can preserve the variables' data types as well so that nothing will have to be converted from one type to another.
filename_rds <- paste("cleanBirthdays", today(), ".rds", sep = " ")
saveRDS(tas, file = filename_rds)
