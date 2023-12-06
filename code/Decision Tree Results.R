library(knitr)

predictions <- predict(tree_model, test_data, type = "class")
conf_matrix <- table(test_data$Outcome, predictions)
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
precision <- conf_matrix[2, 2] / sum(conf_matrix[, 2])
recall <- conf_matrix[2, 2] / sum(conf_matrix[2, ])
f1_score <- 2 * (precision * recall) / (precision + recall)

metrics_df <- data.frame( Metric = c("Accuracy", "Precision", "Recall",
                                     "F1 Score"), Value = c(round(accuracy,
                                                                  2),
                                                            round(precision, 2),
                                                            round(recall, 2),
                                                            round(f1_score, 2))
                          )
latex_code <- knitr::kable(metrics_df, format = "latex", col.names = c("Metric", "Value"), booktabs = TRUE, escape = FALSE)
cat(latex_code)





