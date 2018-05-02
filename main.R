library(dplyr)
library(ggplot2)
library(scales)

app <- read.csv("aplicativo.csv", header=TRUE, sep=",", nrows=10000)

# Tipos de dispositivos
dispositivos = app %>%
  group_by(SO_DISPOSITIVO) %>%
  summarise(
    amount = n()
  )

pie_disp = ggplot(dispositivos, aes(x="", y=amount, fill=SO_DISPOSITIVO)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start=0)

plot(pie_disp)

#################################################
data = app %>%
  mutate(date = as.Date(format(as.Date(DATA_PEDIDO, "%Y-%m-%d"),"%Y-%m-01"), "%Y-%m-%d")) %>%
  group_by(date) %>% 
  summarise(
    amount = n()
  )
print(data)

viz = ggplot(data, aes(x=date, y=amount)) +
  geom_line() +
  scale_x_date(labels = date_format("%Y-%m"))

plot(viz)