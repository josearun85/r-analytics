# Load the "Iris" dataset (internal R dataset for practice)
data(iris)

# Names of variables
names(iris)

# copy iris to iris_copy
iris_copy<-iris

# Summary
summary(iris_copy)

# Unique values
unique(iris_copy$Sepal.Width)

# Unique combinations
unique(iris_copy[,c(2,5)])

# Number of columns and rows
nrow(iris_copy)
ncol(iris_copy)

# First 5 rows of Species column
iris_copy$Species[1:5]
iris_copy[1:5,5]
iris_copy[1:5,"Species"]

# Exclude columns
iris_copy[,-c(2,3)]

# Subsetting data
iris_copy[1,]
iris_copy[1:5,]
iris_copy[,1:3]
iris_copy[c(1,3,5),3]

# iris_copy using variable name
iris_copy$Sepal.Length[5]

# Filtering
iris_copy[which(iris_copy$Sepal.Width==4 ),]
iris_copy[iris_copy$Sepal.Width==4,]

iris_copy[iris_copy$Sepal.Width<4 & iris_copy$Petal.Width>2,]
iris_copy[iris_copy$Sepal.Width>5 | iris_copy$Petal.Width<.3,]


# Attaching files
attach(iris_copy)
Species
detach(iris_copy)
Species

# Graphs
attach(iris_copy)
hist(Sepal.Width)
plot(Sepal.Width,type="l")
boxplot(Sepal.Length)
barplot(Sepal.Length)
?plot
