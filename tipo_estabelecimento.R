library(dplyr)
library(ggplot2)
library(scales)

app <- read.csv("BI-master/aplicativo.csv", header=TRUE, sep=",")

# Tipos de dispositivos
dispositivos = app %>%
  group_by(TIPO_ESTABELECIMENTO) %>%
  summarise(
    amount = n()
  )

pie_disp = ggplot(dispositivos, aes(x="", y=amount, fill=TIPO_ESTABELECIMENTO)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0)

plot(pie_disp)

