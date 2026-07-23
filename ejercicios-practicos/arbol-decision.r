lunes_promedio <- data.frame(temperatura = 25, dia_semana = factor("L"), turistas_dia = 300, promocion =factor("No"))

sabado_promedio <- data.frame(temperatura = 25, dia_semana = factor("S"), turistas_dia = 300, promocion =factor("No"))

ventas_lunes <-predict(arbol_ventas, newdata = lunes_promedio)
ventas_sabado <- predict(arbol_ventas, newdata = sabado_promedio)

cat("Proyeccion de ingresos (Lunes)", round(ventas_lunes,2), "USD\n")
cat("Proyeccion de ingresos (Sabado)", round(ventas_sabado,2), "USD\n")

#Reto - Martes Especial

martes_especial <- data.frame(temperatura = 32, dia_semana = factor("M"), turistas_dia = 800, promocion = factor("Si"))
ventas_martes <- predict(arbol_ventas, newdata = martes_especial)
cat("Preccion de ventas Martes Especial: ", round(ventas_martes, 2), "USD\n")


# ZURISARAI DELGADO RODRIGUEZ IDYGS91
# 20 Julio de 2026