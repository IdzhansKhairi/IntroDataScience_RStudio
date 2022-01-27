library(ggplot2)
library(tidyverse)

# Data set
testCalories <- data.frame(
  DAY = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"),
  CALORIES = c(1400, 3000, 3500, 2600, 4000, 2900, 2900)
)

testBurned <- data.frame(
  DAY = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"),
  BURNED = c(500, 480, 200, 900, 550, 140, 700)
)


testWeight <- data.frame(
  DAY = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"),
  WEIGHT = c(90, 92, 89, 88, 85, 79, 85)
)

# Merge all data together
totalData <- mutate(testCalories, BURNED = testBurned$BURNED, WEIGHT = testWeight$WEIGHT)
totalData$DAY <- factor(totalData$DAY, levels=unique(totalData$DAY))

# Plotting Graph
plt <- ggplot(totalData, aes(x = DAY, group = 3)) +
        geom_point(aes(y = CALORIES)) +
        geom_point(aes(y = BURNED)) +
        geom_point(aes(y = WEIGHT * 40)) +
        geom_line(aes(y = CALORIES), color = "green", size = 1, linetype = 1) +
        geom_line(aes(y = BURNED), color = "red", size = 1, linetype = 2) +
        geom_line(aes(y = WEIGHT * 40), color = "blue", size = 1, linetype = 3) +
  
        scale_y_continuous(name = "Calories",
                           sec.axis = sec_axis(~./40, name = "Weight (kg)")) +
  
        ggtitle("Your Progress Overall Graph") +
        scale_color_manual(values = c())
  
        #legend(1, legend = c("Calories Consumed", "Calories Burned", "Your Weight"), col = c("green", "red", "blue"))

plt


