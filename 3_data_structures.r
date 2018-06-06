# Vectors
a <- c(1,2,5.3,6,-2,4) 
b <- c("one","two","three") 
c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE) 
d <- c(1,"a",TRUE) 
class(a)
class(b)
class(c)
class(d)

# Matrix

# generates 5 x 4 numeric matrix 
mat1<-matrix(1:20, nrow=5,ncol=4)
mat1

mat2<-matrix(1:17, nrow=5,ncol=4,byrow=TRUE)
mat2

# Arguments
?matrix

# Lists
a<-c("a","b","c")
b <- 1:100

mylist<-list(c1=a,c2=b,c3=mat1)
mylist
mylist$c1
# Access values in an element using [[]]
mylist[[1]]
mylist[1]

mylist[1][1] # Does not yield desired result
mylist[[1]][1]  # Correct way of writing code

# Data frames
d <- c(1,2,3,4)
e <- c("red", "white", "red", NA)
f <- c(TRUE,TRUE,TRUE,FALSE)
mydata <- data.frame(d,e,f)
mydata

names(mydata)
rownames(mydata)
names(mydata) <- c("ID","Color","Passed") # Rename variables
names(mydata)

mydata