library(tidymodels)
library(knitr)

tree_spec <- decision_tree() %>%
  set_engine("rpart") %>%
  set_mode("regression")

tree_fit <- tree_spec %>%
  fit(Outcome ~ ., data = train_data)

predictions <- tree_fit %>%
  predict(test_data) %>%
  pull(.pred)

metrics <- metric_set(rmse, rsq)
model_performance <- test_data %>%
  mutate(predictions = predictions) %>%
  metrics(truth = test_data$Outcome, estimate = predictions)

latex_table1 <- kable(model_performance, format = "latex", booktabs = TRUE)
cat(latex_table1)