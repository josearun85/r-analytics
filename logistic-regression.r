library(car)
library(MASS)
# Import data - logistic_case_study.csv
data<-read.csv("data/florence.csv")

#Split your dataset
set.seed(110)
sub <- sample(nrow(data), floor(nrow(data) * 0.7))
training <- data[sub,]
testing <- data[-sub,]
rownames(training)<-1:nrow(training)
rownames(testing)<-1:nrow(testing)

# Building a model
names(data)
fit<-glm(Florence~ArtBks+Gender,data=training,
        family=binomial())
# Model summary
summary(fit)

# Predict probablity values using 
# predict() function
training$prob<-predict(fit,type="response")

# Plot predicted against target variable
plot(training$prob,jitter(training$Florence))

# Model building step 1: Model selection

# Code snippet to build model formula
listvar=names(training)
listvar<-listvar[-c(20,18,1,2)]
(fmla <- as.formula(paste("Florence ~ ", 
              paste(listvar, collapse= "+"))))


# Build model with all variables
fit1<-glm(fmla,data=training,family=binomial())
summary(fit1)
# Model selection to remove insignificant 
# variables
fit_step<-stepAIC(fit1)
# Checking for multicollinearity
vif(fit_step)


# Removing "F" from the list of input variables
listvar=names(training)
listvar<-listvar[-c(20,18,1,2,6)]
(fmla <- as.formula(paste("Florence ~ ", 
                          paste(listvar, collapse= "+"))))


# Build model with all variables minus F
fit2<-glm(fmla,data=training,family=binomial())
summary(fit2)
# Model selection to remove insignificant 
# variables
fit_step_2<-stepAIC(fit2)

# Checking for multicollinearity
vif(fit_step_2)
summary(fit_step_2)

# Make predictions on training
training$prob<-predict(fit_step_2,type="response")

# Make predictions on validation
testing$prob<-predict(fit_step_2,newdata=testing,
                      type="response")


# Plotting probabilities
plot(training$prob,training$Florence)

# Sensitivity & Specificity
# For a cut-off of 0.2 & 0.1, calculate class
training$class1<-ifelse(training$prob>=0.2,1,0)
training$class2<-ifelse(training$prob>=0.1,1,0)

# Cross tab of Florence against class
table(training$Florence,training$class1)
table(training$Florence,training$class2)

# For a cut-off of 0.2 & 0.1, calculate class
# for validation
testing$class1<-ifelse(testing$prob>=0.2,1,0)
testing$class2<-ifelse(testing$prob>=0.1,1,0)

# Cross tab of Florence against class
table(testing$Florence,testing$class1)
table(testing$Florence,testing$class2)

