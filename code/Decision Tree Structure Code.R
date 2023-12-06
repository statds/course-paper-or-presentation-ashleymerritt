library(tidyverse)
library(rpart)
library(rpart.plot)

set.seed(30)
train_indices <- sample(1:(nrow(diabetes)), 0.8 * nrow(diabetes))
train_data <- diabetes[train_indices, ]
test_data <- diabetes[-train_indices, ]

tree_model <- rpart(Outcome ~ ., data = train_data, method = "class", control = rpart.control(cp = 0.01))
rpart.plot(tree_model, box.palette = "auto", main = "Decision Tree Structure")

pdf("decision_tree_plot.pdf")
rpart.plot(tree_model, box.palette = "auto", main = "Decision Tree Structure")
dev.off()

