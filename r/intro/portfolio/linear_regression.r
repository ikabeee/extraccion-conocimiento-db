turistas <- read.csv("data/turistas_gastos.csv")
str(turistas)
summary(turistas)
head(turistas)
install.packages("Metrics")
library(tidyverse)
library(caret)
library(Metrics)
ggplot(turistas, aes(x=noches, y=gasto)) +
  geom_point(color="steelblue") +
  labs(title="Gasto turisticos vs noches de estadía",
       x="Noches de estadía", y="Gasto total(USD)")

set.seed(123)
indice <- createDataPartition(turistas$gasto, p=0.8, list=FALSE)
train <- turistas[indice,]
test <- turistas[-indice,]

modelo1 <- lm(gasto ~ noches, data = train)
summary(modelo1)

pred1 <- predict(modelo1, newdata = test)
print(pred1)

mae_1 <- mae(test$gasto, pred1)
rmse_1 <- rmse(test$gasto, pred1)
r2_1 <- cor(test$gasto, pred1)^2
cat("MAE :", round(mae_1, 2), "\n")
cat("RMSE:", round(rmse_1, 2), "\n")
cat("R²:", round(r2_1, 2), "\n")