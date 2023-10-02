
library(tidyverse)
library(patchwork)
library(dplyr)

str(diamonds)

# 1: Overview of Price
f1 <- ggplot(diamonds, 
            aes(price)) + 
        geom_histogram(bins=500) + 
        theme_minimal() +
        labs(
              title = "Overview of Price",
              x = "Price [$]",
              y = "Frequency [n]",
        caption = "diamonds dataset"
        )

diamonds %>% 
  summarise(mean_price = mean(price),
            min_price = min(price),
            max_price = max(price),
            n = n())

# 2: Relation of price by "Cut Gr."
f2 <- diamonds %>%
  group_by(cut) %>%
  summarise(
    med_price = median(price)
  ) %>%
  ggplot(aes(cut, med_price, fill=cut)) +
  geom_col() + 
  theme_minimal() +
  labs(
    title = "Relation of price by 'Cut Gr.'",
    x = "Cut Gr.",
    y = "Median_Price [$]",
  caption = "diamonds dataset"
  )

diamonds %>% 
  group_by(cut) %>%
  summarise(mean_price = mean(price),
            min_price = min(price),
            max_price = max(price),
            n = n())

# 3: Relation of price by "Color Gr."
f3 <- diamonds %>%
  group_by(color) %>%
  summarise(
    med_price = median(price)
  ) %>%
  ggplot(aes(color, med_price, fill=color)) +
  geom_col() + 
  theme_minimal() +
  labs(
    title = "Relation of price by 'Color Gr.'",
    x = "Color Gr.",
    y = "Median_Price [$]",
  caption = "diamonds dataset"
  )

diamonds %>% 
  group_by(color) %>%
  summarise(mean_price = mean(price),
            min_price = min(price),
            max_price = max(price),
            n = n())

# 4: Relation of price by "Clarity Gr."
f4 <- diamonds %>%
  group_by(clarity) %>%
  summarise(
    med_price = median(price)
  ) %>%
  ggplot(aes(clarity, med_price, fill=clarity)) +
  geom_col() + 
  theme_minimal() +
  labs(
    title = "Relation of price by 'Clarity Gr.'",
    x = "Clarity Gr.",
    y = "Median_Price [$]",
    caption = "diamonds dataset"
  )

diamonds %>% 
  group_by(clarity) %>%
  summarise(mean_price = mean(price),
            min_price = min(price),
            max_price = max(price),
            n = n())

# 5: Combine 3 Factor (By Each Top 3) [Cut, Color, Clarity]
f5 <- diamonds %>% 
  filter(diamonds$cut %in% c("Premium","Fair","Very Good") &
         diamonds$color %in% c("J","I","H") &
         diamonds$clarity %in% c("SI2","SI1","VS2")
         ) %>%
  ggplot(aes(cut, price)) +
  geom_boxplot(fill="light blue") +
  facet_grid(color ~ clarity) +
  theme_minimal() +
  labs(
    title = "Combine 3 Factor [Cut, Color, Clarity]",
    x = "Cut Gr.",
    y = "Price [$]",
    caption = "diamonds dataset"
  ) + theme(axis.text.x = element_text(size = 5))

diamonds %>% 
  select (price, cut, color, clarity) %>% 
  filter(diamonds$cut == "Premium" &
           diamonds$color == "I" &
           diamonds$clarity == "VS2") %>%
  summarise(mean_price = mean(price),
            min_price = min(price),
            max_price = max(price),
            n = n())
