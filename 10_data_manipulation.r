library(plyr)
library(rpart)

names(car90)
test<-car90

# Sorting a dataset
sorted<-arrange(test,-HP,Mileage)
sorted

# Applying a function to all columns
numcolwise(mean)(test[,3:4], na.rm = TRUE)

# Count of unique combinations
count(test,c("Disp"))
count(test,c("HP","Mileage"))


# Use multiple function on single vector
each(min, max)(1:10)
each(mean,sd,min,max)(car90$HP[!is.na(car90$HP)])
each(mean,sd,min,max)(car90$HP,na.rm=T)

# Replicate SQL joins
dfs <- list(
  a = data.frame(x = 1:10, a = runif(10)),
  b = data.frame(x = 1:10, b = runif(10)),
  c = data.frame(x = 1:5, c = runif(5))
)
join_all(dfs)
join_all(dfs, "x",type="inner")
join_all(dfs, type="right")

# Remapping values
x <- as.factor(c("a", "b", "c"))
mapvalues(x, c("a", "c"), c("A", "C"))

# Creating a custom summary
summarise(test,price_range = max(Price,na.rm=T) - min(Price,na.rm=T),n_countries = length(unique(Country)))
