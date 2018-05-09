library(dplyr)
library(ggplot2)
library(scales)

app <- read.csv("BI-master/aplicativo.csv", header=TRUE, sep=",")

# Tipos de dispositivos
dispositivos = app %>%
  group_by(AVALIACAO) %>%
  summarise(
    total = n()
  )

pie_disp = ggplot(dispositivos, aes(x="", y=total, fill=AVALIACAO)) +
  geom_bar(width = 1, stat = "identity", position = "dodge")

plot(pie_disp)

