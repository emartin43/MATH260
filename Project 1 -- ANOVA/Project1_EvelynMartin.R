#
#Project1 - ANOVA
#
#Data set is file of duration of unemployment of 4 age groups (15-19, 20-24, 25-54, 55-99) and the OECD country associated with them.  
#
#Evelyn Martin
#10/12/20
#

#Load data and verify
duration<-read.csv(file.choose())
head(duration)
#
#Explore the overall data set - boxplot, histogram, summaries, etc.
#
boxplot(duration$Value,
        horizontal=TRUE,
        main = "Average Duration of Unemployment",
        xlab = "Duration (in months)")
summary(duration$Value)
hist(duration$Value,
     main = "Average Duration of Unemployment",
     xlab = "Duration (in months)",
     ylab = "Frequency")
sd(duration$Value)
#
#Explore the data by age group - side by side boxplot, summaries, etc.
#
boxplot(duration$Value~duration$AGE,
        horizontal=TRUE,
        main = "Average Duration of Unemployment",
        xlab= "Duration (in months)",
        ylab = "Age Group")
by(duration$Value, duration$AGE, summary)
by(duration$Value, duration$AGE, sd)
#
#Do an ANOVA by age group on duration of unemployment 
#
duration$AGE<-factor(duration$AGE)
durationModel<-lm(Value~AGE, data=duration)
summary(durationModel)
#
#Create confidence interval for each coefficient of the model
#
confint(durationModel)
#
#Do an Tukey HSD pairwise comparison
#
TukeyHSD(aov(durationModel))
#
#Plot of Tukey intervals
#
plot(TukeyHSD(aov(durationModel)))

# 
#Check SVAs
#
#Create qqPlots to check if residuals are normally distributed
#Create titles for each age group using a loop
#
require(car)
duration$AGE<-factor(duration$AGE)
ageGroup=c("15-19", "20-24", "25-54", "54-99")
par(mfrow=c(2,1))
for (i in 1:length(levels(duration$AGE)))
{
  thisType = levels(duration$AGE)[i]
  qqPlot(subset(resid(durationModel),duration$AGE ==thisType),
         main = paste("Normal Quantile Plot for", ageGroup[i]),
         ylab="Residuals"
  )
}
#
#Create strip chart to check for equal variances
#
#Reset graph
#
par(mfrow=c(1,1))
stripchart(duration$Value~duration$AGE,
           vertical = TRUE,
           main = "Stripchart for Duration of Unemployment by Age Group",
           ylab="Average Duration of Unempolyment (in months)",
           xlab="Age Group"
)
########################################
#
# end of script
#
########################################



