# Numbers
num1<-3
num2<-c(1.1,2,3)

# Structure
class(num1)
class(num2)

# Type casting
num2<-as.integer(num2)
class(num2)

# Strings or characters
char1<-"hello"
char2<-c("hello","world")
class(char2)

# Factors
fac_list<-c(1,2,3,2,2,2,3,1,3,3,2,2,1,1,1,4,4,3,2,1,2)
fac_list
fact<-as.factor(fac_list)
fact
levels(fact)
str(fact)
class(fact)
summary(fact)

# Dealing with dates

# use as.Date( ) to convert strings to dates 

mydates <- as.Date(c("2007-06-22", "2004-02-13","2004-02-13"))
str(mydates)

# number of days between 6/22/07 and 2/13/04 
days <- mydates[1] - mydates[2]
days

# Convert to date type using format

# %d	day as a number (0-31)	01-31
# %a abbreviated weekday: Mon
# %A	unabbreviated weekday: Monday
# %m	month (00-12)	00-12
# %b  abbreviated month Jan
# %B	unabbreviated month January
# %y  2-digit year 07
# %Y	4-digit year	2007

strDates <- c("01/05/1965", "08/16/1975")
dates <- as.Date(strDates, "%m/%d/%Y")
dates

strDates <- c("01/05/65", "08/16/75")
dates <- as.Date(strDates, "%m/%d/%y")
dates

