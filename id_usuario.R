library(dplyr)
library(ggplot2)
library(scales)

app <- read.csv("trunk/aplicativo.csv", header=TRUE, sep=",")

usuario = app %>%
		group_by(ID_USUARIO) %>%
		summarise(
				amount = n()
		)
print(usuario)

viz = ggplot(usuario, aes(x=ID_USUARIO, y=amount)) +
		geom_point() +
    scale_color_continuous()
    
plot(viz)