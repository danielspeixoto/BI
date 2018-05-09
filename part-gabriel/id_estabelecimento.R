library(dplyr)
library(ggplot2)
library(scales)

app <- read.csv("aplicativo.csv", header=TRUE, sep=",")

usuario = app %>%
  group_by(ID_ESTABELECIMENTO) %>%
  summarise(
    amount = n()
  )

viz = ggplot(usuario, aes(x=ID_ESTABELECIMENTO, y=amount)) +
  geom_line() + geom_point()

plot(viz)
