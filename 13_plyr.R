library(plyr)
library(ggplot2)
data(mpg)
str(mpg)

## Simplify the dataset
data <- mpg[,c(1,7:9)]
str(data)


## Summarising/ Aggregating Data

ddply(data, .(manufacturer), summarize, avgcty = mean(cty))

## you can perform multiple functions in a single call

ddply(data, .(manufacturer), summarize, avgcty = mean(cty), sdcty = sd(cty), maxhwy = max(hwy))

## you can summarize data by a combination of variables/factors

ddply(data, .(manufacturer, drv), summarize, avgcty = mean(cty), sdcty = sd(cty), maxhwy = max(hwy))

## note the package reshape/reshape2 is an elegant alternative for aggregating many variables at one time

## note the differences between the commands "summarize" and "transform"

ddply(data, .(drv), summarize, avgcty = mean(cty))
ddply(data, .(drv), transform, avgcty = mean(cty))

## transform is very useful standardizing/normalizing

ddply(data, .(drv), transform, delta = mean(cty)-cty)


## Now let's use plyr to run a simple loop

## We'll ask the question: Does city mpg  differ between car manufacturers, for each class of drivetrains (4x4, forward, or rear-wheel drive)? Let's try to automate these ANOVAs and extract the F-statistics and P-values from the ANOVAs.


## Step1: create function to run ANOVA

model <- function(data) { aov(cty~manufacturer, data=data) }

## Step 2: Use plyr to run model for each and create list (called anova.output) to store output for each drivetrain. For dlply, the syntax means d for input data is data frame and l for output data is list.

anova.output <- dlply(data, .(drv), model)
summary(anova.output[[1]])
## Step 3: Create function that tells R where to find F-statistic and P-value in the output within the list. The output is somewhat hidden in this example- don't worry about the messy indexing here-- what's important is that this just tells R where the F-stats and P-values are stored. 

juicy <- function(x) { c(summary(x)[[1]][["F value"]][[1]], 
                         summary(x)[[1]][["Pr(>F)"]][[1]]) }

## Step 4: Extract components of model output from the list created in previous step. For ldply, the syntax is: input is list and output is data frame. Note that since the input is a list, we don't have to indicate the 2nd parameter (which variable(s) to apply the function to, as the default is to apply function to all elements of the list.) 

ldply(anova.output, juicy)

## The data frame shows F-statistics (V1) and P-values (V2) for the ANOVAs by drivetrain.


## We could always condense some of the above steps as well:

anova.output <- dlply(data, .(drv), function(data) aov(cty~manufacturer, data=data))
ldply(anova.output, function(x) { c(summary(x)[[1]][["F value"]][[1]], summary(x)[[1]][["Pr(>F)"]][[1]]) })


