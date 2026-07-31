library(tidyverse)
clientes <- read.csv("datasets/clientes_plaza.csv")

str(clientes)
summary (clientes)


ggplot(clientes, aes(x = edad, y = putuacion_gastos)) +
    geom_point (color = "steelblue") +
    labs (title = "Clientes según edad y puntuación de gastos",
            x = "Edad (años)",
            y = "Puntuación de gastos")

clientes_esc <- scale(clientes)
modelo_km <- kmeans(clientes_esc, centers = 4, nstart = 25)
clientes$cluster <- factor(modelo_km$cluster)

ggplot(clientes, aes(x = edad, y = putuacion_gastos, color = cluster)) +
    geom_point (size = 2) +
    labs (title = "Segmentación de clientes (K-means, k = 4)",
            x = "Edad (años)", y = "Puntuación de gastos")
aggregate (cbind (edad, putuacion_gastos) ~ cluster, data = clientes, FUN = mean)