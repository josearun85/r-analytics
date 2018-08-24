setwd("D:/Work/Classes/r-analytics-master/data")
df <- read.csv("MedExp.csv")
library(plyr)

# Q1 - Does years of education and medexp have any relationship

plot(df$educdec ,df$med)
df$edu_group <- round(df$educdec/5)*5
table(df$educdec)
plot(df$edu_group ,df$med)

ddply(df, .(edu_group),summarize,mean_spend=mean(med))

hist(df$med,breaks=100)

ddply(df, .(edu_group),summarize,mean_spend=mean(med),med_spend=median(med))

boxplot(df$capped_med ~ df$edu_group)


#2 Age groups

df$age_group <- round(df$age/5)*5

# 3 Income - self rating
ddply(df, .(health),summarize,mean_dis=mean(linc),med_dis=median(linc))
boxplot(df$linc ~ df$health)


#4 gender -- chronic diseases

boxplot(df$ndisease ~ df$sex)
ddply(df, .(sex),summarize,mean_dis=mean(ndisease),med_dis=median(ndisease))


# 5 black - med

boxplot(df$med ~ df$black)
ddply(df, .(black),summarize,mean_dis=mean(med),med_dis=median(med))

# 6 high med, low disease?
plot(df$ndisease, df$med)
sub = df[df$med < 2000 & df$ndisease < 40,]
plot(sub$ndisease, sub$med)
cor(sub$ndisease, sub$med)

# 7 family size - health

ddply(df,.(health),summarize,fam=median(lfam),mfam=mean(lfam))
boxplot(df$lfam ~ df$health)
