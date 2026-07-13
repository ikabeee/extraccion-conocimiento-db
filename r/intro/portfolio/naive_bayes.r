# Instalar paquete
install.packages("e1071")
library(e1071)

# Leer datos
datos <- read.csv("data/turistas_gastos.csv")

# Crear la variable de clasificación
datos$categoria_gasto <- cut(
  datos$gasto,
  breaks = c(0, 250, 450, Inf),
  labels = c("Bajo", "Medio", "Alto")
)

# Entrenar modelo
modelo_nb <- naiveBayes(categoria_gasto ~ noches, data = datos)

# Predicción
nuevo <- data.frame(noches = 8)
predict(modelo_nb, nuevo)

# Probabilidades
predict(modelo_nb, nuevo, type = "raw")