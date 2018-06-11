library(plyr)
setwd("C:/Users/arun.j/Desktop/base-analytics-master/data")
tel <- read.csv("Telecom_data.csv")

# Q1. How many customer live in each region?
ddply(tel, .(region), summarize, ncust=length(region))

# Q2. Sort dataset by tenure
arrange(tel, tenure)

# Q3. Which region has the most churn?
ddply(tel, .(region), summarize, n_cust_churn=sum(churn))

# Q4. Which region has the most churn in %?
arrange(ddply(tel, .(region), summarize, perc_cust_churn=(sum(churn)/length(churn))*100), -perc_cust_churn)

# Q5. Do married women use more long distance?
arrange(ddply(tel, .(marital,gender), summarize, long_time=mean(longten)), -long_time)
