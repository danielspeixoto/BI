# TODO: Add comment
# 
# Author: Usuario
###############################################################################

library(dplyr)
library(ggplot2)
library(scales)

app <- read.csv("aplicativo.csv", header=TRUE, sep=",")

usuario = app %>%
		group_by(ID_USUARIO) %>%
		summarise(
				amount = n()
		)

ggplot(usuario, aes(x="", y=amount)) +
		geom_line() +
		coord_polar("y", start=0)

#viz = ggplot(usuario, aes(x=date, y=amount)) +
#		geom_line() +
#		scale_x_date(labels = date_format("%Y-%m"))

plot(viz)