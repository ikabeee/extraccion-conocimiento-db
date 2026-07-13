packages <- c("tidyverse", "caret", "rpart", "rpart.plot", "e1071", "Metrics")
installation <-  packages[!(packages %in% installed.packages()[, "Package"])]
if(length(installation)) install.packages(installation)
library(tidyverse)
library(caret)

# Cargar dataset de gastos turistas
tourist <- read.csv("data/turistas_gastos.csv")
str(tourist)
summary(tourist)
head(tourist)

# Explorar la relación entre la variable noches y gastos
# Carlos Gonzalez Mollinedo
  geom_point(color = "blue")
  labs(title = "Relación entre Noches y Gastos", x = "Noches", y = "Gastos (USD)")
  
# Gonzalez Mollinedo Carlos
set.seed(123)
index <- createDataPartition(tourist$gasto, p = 0.8, list = FALSE)
train <- tourist[index, ]
test <- tourist[-index, 0]

firstModel <- lm(gasto ~ noches, data=train)
summary(firstModel)
