library(tidyverse)
turistas <- read.csv("datasets/turistas_segmentacion.csv")

str(turistas)
summary (turistas)

ggplot(turistas, aes(x = gasto_promedio_dia, y = frecuencia_anual)) +
  geom_point (color = "steelblue") +
  labs (title = "Turistas según gasto y frecuencia de viaje",
        x = "Gasto promedio por día (USD)",
        y = "Viajes por año")

turistas_esc <- scale(turistas)

modelo_km <- kmeans(turistas_esc, centers = 3, nstart = 25)
turistas$cluster <- factor(modelo_km$cluster)

ggplot(turistas, aes(x = gasto_promedio_dia, y = frecuencia_anual, color = cluster)) +
  geom_point (size = 2) +
  labs (title = "Segmentación de turistas (K-means, k = 3)",
        x = "Gasto promedio por día (USD)", y = "Viajes por año")

aggregate (cbind (gasto_promedio_dia, frecuencia_anual) ~ cluster, data = turistas, FUN = mean)