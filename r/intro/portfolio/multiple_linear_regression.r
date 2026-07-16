library(tidyverse)
library(caret)
library(Metrics)

tours <- read.csv("data/tours_precio.csv")
str(tours)
summary(tours)

set.seed(123)
indice <- createDataPartition(tours$precio, p = 0.8, list = FALSE)
train <- tours[indice, ]
test <- tours[-indice, ]

modelo2 <- lm(precio ~ distancia_km + duracion_h + personas, data = train)
summary(modelo2)
pred2 <- predict(modelo2, newdata = test)
head(pred2)
resultados_m2 <- data.frame(
    Metrica = c("MAE", "RMSE", "R2"),
    Valor = c(
        mae(test$precio, pred2),
        rmse(test$precio, pred2),
        cor(test$precio, pred2)^2)
)
print(resultados_m2)