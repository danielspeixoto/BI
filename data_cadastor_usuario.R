library(dplyr)
library(ggplot2)
library(scales)

app <- read.csv("aplicativo.csv", header=TRUE, sep=",")

data = app %>%
		mutate(date = as.Date(format(as.Date(DATA_CADASTRO_USUARIO, "%Y-%m-%d"),"%Y-%m-01"), "%Y-%m-%d")) %>%
		group_by(date) %>% 
		summarise(
				amount = n()
		)
print(data)

viz = ggplot(data, aes(x=date, y=amount)) +
		geom_line() +
		scale_x_date(labels = date_format("%Y-%m"))

plot(viz)