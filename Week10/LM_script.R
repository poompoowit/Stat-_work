setwd("C:/Users/poomp/Jupyter/Stat_work/Week10")
library(readr)
mydata <- read.csv("cars.csv", sep=",", header=T, fileEncoding="UTF-8-BOM")
attach(mydata)
mydata

x <- cbind(c(rep(1,6)),mydata[,3],mydata[,5])
y <- matrix(mydata[,2],6)

ans = solve(t(x)%*%x)%*%t(x)%*%y
ans

model <- lm(hp ~ liters + premium1)
summary(model)

mydata <- read.csv("foodStore1.csv", sep=",", header=T, fileEncoding="UTF-8-BOM")
attach(mydata)
mydata
x <- cbind(c(rep(1,11)),mydata[,2],mydata[,3],mydata[,4],mydata[,5],mydata[,6])
y <- matrix(mydata[,1],11)
ans = solve(t(x)%*%x)%*%t(x)%*%y
ans
model <- lm(Calories ~ Fat + Sodium + Carb + Fiber + Protein)
summary(model)

mydata <- read.csv("foodStore2.csv", sep=",", header=T, fileEncoding="UTF-8-BOM")
attach(mydata)
mydata
x <- cbind(c(rep(1,11)),mydata[,2],mydata[,3],mydata[,4],mydata[,5],mydata[,6])
y <- matrix(mydata[,1],11)
ans = solve(t(x)%*%x)%*%t(x)%*%y
ans
model <- lm(Calories ~ Fat + Sodium + Carb + Fiber + Protein)
summary(model)

mydata <- read.csv("foodStore3.csv", sep=",", header=T, fileEncoding="UTF-8-BOM")
attach(mydata)
mydata
x <- cbind(c(rep(1,11)),mydata[,2],mydata[,3],mydata[,4],mydata[,5],mydata[,6])
y <- matrix(mydata[,1],11)
ans = solve(t(x)%*%x)%*%t(x)%*%y
ans
model <- lm(Calories ~ Fat + Sodium + Carb + Fiber + Protein)
summary(model)
