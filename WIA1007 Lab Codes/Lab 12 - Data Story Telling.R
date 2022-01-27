# LAB 12 - DATA STORY


library(dplyr)
library(ggplot2)
library(fmsb)

# Read CSV file of Spotify
spotifyData <- read.csv("C:/Users/Idzhans Khairi/Documents/FSKTM/Sem 1/(WIA1007) Introduction to Data Science/Lab/R_Programming/WIA1007 Data Set/SpotifyFeatures.csv")
spotifyData <- data.frame(spotifyData)
View(spotifyData)

# Remove unnecessary column
spotifyData2 <- select(spotifyData, "ï..genre", "popularity")
spotifyData2 <- data.frame(spotifyData2)
View(spotifyData2)

# Find the sum of a genre popularity in the data set
popularity <- aggregate(spotifyData2$popularity, list(spotifyData2$ï..genre), sum)
total <- sum(spotifyData2$popularity)
colnames(popularity) <- c("Genre", "Popularity")      # Change Name
popularity <- popularity[ -c(6),]                     # Remove uneccessory row

# Calculate percentage
popularity$Popularity <- popularity$Popularity/total
popularity$Popularity <- popularity$Popularity * 105
View(popularity)

# Plotting the graph
ggplot(popularity, aes(x=Genre, y=Popularity)) +  
  geom_bar(stat="identity", fill=alpha("skyblue", 0.7)) +  # This add the bars with a blue color
  ylim(-1,7) +
  
  # This makes the coordinate polar instead of cartesian.
  coord_polar(start = 0)
  



  



