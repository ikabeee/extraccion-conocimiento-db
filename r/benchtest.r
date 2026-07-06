packages <- c("tidyverse", "caret", "rpart", "rpart.plot", "e1071", "Metrics", "ggplot")
installation <-  packages[!(packages %in% installed.packages()[, "Package"])]
if(length(installation)) install.packages(installation)
library(tidyverse)


# Cargar dataset de gastos turistas
tourist <- read.csv("data/turistas_gastos.csv")
str(tourist)
summary(tourist)
head(tourist)

# Explorar la relación entre la variable noches y gastos
ggplot(tourist, aes(x = noches, y = gastos)) +
  geom_point(color = "blue") +
  labs(title = "Relación entre Noches y Gastos", x = "Noches", y = "Gastos")