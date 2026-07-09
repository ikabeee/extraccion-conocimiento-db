packages <- c("tidyverse", "caret", "rpart", "rpart.plot", "e1071", "Metrics")
installation <-  packages[!(packages %in% installed.packages()[, "Package"])]
if(length(installation)) install.packages(installation)
library(tidyverse)


# Cargar dataset de gastos turistas
tourist <- read.csv("data/turistas_gastos.csv")
str(tourist)
summary(tourist)
head(tourist)

# Explorar la relación entre la variable noches y gastos
# Carlos Gonzalez Mollinedo
ggplot(tourist, aes(x = noches, y = gasto)) +
  geom_point(color = "blue") +
  labs(title = "Relación entre Noches y Gastos", x = "Noches", y = "Gastos")


install.packages(c("vctrs", "ggplot2", "tibble", "dplyr", "readr"), dependencies = TRUE)