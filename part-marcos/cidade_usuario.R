library(dplyr)
library(ggplot2)
library(scales)

app <- read.csv("trunk/aplicativo.csv", header=TRUE, sep=",")

# Tipos de dispositivos
dispositivos = app %>%
		group_by(CIDADE_USUARIO) %>%
		summarise(
				amount = n()
		)
print(dispositivos)

pie_disp = ggplot(dispositivos, aes(x="", y=amount, fill=CIDADE_USUARIO)) +
		geom_bar(width = 1, stat = "identity") +
		coord_polar("y", start=0)
 
plot(pie_disp)