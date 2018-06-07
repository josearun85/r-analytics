# For loop

for(k in 1:10){
  print(k)
}

for(k in 1:10){
  k
}


i<-1:10

for(j in i){
  print(j)
}


out<-rep(1:2,10)
out<-0
for(k in 1:10){
  out[k]<-k
}
out


# While loop
y<-0
while(y <5){ 
  print( y<-y+1) 
}

# Repeat - similar to a do-while loop
y<-0
repeat{
  print(y<-y+1)
  if(y>5){
    break
  }
}