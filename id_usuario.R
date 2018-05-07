library(dplyr)
library(ggplot2)
library(scales)

app <- read.csv("aplicativo.csv", header=TRUE, sep=",")

usuario = app %>%
		group_by(ID_USUARIO) %>%
		summarise(
				amount = n()
		)

viz = ggplot(usuario, aes(x=usuario, y=amount)) +
		geom_line()
plot(viz)