testbot <- function() {
  cat("Welcome to Testbot 1.0\n")
  cat("Please register by typing your information below:\n")
  cat("First name: ")
  fname <- readLines("stdin",1)
  cat("Last name: ")
  lname <- readLines("stdin",1)
  cat("Email: ")
  email <- readLines("stdin",1)

  cat("Let's begin the test. Are you ready? [Y/N]: ")
  input <- readLines("stdin",1)
  score <- 0
  if (input == "Y"){
      cat("\n1. Which of the following is correct (1 pt):\n
          a) Dolphin is a mammal\n
          b) Duck can't fly\n
          c) Human beings have been alive for 10 million years\n
          d) Koala is a bear\n
          Ans: ")
      ans1 <- readLines("stdin",1)

      cat("\n2. Who wrote the novel 'To Kill a Mockingbird'? (1 pt)\n
          a) F. Scott Fitzgerald\n
          b) Ernest Hemingway\n
          c) Harper Lee\n
          d) J.D. Salinger\n
          Ans: ")
      ans2 <- readLines("stdin",1)

      cat("\n3. What is the formula for calculating the area of a rectangle? (1 pt)\n
          a) length x width\n
          b) length + width\n
          c) length \ width\n
          d) length - width\n
          Ans: ")
      ans3 <- readLines("stdin",1)
                       
      cat("\n4. Which planet is closest to the sun? (1 pt)\n
          a) Mars\n
          b) Venus\n
          c) Earth\n
          d) Mercury\n
          Ans: ")
      ans4 <- readLines("stdin",1)

      cat("\n5. What is the name of the process by which plants convert sunlight into energy? (1 pt)\n
          a) Photosynthesis\n
          b) Respiration\n
          c) Digestion\n
          d) Fermentation\n
          Ans: ")
      ans5 <- readLines("stdin",1)
          
    # Score calculation
          
      if (ans1 == 'a'){
        score <- score + 1
      } else {} 
      if (ans2 == 'c'){
        score <- score + 1
      } else {}
      if (ans1 == 'a'){
        score <- score + 1
      } else {}
      if (ans1 == 'd'){
        score <- score + 1
      } else {}
      if (ans1 == 'a'){
        score <- score + 1
      } else {}
      cat("\n\nYou scored",score,"out of 5.\nThank you for using our bot.")
  } else {
          cat("Alright, we'll see you next time.")
  }
}
testbot()
