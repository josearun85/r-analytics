students <- read.csv("data/students_performanace.csv")

#1 sample t-test for age = 45
t.test(students$Math, mu=45, alternative="two.sided")

#Paired
t.test(students$Math, students$Science, paired=T, alternative="two.sided")
t.test(students$Write, students$SST, paired=T, alternative="two.sided")
hist(students$Math - students$Science,breaks=25)
hist(students$Write - students$SST,breaks=25)

#Anova
out<-aov(students$Math~as.factor(students$Race))
summary(out)
boxplot(students$Math~as.factor(students$Race))


# Chi square
chisq.test(table(students$Gender), p=c(.6,.4))

chisq.test(students$Race,students$SEB)
fisher.test(students$Race,students$SEB)
table(students$Race,students$SEB)
