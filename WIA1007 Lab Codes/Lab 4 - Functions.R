## Write a Function without an argument
function_no_arg <- function() {
  for(i in 1:7) {
    alphabet <- c("I", "D", "Z", "H", "A", "N", "S")
    print(alphabet[i], quote = FALSE)
  }
}


## Write a Function with default arguments
function_default_arg <- function(a = 1, b = 7) {
  for(i in a:b){
    alphabet <- c("I", "D", "Z", "H", "A", "N", "S", " ", "K", "H", "A", "I", "R", "I")
    print(alphabet[i], quote = FALSE)
  }
}


## Write a Function with arguments values
function_arg <- function(min, max) {
  print(paste("From the number between", min, "until", max), quote = FALSE)
  print("The Even Number that are a perfect square : ", quote = FALSE)
  
  while(min < max) {
    result <- min %% 2
    square <- sqrt(min)
    
    if(result == 0 && square %% 2 == 0) {
      print(min)
    }
    min <- min + 1
  }
}


## Write a Function my CGPA that calculate students' CGPA
myCGPA <- function(A1 = 0, A2 = 0, A3 = 0, B1 = 0, B2 = 0, B3 = 0, C1 = 0, C2 = 0, C3 = 0, D1 = 0, D2 = 0, F = 0) {
  total <- A1 + A2 + A3 + B1 + B2 + B3 + C1 + C2 + C3 + D1 + D2 + F
  
  if(total != 0) {
    A1 <- A1 * 4
    A2 <- A2 * 4
    A3 <- a3 * (3.7)
    B1 <- B1 * (3.3)
    B2 <- B2 * 3
    B3 <- B3 * (2.7)
    C1 <- C1 * (2.3)
    C2 <- C2 * 2
    C3 <- C3 * (1.7)
    D1 <- D1 * (1.3)
    D2 <- D2 * 1
    F <- F * 0
    
    totalCGPA <- A1 + A2 + A3 +B1 + B2 + B3 + C1 + C2 + C3 + D1 + D2 + F
    CGPA <- totalCGPA/total
    print(paste("Your CGPA is", CGPA))
  }
  
  else {
    print("Your CGPA is 0.00")
  }
}
