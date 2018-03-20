setwd("C:/Users/poomp/Jupyter/Stat_work/Week9")
library(readr)
week9_co2_data <- read_csv("week9_co2_data.csv")
attach(week9_co2_data)
week9_co2_data

x <- xCO2
y <- yMass

model <- lm(y ~ x)
summary(model)
plot(x,y)
abline(model)

week9_classroom_data <- read_csv("week9_classroom_data.csv")
attach(week9_classroom_data)
week9_classroom_data

x <- midterm
y <- final

model <- lm(y ~ x)
summary(model)
