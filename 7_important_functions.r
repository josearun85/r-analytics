# Conditional functions
a<-c(1,2,3)

ifelse(a==2,1,0)

# Concatenation

paste("a","b")
paste("Hello","world",sep="+")
b<-9
paste("the number is",b)

a<-c("hello","world")
paste(a)
paste(a,collapse=" ")
b<-c("a","b")
paste(a,b)
c<-c(9)
paste(a,c)



# Checking for null

a<-c(1,2,3,NA)
is.na(a)
!is.na(a)

a[is.na(a)]<-10
a
a<-c(1,2,3,NA)
b<-a[!is.na(a)]
b

# Merge dataframes

a <- data.frame(k1 = c(1,2,3,4,5), k2 = c("a","b","c","d","e"), data = 1:5)
b <- data.frame(xyz = c(1,2,3,4,5), k3 = c(5,6,7,8,9))

merge(a, b, by.x = "k1",by.y="xyz")

merge(a,b)

x <- data.frame(k1 = c(1,NA,NA,4,5), k2 = c("a","b","c","d","e"), data = 1:5)
y <- data.frame(k1 = c(1,NA,3,4,5), k2 = c(5,6,7,8,9))

merge(x, y, by.x = "k1",by.y="k1")

merge(x, y, by.x = "k1",by.y="k1",incomparables = NA) # NA's match
merge(x,y)

# Using cross tabulation
a<-c(rep(0,10),rep(1,10))
b<-c(rep(0,7),rep(1,13))
a
# One way table
table(a)

# Two way table
table(a,b)



# Load and save
ls()
rm(list=ls()[1])                        # clean up
y.vector = runif(20)                 # a vector of 20 random numbers
ls()
save(y.vector, file="yvec.saved")    # save to the working directory
rm(y.vector)                         # removed
ls()
load("yvec.saved")                   # loaded back in
class(ls())
x<-"a"
rm(list=c("x","y.vector"))


# Interactive mode

rnd<-round(rnorm(1),1)
msg<-paste("The number is",rnd,". Do you want to proceed?(yes/NO)")
a<-readline(prompt=msg)
a

# Using the working directory

# Get current working directory
getwd()

# Set to new directory
setwd("D:/")
