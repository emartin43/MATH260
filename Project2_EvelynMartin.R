#
#Project 2 - Country relationship between productivity and average annual hours of work per worker
#by Evelyn Martin 
#11.9.20
#
#Load and verify data
#
hours<-read.csv(file.choose())
head(hours)
#
#Create subset for all average annual hours and productivity from year 2017
#
current <- subset(hours,Year=="2017")
#
#Boxplot,histogram, summary, and standard deviation 
#for explanatory variable average annual working hours
#
boxplot(current$Averagehrs,
        horizontal = TRUE,
        main = "Average Annual Hours per Worker",
        xlab = "Average Annual Hours per Worker")
hist(current$Averagehrs,
     main = "Average Annual Hours per Worker",
     xlab = "Average Annual Hours per Worker")
summary(current$Averagehrs)
sd(current$Averagehrs, na.rm = TRUE)
#
#Boxplot,histogram, summary, and standard deviation 
#for response variable productivity
#
boxplot(current$Productivity,
        horizontal = TRUE,
        main = "Productivity Across Countries",
        xlab = "Productivity (GDP/hour of work)")
hist(current$Productivity,
     main = "Productivity Across Countries",
     xlab = "Productivity (GDP/hour of work)")
summary(current$Productivity)
sd(current$Productivity, na.rm = TRUE)
#
#Scatterplot of productivity versus averagehrs and check out correlation
#
plot(current$Averagehrs, current$Productivity,
     main = "Productivity vs Average Annual Hours of Work",
     xlab = "Average Annual Hours per Worker",
     ylab = "Productivity (GDP/hour of work)")
cor(current$Productivity,current$Averagehrs, use = "complete.obs")
#
#Linear model of untransformed variables Productivity~Averagehrs & check out summary
#
linearmodel<-lm(Productivity~Averagehrs, data = current, na.action = na.exclude)
summary(linearmodel)
#
#Find confidence interval of slope coefficient
#
confint(linearmodel)
#
##Redraw the scatterplot with the fitted line
#
plot(current$Averagehrs, current$Productivity,
     main = "Productivity vs Average Annual Hours of Work",
     xlab = "Average Annual Hours per Worker",
     ylab = "Productivity (GDP/hour of work)")
abline(linearmodel)
#Check SVAs
#First normal quantile plot of residuals
require(car)
qqPlot(resid(linearmodel),
       main = "Normal Quantile Plot for Linear Model",
       ylab = "Residuals")
#Now plot the residuals versus the explanatory variables and put a horizontal line at 0
plot(resid(linearmodel)~current$Averagehrs,
     xlab = "Average Annual Hours per Worker",
     ylab = "Residuals",
     main = "Residual Plot for Linear Model")
abline(h=0)
#
# Make a prediction for productivity when average annual working hours per work is 1600 hours. Find CI and PI as well.
#

predict(linearmodel, new = data.frame(Averagehrs = 1600))

predict(linearmodel, new = data.frame(Averagehrs = 1600), interval = "confidence")

predict(linearmodel, new = data.frame(Averagehrs = 1600), interval = "prediction")
#
#Transform response variable productivity to ln.Productivity
log.Productivity=log(current$Productivity)
#
#Scatterplot of ln.productivity versus averagehrs and check out correlation
#
plot(current$Averagehrs, log.Productivity,
     main = "ln(Productivity) vs Average Annual Hours of Work",
     xlab = "Average Annual Hours of Work",
     ylab = "ln(Productivity)")
cor(log.Productivity,current$Averagehrs, use = "complete.obs")
#
#Linear model of transformed variables ln.Productivity~Averagehrs & check out summary
#
loglinearmodel<-lm(log.Productivity~Averagehrs, data = current, na.action = na.exclude)
summary(loglinearmodel)
#
#Find confidence interval of slope coefficient
#
confint(loglinearmodel)

#
##Redraw the scatterplot with the fitted line
#
plot(current$Averagehrs, log.Productivity,
     main = "ln(Productivity) vs Average Annual Hours of Work",
     xlab = "Average Annual Hours of Work",
     ylab = "ln(Productivity)")
abline (loglinearmodel)

#Check SVAs
#First normal quantile plot of residuals
qqPlot(resid(loglinearmodel),
       main ="Normal Quantile Plot for Model with Transformations",
       ylab = "Residuals")

#Now plot the residuals versus the explanatory variable and put a horizontal line at 0
plot(resid(loglinearmodel)~current$Averagehrs,
     xlab = "Average Annual Hours per Worker",
     ylab = "Residuals",
     main = "Residual Plot for Model with Transformations")
abline(h=0)

#
# Make a prediction for median productivity when average annual working hours per work is 1600 hours. Find CI and PI as well.
#
exp(predict(loglinearmodel, new = data.frame(Averagehrs = 1600)))
exp(predict(loglinearmodel, new = data.frame(Averagehrs = 1600), interval = "confidence"))
exp(predict(loglinearmodel, new = data.frame(Averagehrs= 1600), interval = "prediction"))
#
#End of script
#
