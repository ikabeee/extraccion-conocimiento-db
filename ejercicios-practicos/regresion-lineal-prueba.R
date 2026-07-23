#Gonzalez Mollinedo Carlos
# Config 
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

# Caso de estudio

cliente_actual <- data.frame(noches = 5)
cliente_extendido <- data.frame(noches = 6)
cliente_target <- data.frame(noches = 21)
fake_client <- data.frame(noches = 365)
gasto_5_noches <- predict(modelo1, newdata = cliente_actual)
gasto_6_noches <- predict(modelo1, newdata = cliente_extendido)
gasto_21_noches <- predict(modelo1, newdata = cliente_target)
gasto_365_noches <- predict(modelo1, newdata = fake_client)

cat("Proyección para 5 noches: $", round(gasto_5_noches, 2), "USD")
cat("Proyección para 6 noches: $", round(gasto_6_noches, 2), "USD")
cat("Proyección para 21 noches: $", round(gasto_21_noches, 3), "USD")
cat("Proyección para 21 noches: $", round(gasto_365_noches, 3), "USD")

#GONZALEZ MOLLINEDO CARLOS