library(dplyr)
library(ggplot2)
library(scales)

app <- read.csv("aplicativo.csv", header=TRUE, sep=",")

# Tipos de dispositivos
dispositivos = app %>%
		group_by(BAIRRO_USUARIO) %>%
		summarise(
				amount = n()
		)

pie_disp = ggplot(dispositivos, aes(x="", y=amount, fill=BAIRRO_USUARIO)) +
		geom_bar(width = 1, stat = "identity") +
		coord_polar("y", start=0)

plot(pie_disp)