setwd("C:/Users/arun.j/Desktop/H/raw data")
wthr <- read.csv("weather.txt",stringsAsFactors = F,header = F)
wthr$year = 2018
wthr$date = ""
wthr$temp = 0
year = 2018
n=4
for(i in 2:nrow(wthr)){
  x=wthr[i,1]
  if(x == "Actual Temp"){
    wthr$year[i]=year
    wthr$date[i]=wthr[i-1,1]
    wthr$temp[i]=wthr[i+1,1]
    
  }else if(substr(x,nchar(x)-4+1, nchar(x))=="2017"){
    year=2017
  }
  print(i)
}

weather <- wthr[wthr$date!="",]
weather$date = paste0(weather$year,"/", substr(weather$date, 5, nchar(weather$date)) )
weather$date <- as.POSIXct(weather$date,format="%Y/%m/%d")

weather$high <- unlist(strsplit(weather$temp,"/"))[seq(1,790,2)]
weather$low <- unlist(strsplit(weather$temp,"/"))[seq(2,790,2)]
weather$high <- as.numeric(gsub("°","",weather$high))
weather$low <- as.numeric(gsub("°","",weather$low))

weather = weather[,c("date","high","low")]
write.csv(weather,"weather.csv",row.names=F)
library(plyr)
weather <- arrange(weather,date)

plot(weather$date, weather$high, type="l")
lines(weather$date,weather$low,col="red")
