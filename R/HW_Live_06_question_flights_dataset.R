## HW 1 : 5 Question ask about flights dataset
library(nycflights13)
library(tidyverse)

View(flights)
View(airlines)
glimpse(flights)

# 1.Which day has the most flights ? & How Many flights ?
  flights %>% 
      group_by(month) %>% 
      count(day) %>% 
      arrange(-n) %>% 
      head(1)
  
# 2.Which route has the longest flight ?
  flights %>%
     select(origin, dest, distance) %>%
     arrange(-distance) %>%
     head(1)

# 3.Which plane has taken flight the most ?
  flights %>% 
    count(tailnum) %>% 
    arrange(-n) %>% 
    drop_na(tailnum) %>%
    head(1)

# 4.Whose service is the most delayed ?
  flights %>% 
   group_by(carrier) %>% 
   drop_na(dep_delay) %>% drop_na(arr_delay) %>%
   summarise(total_delay = sum(dep_delay) + sum(arr_delay)) %>%
   arrange(-total_delay) %>% 
   head(5) %>%
   left_join(airlines, by="carrier")

# 5.Which route is the most popular ?
  flights %>% 
    mutate(Route = paste(origin,"=>",dest)) %>% 
    select(Route) %>% 
    count(Route) %>% 
    arrange(-n) %>% 
    head(5)
  
