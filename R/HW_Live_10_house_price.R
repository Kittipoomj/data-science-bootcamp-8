library(caret)
library(tidyverse)
library(readxl)
library(ggplot2)
library(dplyr)
library(lmtest)


# Import excel file
df_Y2016 <- read_excel("House Price India.xlsx", sheet=1)


# Select Parameter for study
lm_model_checkoverall <- train(Price ~ . , 
                         data=df_Y2016,
                         method="lm")

lm_model_checkoverall

lm_model_checkoverall$finalModel

varImp(lm_model_checkoverall)


  ## Select top 5 of Significant Parameter
  ## waterfront present / living area / grade of the house/ Built Year / number of bedrooms
  ## Even if, id is first effect but actually in my view show not related. [So not select]


# Simplify Parameter Name
study_df <- df_Y2016 %>% select ( 
                          "waterfront" = "waterfront present",
                          "living_area" = "living area" ,
                          "grade_house" = "grade of the house",
                          "built_year" = "Built Year",
                          "bedrooms" = "number of bedrooms",
                          "Price"
)

# Add Column Log Price
study_df <- study_df %>% mutate(log_price = log(Price))


# 1: split data 80% train, 20% test

split_data <- function(df) {
  set.seed(42)
  n <- nrow(df)
  train_id <- sample(1:n, size = 0.8*n)
  train_df <- df[train_id, ]
  test_df <- df[-train_id, ]
  return( list(training = train_df, 
               testing = test_df) )
}

prep_data <- split_data(study_df)
train_df <- prep_data[[1]]
test_df <- prep_data[[2]]


# 2.1: train model [Normal Method]

lm_model <- train(Price ~ waterfront + living_area + grade_house + built_year + bedrooms , 
                  data=train_df,
                  method="lm")

lm_model


# 2.2: train model [Take Log Method]

lm_model_log <- train(log_price ~ waterfront + living_area + grade_house + built_year + bedrooms , 
                      data=train_df,
                      method="lm")

lm_model_log


# 3.1: score model [Normal Method]

p <- predict(lm_model, newdata=test_df)


# 3.2: score model [Take Log Method]

p_log <- predict(lm_model_log, newdata=test_df)


# 4.1: evaluate model [Normal Method]

  ## mean absolute error
     (mae <- mean(abs(p - test_df$Price)))

  ## root mean square error
     (rmse <- sqrt(mean((p - test_df$Price)**2)))


# 4.2: evaluate model [Take Log Method] (Test Data)

  ## mean absolute error
     (mae_log_test = mean(abs(exp(p_log) - exp(test_df$log_price))))

  ## root mean square error
     (rmse_log_test = sqrt( mean((exp(p_log) - exp(test_df$log_price))**2)))


# 4.3: evaluate model [Take Log Method] (Train Data)
      
     p_train <- predict(lm_model_log, newdata=train_df)


  ## mean absolute error
     (mae_log_train = mean(abs(exp(p_train) - exp(train_df$log_price))))

  ## root mean square error
     (rmse_log_train = sqrt( mean((exp(p_train) - exp(train_df$log_price))**2)))



# 5: Compare Result

## Normal Method with 5 Parameter
print(lm_model)
print(mae)
print(rmse)

## Take Log Method with 5 Parameter
print(lm_model_log)
print(mae_log_test)
print(rmse_log_test)
print(mae_log_train)
print(rmse_log_train)
