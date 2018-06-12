library(plyr)
setwd("C:/Users/arun.j/Desktop/base-analytics-master/data")
tel <- read.csv("Telecom_data.csv")
library(ggplot2)
tel$churn <- as.factor(tel$churn)
tel$gender <- as.factor(tel$gender)
tel$ind <- 1:1000
# 1. Setup a plot object with dataframe
# 2. choose the layers you need
# 3. Apply styles, labels etc

gg <- ggplot(tel)

gg <- gg + geom_histogram(aes(x=age), bins = 4)

gg <- gg + geom_histogram(aes(x=age)) + facet_grid( churn ~ gender )
gg <- gg + geom_histogram(aes(x=age)) + facet_grid( churn ~ . )
gg <- gg + geom_histogram(aes(x=age)) + facet_grid( . ~ gender )

gg

gg <- ggplot(tel)
gg <- gg + geom_point(aes(x=employ, y = income, shape=gender,color=churn, size=longten))
#+ facet_grid( churn ~ gender )
gg


ggplot(tel)  + 
  geom_line(aes(x=ind, y = income)) + 
  geom_rect(aes(xmin = 250, ymin = 500,xmax= 750 , ymax = 750),fill="red")

ggplot(tel,aes(x=age, y = employ))  + 
  geom_jitter(size=.5,aes(x=age, y = employ)) + 
  geom_smooth()



df <- data.frame(cat=c("c","d","e","e"), cnt=1:4)
p <- ggplot(df)
p <- p + geom_bar(aes(x=cat))
p

gg + theme_bw() + ggtitle("HEllo")

library(ggmap)
al1 = get_map(location = c(lon = -86.304474, lat = 32.362563), zoom = 13, maptype = 'roadmap')
al1MAP = ggmap(al1)+
  geom_rect(aes(xmin = -86.3, ymin = 32.3,xmax= -86.4 , ymax = 32.4),fill="red")
al1MAP
