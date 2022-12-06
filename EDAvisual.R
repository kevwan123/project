#Note: Incomplete, to be expanded upon in the future
library(tidyverse)
library(tidyr)
library(MASS)
library(stats)
library(tibble)
library(dplyr)
#library(data.table)
library(mgcv)
library(ggplot2)

setwd("C:/Users/kevwa/Desktop/BIOS611/project")
data = read.csv("brain_stroke.csv")
#summary(data)

#plot(data)
data$smoking_status = as.factor(data$smoking_status)
data$work_type = as.factor(data$work_type)
data$Residence_type = as.factor(data$Residence_type)
data$gender = as.factor(data$gender)
data$ever_married = as.factor(data$ever_married)
#summary(data)

numerics = c("age","hypertension", "heart_disease", "avg_glucose_level", "bmi","stroke")
#cor(data[,numerics]) %>% round(digits = 2)


jpeg("outputs/scatters.jpeg")
plot(data)
dev.off()

jpeg("outputs/byage.jpeg")
boxplot(data$age~data$stroke, xlab = "testingtesting")
dev.off()

jpeg("outputs/byglucose.jpeg")
boxplot(data$avg_glucose_level~data$stroke)
dev.off()

jpeg("outputs/bybmi.jpeg")
boxplot(data$bmi~data$stroke)
dev.off()


# numdata = data[,numerics]
# pca = prcomp(numdata)
# plot(pca$sdev)

jpeg("outputs/variancebycomponents.jpeg")
plot(pca$sdev)
dev.off()

jpeg("outputs/glmage.jpeg")
plot(stroke~age, xlab = "age", ylab = "probability of stroke")
fitage = glm(stroke ~ age, family = binomial, data = data)
lines(sort(fitted.values(fitage))~sort(age), type = "l", col = "red")
dev.off()


jpeg("outputs/glmage.jpeg")
plot(stroke~age, xlab = "age", ylab = "probability of stroke")

fitage = glm(stroke ~ age, family = binomial, data = data)
smm = summary(fitage)
smm$coefficients
lines(sort(fitted.values(fitage))~sort(age), type = "l", col = "red")
dev.off()


jpeg("outputs/histage.jpeg")
hist(age)
dev.off()




jpeg("outputs/glmbmi.jpeg")
plot(stroke~bmi, xlab = "bmi", ylab = "probability of stroke")

fitage = glm(stroke ~ bmi, family = binomial, data = data)
summary(fitage)$coefficients
lines(sort(fitted.values(fitage))~sort(bmi), type = "l", col = "red")
dev.off()




jpeg("outputs/glmglucose.jpeg")
plot(stroke~avg_glucose_level, xlab = "average glucose level", ylab = "probability of stroke")

fitage = glm(stroke ~ avg_glucose_level, family = binomial, data = data)
summary(fitage)$coefficients
lines(sort(fitted.values(fitage))~sort(avg_glucose_level), type = "l", col = "red")
dev.off()




jpeg("outputs/barplotsmokingstatus.jpeg")
tab = data %>% group_by(smoking_status,stroke) %>% tally()
s = tab %>% filter(stroke == 1)
ns = tab %>% filter(stroke == 0)

s
ns
props = s$n/(s$n+ns$n)
barplot(s$n/(s$n+ns$n)~s$smoking_status, xlab = "status", ylab = "probability of stroke")
dev.off()




jpeg("outputs/barplothypertensionheartdisease.jpeg")
tab = data %>% group_by(hypertension,heart_disease,stroke) %>% tally()
sp = tab %>% filter(stroke == 1)
sn = tab %>% filter(stroke == 0)
prev = sp$n/(sp$n+sn$n)
barplot(prev~c("none",
               "heart disease",
               "hypertension",
               "both"), xlab = "status", ylab = "probability of stroke")
dev.off()

pca = prcomp(numdata)
#plot(pca$sdev)


jpeg("outputs/pca12.jpeg")
plot(pca$x[,1]~pca$x[,2], xlab = "PC1", ylab = "PC2")
dev.off()
jpeg("outputs/pca23.jpeg")
plot(pca$x[,2]~pca$x[,3], xlab = "PC2", ylab = "PC3")
dev.off()
jpeg("outputs/pca13.jpeg")
plot(pca$x[,1]~pca$x[,3], xlab = "PC1", ylab = "PC3")
dev.off()



reduced = read.csv("outputs/reduced.csv")

library("Rtsne")
jpeg("outputs/tsne_numericalonly.jpeg")
out = Rtsne(numdata,pca=TRUE)
plot(out$Y)
dev.off()

getwd()

jpeg("outputs/tsne_reduceddata.jpeg")
out = Rtsne(reduced,pca=TRUE)
plot(out$Y)
dev.off()

