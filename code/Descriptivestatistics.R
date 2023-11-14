exclude_vars <- c("Id", "Outcome")

subset_data <- diabetes[, !(names(diabetes) %in% exclude_vars)]

desc_stats <- data.frame(
  Variable = colnames(subset_data),
  Mean = colMeans(subset_data, na.rm = TRUE),
  SD = apply(subset_data, 2, sd, na.rm = TRUE),
  Median = apply(subset_data, 2, median, na.rm = TRUE)
)

latex_table_xtable <- xtable(desc_stats, caption = "Descriptive Statistics")

print(latex_table_xtable, include.rownames = FALSE)

