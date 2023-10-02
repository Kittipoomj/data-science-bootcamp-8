chatbot_pizza_order <- function() {

## Create a function to get the user's pizza order
pizza_order <- function() {
  # Get the user's pizza size
  size <- readline("What size pizza would you like? (small, medium, large): ")
  
  # Get the user's pizza menu
  menu <- readline("What menu would you like ? 
                   (seafoodcocktail, hawaiian, tomyumkung, superdeluxe, doublecheese): ")
  
  # Return the user's pizza order
  return(paste(size, menu))
}


# Create a function to get the price of a pizza
pizza_price <- function(order) {
  # Get the price of the pizza
  price <- switch(order,
                  "small seafoodcocktail" = 100,
                  "small hawaiian" = 120,
                  "small tomyumkung" = 140,
                  "small superdeluxe" = 160,
                  "small doublecheese" = 180,
                  "medium seafoodcocktail" = 150,
                  "medium hawaiian" = 170,
                  "medium tomyumkung" = 190,
                  "medium superdeluxe" = 210,
                  "medium doublecheese" = 230,
                  "large seafood cocktail" = 200,
                  "large hawaiian" = 220,
                  "large tomyumkung" = 240,
                  "large superdeluxe" = 260,
                  "large doublecheese" = 280)
  
  # Return the price of the pizza
  return(price)
}


## Start the chatbot
while(TRUE) {
  # Get the user's pizza order
  order <- pizza_order()
  
  # Get the price of the user's pizza order
  price <- pizza_price(order)
  
  # Print the user's pizza order and price
  print(paste("Your pizza order is", order, "and the price is", price))
  
  # Ask the user if they want to order another pizza
  another_order <- readline("Would you like to order another pizza? (y/n): ")
  
  # If the user says no, end the chatbot
  if(another_order == "n") {
    break
  }
}

}

chatbot_pizza_order()
