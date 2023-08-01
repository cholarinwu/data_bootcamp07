install.packages("readxl")
library(caret)
library(tidyverse)
library(dplyr)
library("readxl")

# Import Data
df <- read_excel("House Price India.xlsx")

# Visualize Data
ggplot(data = df, mapping = aes(x=Price)) +
  geom_boxplot()
hist(df$Price)

glimpse(df)

# Clean data
df$Price <- log(df$Price)
(range(df$Price))

colnames(df) <- c('id',
                  'date',
                  'number_of_bedrooms',
                  'number_of_bathrooms',
                  'living_area',
                  'lot_area',
                  'number_of_floors',
                  'waterfront_present',
                  'number_of_views',
                  'condition_of_the_house',
                  'grade_of_the_house',
                  'area_of_the_house(exc_basement)',
                  'area_of_the_basement',
                  'built_year',
                  'renovation_year',
                  'postal_code',
                  'lattitude',
                  'longitude',
                  'living_area_renov',
                  'lot_area_renov',
                  'number_of_schools_nearby',
                  'distance_from_the_airport',
                  'price'
                  )

# 1. Split

split_train_test <- function(data,ratio=0.7){
  set.seed(42)
  n <- nrow(data)
  id <- sample(1:n,size = ratio*n)
  train_data <- data[id, ]
  test_data <- data[-id, ]
  return( list(train=train_data,test=test_data) )
}

splitData <- split_train_test(df,0.7)
train_data <- splitData$train
test_data <- splitData$test
(nrow(train_data))
(nrow(test_data))

# 2. Train
set.seed(42)

ctrl <- trainControl(
  method = "cv",
  number = 5,
  verboseIter = TRUE
)

lm_model <- train(price ~ number_of_bedrooms + number_of_floors + built_year + number_of_views,
                  data = train_data,
                  method = "lm",
                  trControl = ctrl)

lm_model

# 3. Score

p <- predict(lm_model,
             newdata=test_data)

# 4. Evaluate
# MAE (mean absolute error), MSE (mean square error), RMSE (root mean square error)

# MAE
mae_matrix <- function(actual,predict){
  abs_error <- abs(actual - predict)
  mean(abs_error)
}

(mae_matrix(test_data$price,p))

# MSE
mse_matrix <- function(actual, predict) {
  # mean square error
  sq_error <- (actual - predict)**2
  mean(sq_error)
}

(mse_matrix(test_data$price,p))

# RMSE
rmse_matrix <- function(actual, predict) {
  # root mean square error
  sq_error <- (actual - predict)**2
  sqrt(mean(sq_error))
}

(rmse_matrix(test_data$price,p))


check <- data.frame( test_data$price,p, diff = test_data$price - p)
mean(check$diff)
View(check)
