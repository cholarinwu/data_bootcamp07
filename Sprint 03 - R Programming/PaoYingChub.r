testbot <- function() {
    
    cat("Welcome to PaoYingChup 1.0\n")
    cat("Today is",as.character(Sys.Date()),"\n\n")
    cat("To play the game, you have 3 options: \nType 'r' for rock, 'p' for paper, 's' for scissor.\n")
    cat("If you wish to stop, type 'quit'.\n")
    
    options <- c("r","p","s")
    user_pts <- 0
    bot_pts <- 0
    count <- -1

    while (TRUE) {
        cat("\n-----------------------------\n")
        cat("Choose your option: ")
        user_input <- readLines("stdin",1)
        bot_input <- sample(options,1)
        count <- count + 1
        
        if (user_input == "quit"){
          cat("\n==================================\n")
          cat("You've played a total of",count,"rounds.\n")
          cat("Opponent's total score:", bot_pts,"\n")
          cat("Your total score:", user_pts,"\n")
          cat("==================================\n")
          cat("Thank you for playing.")
          break
        } 
        
        # If user tied with bot
        else if(user_input == bot_input) {
                if (user_input == 'r'){
                  cat("\nYou both picked 'rock'. ")
                } else if (user_input == 'p'){
                  cat("\nYou both picked 'paper'. ")
                } else {
                  cat("\nYou both picked 'scissor'. ")
                }
                cat("It's a tie!")
        } 
        
        # If user picked "Rock"
        else if(user_input == 'r') {
            if (bot_input == 's') {
                user_pts <- user_pts + 1
                cat("\nYou picked 'rock'. ")
                cat("Bot picked 'scissor'. ")
                cat("You won!")
            } else if (bot_input == 'p') {
                bot_pts <- bot_pts + 1
                cat("\nYou picked 'rock'. ")
                cat("Bot picked 'paper'. ")
                cat("You lose.")
            } else {}
        } 
        
        # If user picked "Paper"
        else if(user_input == 'p') {
            if (bot_input == 'r') {
                cat("\nYou picked 'paper'. ")
                cat("Bot picked 'rock'. ")
                user_pts <- user_pts + 1
                cat("You won!")
            } else if (bot_input == 's') {
                bot_pts <- bot_pts + 1
                cat("\nYou picked 'paper'. ")
                cat("Bot picked 'scissor'. ")
                cat("You lose.")
            } else {}
        } 
        
        # If user picked "Scissor"
        else if(user_input == 's') {
            if (bot_input == 'p') {
                user_pts <- user_pts + 1
                cat("\nYou picked 'scissor'. ")
                cat("Bot picked 'paper'. ")
                cat("You won!")
            } else if (bot_input == 'r') {
                bot_pts <- bot_pts + 1
                cat("\nYou picked 'scissor'. ")
                cat("Bot picked 'rock'. ")
                cat("You lose.")
            } else {}
        }

        else {
            cat("\nThat's not one of the option. \n\n\tPlease choose one of these three options:\n\t'r' (rock), 'p' (paper), or 's' (scissor).\n\n\tOr if you wish to stop, type 'quit'.\n")
          count <- count - 1
        }


    }
}
testbot()
