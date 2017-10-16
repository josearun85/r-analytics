
# Import data
test<-read.table(file.choose(),sep=',',header=TRUE)

test<-read.csv(file.choose())
test$age

library(forecast)
li



boxplot(test$age~as.factor(test$churn))

#1 sample t-test for age = 36
t.test(test$age, mu=36, alternative="two.sided")


#Paired
t.test(Postwt, Prewt, paired=T, alternative="two.sided")

#Anova
out<-aov(test$income~as.factor(test$region))
summary(out)

l1<-length(test$gender[test$gender==1])
l1
l2<-length(test$gender[test$gender==0])
x<-c(M=l1,Fe=l2)
# Chi square
chisq.test(x, p=c(.5,.5))

chisq.test(test$churn,test$gender)
?chisq.test