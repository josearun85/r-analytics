# Writing a user defined function

test_function<-function(){
  print("Function worked")
  return()
}

test_function()


# Passing arguments
arg_fun<-function(x){
  print(paste("Received values:",x))
}

arg_fun("token")

# Function that returns a value

data_length<-function(str){
  return(length(str))
}
dt<-c(1,2,3)
data_length(dt)

# Function that takes and returns multiple values

mean_std<-function(x,y){
  t<-x+y
  mn<-mean(t)
  st<-sd(t)
  return(list(total=t,mean=mn,stand_dev=st))
}
num1<-c(1,2,3,4,5)
num2<-6:10
mean_std(num1,num2)
