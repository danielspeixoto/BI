library(dplyr)
library(ggplot2)
library(scales)

app <- read.csv("aplicativo.csv", header=TRUE, sep=",")

# Tipos de dispositivos
dispositivos = app %>%
  group_by(VALOR_PRODUTOS)

print(dispositivos)

pie_disp = ggplot(dispositivos, aes(x="Compra", y=VALOR_PRODUTOS, fill=VALOR_PRODUTOS)) +
  geom_boxplot(notch=TRUE)

plot(pie_disp)