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


tiff("outputs/scatters.tiff")
plot(data)
dev.off()

tiff("outputs/byage.tiff")
boxplot(data$age~data$stroke)
dev.off()

tiff("outputs/byglucose.tiff")
boxplot(data$avg_glucose_level~data$stroke)
dev.off()

tiff("outputs/bybmi.tiff")
boxplot(data$bmi~data$stroke)
dev.off()


numdata = data[,numerics]
pca = prcomp(numdata)
plot(pca$sdev)

tiff("outputs/variancebycomponents.tiff")
plot(pca$sdev)
dev.off()


#library("Rtsne")
#tiff("outputs/tsne.tiff")
#out = Rtsne(numdata,pca=TRUE)
#plot(out$Y)
#dev.off()
