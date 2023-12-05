library(rpart)
library(rpart.plot)
library(gplots)

predictions <- predict(tree_model, test_data, type = "class")
conf_matrix <- table(Actual = test_data$Outcome, Predicted = predictions)
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)

conf_matrix <- table(predictions, test_data$Outcome)
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)

cat("\\begin{table}[h]\n")
cat("\\centering\n")
print(xtable(conf_matrix, caption = "Confusion Matrix", label = "tab:conf_matrix", add.to.row = list(pos = c(-1, 0, nrow(conf_matrix) + 1), command = c("\\toprule ", "\\midrule ", "\\bottomrule ")), digits = 0), include.rownames = TRUE, booktabs = TRUE)
cat("\\end{table}\n")


