library(dplyr)
library(ggplot2)
library(scales)

app <- read.csv("aplicativo.csv", header=TRUE, sep=",")

data = app %>%
  mutate(time = as.numeric(substr(HORA_PEDIDO, 2, 3))) %>%
  group_by(time) %>% 
  summarise(
    amount = n()
  )

print(substr(app$HORA_PEDIDO[2],2, 3))

viz = ggplot(data, aes(x=time, y=amount)) +
  geom_line()
plot(viz)