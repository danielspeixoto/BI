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
  geom_line() +
  geom_point() +
  scale_color_continuous()

plot(viz)

# pie_disp = ggplot(dispositivos, aes(x="", y=amount, fill=DDD_USUARIO)) +
# 	geom_bar(width = 1, stat = "identity") +
# 	coord_polar("y", start=0)
# 
# plot(pie_disp)
