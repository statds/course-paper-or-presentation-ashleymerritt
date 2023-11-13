library(xtable)

set.seed(123)
index <- sample(seq_len(nrow(diabetes)), size = 0.8 * nrow(diabetes))

train_data <- diabetes[index, ]
test_data <- diabetes[-index, ]

logistic_model <- glm(Outcome ~ ., data = train_data, family = "binomial")

summary_info <- summary(logistic_model)$coefficients[, c("Estimate", "Std. Error", "z value", "Pr(>|z|)")]

predictor_labels <- data.frame(
  Predictor = names(coef(logistic_model))
)

summary_df <- cbind(predictor_labels, summary_info)

latex_table <- xtable(summary_df)

print(latex_table, include.rownames = FALSE)
