library(car)
library(xtable)
diabetes$Id <- NULL

cor_matrix <- cor(diabetes[, c('Pregnancies', 'Glucose', 'BloodPressure', 'SkinThickness', 'Insulin', 'BMI', 'DiabetesPedigreeFunction', 'Age')])

print(xtable(cor_matrix, caption = "Correlation Matrix", label = "tab:correlation"), include.rownames = TRUE)

vif_data <- as.data.frame(vif(lm(Pregnancies ~ Glucose + BloodPressure + SkinThickness + Insulin + BMI + DiabetesPedigreeFunction + Age, data = diabetes)))

print(xtable(vif_data, caption = "VIF Values", label = "tab:vif"), include.rownames = TRUE)
