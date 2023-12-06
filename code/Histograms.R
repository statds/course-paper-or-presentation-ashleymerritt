library(tidymodels)
library(tidyr)

diabetes_data_long <- diabetes %>%
  pivot_longer(cols = everything(),
               names_to = "variable",
               values_to = "value")
diabetes_histograms <- ggplot(diabetes_data_long, aes(x = value)) +
  geom_histogram(bins = 30, color = "blue", fill = "lightblue") +
  facet_wrap(~variable, scales = "free", ncol = 4) +
  labs(title = "Histograms of Variables in Diabetes Dataset",
       x = "Value",
       y = "Frequency") + 
  theme_minimal()

print(diabetes_histograms)