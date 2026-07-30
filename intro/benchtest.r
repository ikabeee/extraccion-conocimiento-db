#Gonzalez Mollinedo Carlos
install.packages("rpart")
library(rpart)
tienda <- read.csv("data/tienda_ventas.csv")

tienda$dia_semana <- factor(tienda$dia_semana)
tienda$promocion <- factor(tienda$promocion)

str(tienda)

set.seed(123)
indice <- createDataPartition(tienda$ventas, p = 0.8, list = FALSE)
train <- tienda[indice, ]
test <- tienda[-indice, ]
arbol_ventas <- rpart(ventas ~ ., data = train, method = "anova")

rpart.plot(arbol_ventas, main = "Árbol de regresión - Ventas de la tienda")

pred_arbol <- predict(arbol_ventas, newdata = test)
rmse_arbol <- rmse(test$ventas, pred_arbol)
r2_arbol <- cor(test$ventas, pred_arbol)^2

