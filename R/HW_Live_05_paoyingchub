PaoYingChub <- function() {
  
  # Define the possible moves
  moves <- c("rock", "paper", "scissors")
  
  # Get the user's move
  user_move <- readline("What is your move? (rock, paper, scissors) ")
  
  # Get the computer's move
  computer_move <- sample(moves, 1)
  
  # Determine the winner
  if (user_move == computer_move) {
    result <- "Tie"
  } else if (user_move == "rock" && computer_move == "scissors") {
    result <- "Win"
  } else if (user_move == "paper" && computer_move == "rock") {
    result <- "Win"
  } else if (user_move == "scissors" && computer_move == "paper") {
    result <- "Win"
  } else {
    result <- "Lose"
  }
  
  # Print the results
  print(paste("You chose", user_move, "and the computer chose", computer_move))
  print(result)
  
  # Keep track of the score
  score <- data.frame(
    user = 0,
    computer = 0,
    ties = 0
  )
  
  # Update the score
  score[nrow(score) + 1, ] <- c(
    ifelse(result == "Win", 1, 0),
    ifelse(result == "Lose", 1, 0),
    ifelse(result == "Tie", 1, 0)
  )
  
  # Print the score
  print(score)
  
  # Quit the game if the user wants to
  while (TRUE) {
    quit <- readline("Do you want to quit? (y/n) ")
    if (quit == "y") {
      break
    }
    
    # Get the user's move
    user_move <- readline("What is your move? (rock, paper, scissors) ")
    
    # Get the computer's move
    computer_move <- sample(moves, 1)
    
    # Determine the winner
    if (user_move == computer_move) {
      result <- "Tie"
    } else if (user_move == "rock" && computer_move == "scissors") {
      result <- "Win"
    } else if (user_move == "paper" && computer_move == "rock") {
      result <- "Win"
    } else if (user_move == "scissors" && computer_move == "paper") {
      result <- "Win"
    } else {
      result <- "Lose"
    }
    
    # Print the results
    print(paste("You chose", user_move, "and the computer chose", computer_move))
    print(result)
    
    # Update the score
    score[nrow(score) + 1, ] <- c(
      ifelse(result == "Win", 1, 0),
      ifelse(result == "Lose", 1, 0),
      ifelse(result == "Tie", 1, 0)
    )
    
    # Print the score
    print(score)
  }
  
}

PaoYingChub()
