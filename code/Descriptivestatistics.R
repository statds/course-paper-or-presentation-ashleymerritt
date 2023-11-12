desc_stats <- data.frame(
  Variable = colnames(diabetes),
  Mean = colMeans(diabetes, na.rm = TRUE),
  SD = apply(diabetes, 2, sd, na.rm = TRUE),
  Median = apply(diabetes, 2, median, na.rm = TRUE)
)

latex_table_xtable <- xtable(desc_stats, caption = "Descriptive Statistics")

print(latex_table_xtable, include.rownames = FALSE)

