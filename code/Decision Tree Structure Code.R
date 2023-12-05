library(tidyverse)
library(rpart)
library(rpart.plot)

set.seed(30)
train_indices <- sample(seq_len(nrow(diabetes)), size = 0.8 * nrow(diabetes))
train_data <- diabetes[train_indices, ]
test_data <- diabetes[-train_indices, ]

tree_model <- rpart(Outcome ~ Pregnancies + Glucose + BloodPressure + SkinThickness 
             + Insulin + BMI + DiabetesPedigreeFunction + Age, 
             data = train_data, method = "class")
rpart.plot(tree_model, box.palette = "auto", main = "Decision Tree Structure")
