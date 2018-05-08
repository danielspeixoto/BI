library(dplyr)
library(ggplot2)
library(scales)

app <- read.csv("BI-master/aplicativo.csv", header=TRUE, sep=",")

data = app %>%
  group_by(TOTAL_PEDIDO) %>%
  summarise(
    amount = n()
  )

viz = ggplot(data, aes(x=TOTAL_PEDIDO, y=amount)) +
  geom_line() + geom_point()

plot(viz)

