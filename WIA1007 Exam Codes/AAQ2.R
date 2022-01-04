
## Create a data frame based on given information in the question
dataset <- data.frame (
  
  Ticket_Status = c("Solved", "Open", "Reopened", "Deleted", "Unassigned",
                     "Escalated"),
  Percentage = c(45.5, 39.5, 6.5, 2.6, 2.0, 3.9)
  
)

print(dataset)


## Create an contemporary chart (Advance Chart) - Lollipop Plot
library(ggplot2)

dataset %>% ggplot(aes(x=Ticket_Status, y=Percentage, ymax = 100)) + 
  geom_point(size = 3, colour = "Purple") + 
  geom_segment( aes(x=Ticket_Status, xend=Ticket_Status, y=0, yend=Percentage)) +
  labs(title = "Helpdesk tickets percentages based on their status", y = "Percentage (%)", x = "Ticket Status")
