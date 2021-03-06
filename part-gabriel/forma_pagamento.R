library(dplyr)
library(ggplot2)
library(scales)

app <- read.csv("BI-master/aplicativo.csv", header=TRUE, sep=",")

# Tipos de dispositivos
dispositivos = app %>%
  group_by(FORMA_PAGAMENTO) %>%
  summarise(
    amount = n()
  )

pie_disp = ggplot(dispositivos, aes(x="", y=amount, fill=FORMA_PAGAMENTO)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start=0)

plot(pie_disp)

