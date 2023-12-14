predictions <- predict(tree_model, newdata = test_data, type = "class")

test_data$Outcome <- factor(test_data$Outcome, levels = levels(predictions))

conf_matrix <- table(Actual = test_data$Outcome, Predicted = predictions)

library(ggplot2)
ggplot(as.data.frame.table(conf_matrix), aes(x = Actual, y = Predicted, fill = Freq)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "blue") +
  geom_text(aes(label = Freq), vjust = 1) +
  labs(x = "Actual Outcome", y = "Predicted Outcome")


