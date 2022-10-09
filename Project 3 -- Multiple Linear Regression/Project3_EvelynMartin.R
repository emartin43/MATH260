#
#Project 3 
#This script analyzes weightlifting data on female powerlifters 
#
#by Evelyn Martin 
#12.14.20
#
#Load and verify data
#
powerlift<-read.csv(file.choose())
head(powerlift)
powerlift$Equipment <- factor(powerlift$Equipment)
#
#Subset powerlifting data to look at females only
#
powerlift <- subset(powerlift,Sex == "F")
#
#Convert negative values into NA
#
powerlift$Deadlift <- replace(powerlift$Deadlift1Kg, which(powerlift$Deadlift1Kg < 0), NA)
powerlift$Bench <- replace(powerlift$Bench1Kg, which(powerlift$Bench1Kg < 0), NA)
powerlift$Squat<- replace(powerlift$Squat1Kg, which(powerlift$Squat1Kg < 0), NA)

#
#Histogram and summary stats of female deadlifts (explanatory)
#
hist(powerlift$Deadlift,
     main = "Female Deadlift (kg)",
     xlab = "Weight (kg)")
summary(powerlift$Deadlift)
sd(powerlift$Deadlift, na.rm = TRUE)
#
#Histogram and summary stats of female bench (response) 
#
hist(powerlift$Bench,
     main = "Female Bench (kg)",
     xlab = "Weight (kg)")
summary(powerlift$Bench)
sd(powerlift$Bench, na.rm = TRUE)
#
#Histogram and summary stats of female squat (explanatory)
#
hist(powerlift$Squat,
     main = "Female Squat (kg)",
     xlab = "Weight (kg)")
summary(powerlift$Squat)
sd(powerlift$Squat, na.rm = TRUE)
#
#Histogram and summary stats of female bodyweight in kg (explanatory)
#
hist(powerlift$BodyweightKg,
     main = "Female Bodyweight (kg)",
     xlab = "Weight (kg)")
summary(powerlift$BodyweightKg)
sd(powerlift$BodyweightKg, na.rm = TRUE)
#
#Histogram and summary stats of female age (explanatory)
#
hist(powerlift$Age,
     main = "Histogram of Female Age ",
     xlab = "Age (Years)")
summary(powerlift$Age)
sd(powerlift$Age, na.rm = TRUE)
#
#Side by side boxplot and summary stats for equipment used and bench 
#
boxplot(powerlift$Bench~powerlift$Equipment,
        horizontal = TRUE,
        main = "Boxplot of Bench Weight by Equipment",
        xlab = "Weight (kg)",
        ylab = "Equipment")
by(powerlift$Bench, powerlift$Equipment, summary)
by(powerlift$Bench, powerlift$Equipment, sd, na.rm = TRUE)
#
#Scatterplot matrix on numerical variables
#
temp_powerlift=subset(powerlift, select = c(Deadlift,Squat,Bench,BodyweightKg,Age))
pairs(temp_powerlift) 
#
#Correlation matrix on numerical variables
#
cor(temp_powerlift,use="complete.obs")

#
#Multiple Linear regression on all elected explanatory variables model 1 and summary
#
model1 = lm(Bench~Deadlift+Squat+BodyweightKg+Equipment+Age,data = powerlift, na.action = na.exclude)
summary(model1)
#
#SVAs model 1 
#
require(car)
#
#QQplot check for normality 
#
qqPlot(resid(model1),
main = "Normal Quantile Plot for Model 1")
#
#Residual plot of fitted explanatory numerical values 
#
plot(resid(model1)~fitted(model1), data = powerlift,
     main = "Resid Plot of Fitted Values for Model 1",
     xlab = "Fitted Values")
abline(h = 0)
#
#Residual plots of numerical explanatory variables deadlift, squat, and bodyweight, respectively 
#
plot(resid(model1)~ Deadlift, data = powerlift,
     main = "Resid Plot of Deadlift for Model 1",
     xlab = "Deadlift (kg)")
abline(h=0)
plot(resid(model1)~ Squat, data = powerlift,
     main = "Resid Plot of Squat for Model 1",
     xlab = "Squat (kg)")
abline(h=0)
plot(resid(model1)~ BodyweightKg, data = powerlift,
     main = "Resid Plot of Bodyweight for Model 1",
     xlab = "Bodyweight (kg)")
abline(h=0)
plot(resid(model1)~ Age, data = powerlift,
     main = "Resid Plot of Age for Model 1",
     xlab = "Age (years)")
abline(h=0)

#
#Stripchart of categorical explanatory variables Equipment
#
stripchart(resid(model1)~Equipment, data = powerlift,
           vertical = TRUE, jitter = TRUE,
           main = "Stripchart of Equipment for Model 1",
           xlab = "Equipment Type")
abline(h=0)
#
#Check multicollinearity
#
require(DAAG)
vif(model1)
#
#Multi Linear Regression  model 2 
#
model2<-lm(Bench~Squat+Deadlift, data = powerlift, na.action = na.exclude)
summary(model2)
#
#SVAs model 2 
#QQplot check for normality 
#
qqPlot(resid(model2),
       main = "Normal Quantile Plot for Model 2")
#
#Residual plot of fitted explanatory numerical values 
#
plot(resid(model2)~fitted(model2), data = powerlift,
     main = "Resid Plot of Fitted Values for Model 2")
abline(h = 0)
#
#Residual plots of numerical explanatory variables deadlift, squat, and bodyweight, respectively 
#
plot(resid(model2)~ Deadlift, data = powerlift,
     main = "Resid Plot of Deadlift for Model 2",
     xlab = "Deadlift (kg)")
abline (h=0)
plot(resid(model2)~ Squat, data = powerlift,
     main = "Resid Plot of Squat for Model 2",
     xlab = "Squat (kg)")
abline (h=0)
#
#Check multicollinearity
#
vif(model2)
#
#Simple Linear model 3 Bench~Squat and summary
#
model3 = lm(Bench~Squat, data = powerlift, na.action = na.exclude)
summary(model3)
#
#Scatterplot of bench vs squat
#
plot(powerlift$Bench~powerlift$Squat,
     main = "Scatterplot of Bench vs Squat",
     xlab = "Squat (kg)",
     ylab = "Bench (kg)")
abline(model3)
#
#SVAs model 3
#QQPlot for normality
#

qqPlot(residuals(model3),
       main = "Normal Quantile Plot of Model 3 ")
#
#Residual plot 
#
plot(resid(model3)~powerlift$Squat,
     main = "Resid Plot of Squat for Model 3",
     xlab = "Squat (kg)")
abline(h=0)
#
#Check AIC of all 3 models
#
AIC(model1, model2, model3)
#
#make new data frame
#
newData = data.frame(Squat = 159)

#Make estimates for the mean and individual Bench 
predict(model3, new = newData, interval = "confidence")
predict(model3, new = newData, interval = "prediction")

#
#End of Script 
#
    