#Read data
mydata<-read.csv(file.choose())

# Load necessary libraries
library(car)
attach(mydata)

# Scatter plot matrix
pairs(~Price+Bedrooms+Bathrooms+SqFt+Offers,data=mydata,
      main="Simple Scatterplot Matrix")

# Correlation

cor(mydata[,-c(1,7,8)])

# Anova
out<-aov(Price~Brick,data=mydata)
summary(out)
boxplot(Price~Brick)

# Create dummy variables

mydata$brick_d<-ifelse(mydata$Brick=="Yes",1,0)
mydata$east<-ifelse(mydata$Neighborhood=="East",1,0)
mydata$north<-ifelse(mydata$Neighborhood=="North",1,0)

#Split your dataset
set.seed(110)
sub <- sample(nrow(mydata), floor(nrow(mydata) * 0.7))
training <- mydata[sub,]
testing <- mydata[-sub,]
rownames(training)<-1:nrow(training)
rownames(testing)<-1:nrow(testing)

#Model Selection
fit1 <- lm(Price ~ SqFt+Bathrooms+Bedrooms+Offers+
             north+east+brick_d, data=training)
?lm
fit1
fits1<-stepAIC(fit1)
summary(fit1)
summary(fits1)

#Multicollinearity
vif(fits1)

#Cooks distance for outlier
training$cook<-cooks.distance(fit1)
train_out<-training[training$cook<4/(89-7-1),]

fit2 <- lm(Price ~ SqFt+Bathrooms+Bedrooms+
             Offers+north+east+brick_d, 
           data=train_out)
fits2<-stepAIC(fit2)
summary(fit2)
summary(fits2)
fit3 <- lm(Price ~ SqFt+Bathrooms+Offers+north+east+brick_d, data=train_out)
summary(fit3)

#Linearity assumptions

hist(residuals(fit1),breaks=15)
hist(residuals(fits1))
hist(residuals(fit2))
hist(residuals(fits2),breaks=15)
hist(residuals(fit3),breaks=15)
?hist

plot(predict(fit1),residuals(fit1))
plot(predict(fits1),residuals(fits1))
plot(predict(fit2),residuals(fit2))
plot(predict(fits2),residuals(fits2))
plot(predict(fit3),residuals(fit3))

plot(predict(fit1),training$Price)
plot(predict(fits1),training$Price)
plot(predict(fit2),train_out$Price)
plot(predict(fits2),train_out$Price)
plot(predict(fit3),train_out$Price)


#Validation scoring
testing$pred2<-predict(fit2,newdata=testing)
testing$res2<-testing$pred2-testing$Price

#Compare performance
cor(train_out$Price,predict(fit2))
cor(testing$Price,testing$pred2)


hist(residuals(fit2))
hist(testing$res2)

plot(predict(fit3),residuals(fit3))
plot(testing$pred3,testing$res3)

plot(predict(fit3),train_out$Price)
plot(testing$pred3,testing$Price)
