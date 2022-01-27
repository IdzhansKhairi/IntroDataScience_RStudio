library(rvest)
library(dplyr)
library(ggplot2)

## Collecting information on the prices and the 
# Data From Hotels.com
data_hotels <- data.frame(
  Hotels = c("The Datai", "The Danna", "Ambong Ambong", "Casa del Mar,", "Four Season Resort",
             "The Ritz - Carlton,", "The St. Regis", "The Westin Resort", "Pelangi Beach Resort & Spa"),
  Price = c(1380, 990, 491, 920, 1151, 1150, 1150, 373, 522)
)

# Data from expedia.com
data_expedia <- data.frame(
  Hotels = c("The Datai", "The Danna", "Ambong Ambong", "Casa del Mar,", "Four Season Resort",
             "The Ritz - Carlton,", "The St. Regis", "The Westin Resort", "Pelangi Beach Resort & Spa"),
  Price = c(1980, 1505, 853, 920, 2037, 1850, 1750, 625, 642)
)

# Data from agoda.com
data_agoda <- data.frame(
  Hotels = c("The Datai", "The Danna", "Ambong Ambong", "Casa del Mar,", "Four Season Resort",
             "The Ritz - Carlton,", "The St. Regis", "The Westin Resort", "Pelangi Beach Resort & Spa"),
  Price = c(2180, 1715, 444, 789, 1047, 1250, 1250, 536, 582)
)

## Now we are going to plot the prices of the hotels accoring to their respective Website











