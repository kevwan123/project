#library(tidyverse)
#library(tidyr)
library(MASS)
#library(stats)
#library(tibble)
library(dplyr)

library(mgcv)
#library(ggplot2)

print("Loading the data and printing a simple summary")
data = read.csv("brain_stroke.csv")
fixeddata = data %>% mutate(
  smoking_status = as.factor(smoking_status),
  gender = as.factor(gender),
  hypertension = as.factor(hypertension),
  heart_disease = as.factor(heart_disease),
  ever_married= as.factor(ever_married),
  work_type= as.factor(work_type),
  Residence_type= as.factor(Residence_type)
)

fixeddata = data

write.csv(fixeddata, "derived_data/fixeddata.csv")

summary(data)
is.na(data) %>% sum()

reduceddata = data %>% select("age","bmi","smoking_status","gender","hypertension","heart_disease","avg_glucose_level")
write.csv(reduceddata, file = "derived_data/reduced.csv")


#plot(data)
print("a tiny bit of cleaning and rechecking")
data$smoking_status = as.factor(data$smoking_status)
data$work_type = as.factor(data$work_type)
data$Residence_type = as.factor(data$Residence_type)
data$gender = as.factor(data$gender)
data$ever_married = as.factor(data$ever_married)
summary(data)

numerics = c("age","hypertension", "heart_disease", "avg_glucose_level", "bmi","stroke")
cor(data[,numerics]) %>% round(digits = 2)

# Exploring some Naive models to get a bit of a feel for the data
fit1 = glm(stroke ~ ., family = binomial, data = data)
summary(fit1)

fitcategoricalonly = glm(stroke ~ 
                           gender + hypertension + heart_disease + 
                           ever_married + work_type + 
                           Residence_type + bmi + smoking_status
                           , family = binomial, data = data)
summary(fitcategoricalonly)

fitbase = glm(stroke ~ age+hypertension+avg_glucose_level, family = binomial, data = data)
summary(fitbase)

anova(fitbase,fit1, test = "Chisq")
#anova(fitbase,fit1, test = "F")

paste(names(data), collapse=" + ")
fit2 = gam(stroke ~ 
             gender + s(age) + hypertension + heart_disease + ever_married +
             work_type + Residence_type + s(avg_glucose_level) + s(bmi) + smoking_status
           , family = binomial, data = data)

summary(fit2)



fit_interactions = gam(stroke ~ 
                         s(age) + s(avg_glucose_level) + s(bmi) + ti(age,avg_glucose_level) + 
                         ti(age,bmi)+ti(avg_glucose_level,bmi)
                       , data = data)


summary(fit_interactions)



