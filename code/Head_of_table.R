library(xtable)
diabetes <- read.csv("/Users/ashleymerritt/Downloads/Healthcare-Diabetes 2.csv")
head_of_data <- head(diabetes)
latex_table <- xtable(head_of_data, caption = "Head of the Dataset", label = 
                        "tab:head_of_data")
print(latex_table, include.rownames = FALSE)
