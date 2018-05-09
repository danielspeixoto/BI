library(dplyr)
library(ggplot2)
library(scales)

app <- read.csv("trunk/aplicativo.csv", header=TRUE, sep=",")

# Tipos de dispositivos
dispositivos = app %>%
	group_by(DDD_USUARIO) %>%
	summarise(
			amount = n()
	)
print(dispositivos)

viz = ggplot(dispositivos, aes(x=DDD_USUARIO, y=amount)) +
  geom_point() + geom_line()

plot(viz)
