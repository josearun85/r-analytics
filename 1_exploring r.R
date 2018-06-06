################################
### Exploring R
###
################################

# Importing data

working_directory <- "D:/Training/R/Code/R tutorial" 
setwd(working_directory)
data_file <- read.csv("cars.csv")

# Initialize libraries

library(Hmisc)
library(ggplot2)
library(plyr)

# Summarize data

summary(data_file)
describe(data_file)
str(data_file)
names(data_file)
nrow(data_file)

# Display first 10 rows of first 5 columns

data_file[1:10,1:5]

# Visualize data

attach(data_file)
qplot(Price,fill=Type,binwidth=2000)
qplot(Disp,HP,size=Weight,color=Country)

# Reports

summarise(data_file,
          n_countries = length(unique(Country)),
          max_price = max(Price,na.rm=T),
          min_price = min(Price,na.rm=T),
          price_sd = sd(Price,na.rm=T),
          avg_horsepower = mean(HP)          
          )

# Regression

lm_fit <- lm(Price~HP,data=data_file)
summary(lm_fit)
lm_fit$coefficients

str(lm_fit)

plot(HP, Price, main="Scatter plot", xlab="Horsepower", ylab="Price")
abline(lm_fit,col="red",lwd=3)
