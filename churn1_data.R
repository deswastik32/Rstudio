rm(list = ls())
library(caTools)
setwd("F:/msc sem2/multivariate")
A=read.csv("churn1_data.csv")
A
churn_data=(A)
head(churn_data)
is.na(churn_data)
sum(is.na(churn_data))=0
names(churn_data)
str(churn_data)
churn_data1=churn_data[-c(1,2,3)]
head(churn_data1)
smp_sz=floor(0.7*nrow(churn_data1))
train_ind=(sample(seq_len(nrow(churn_data1)),size=smp_sz))
train=churn_data1[train_ind,]
train
test=churn_data1[-train_ind]
model=glm(churn~.,data=train,family="binomial")
summary(model)
pred=predict(model,train,type = "response")
pred
pred1=ifelse(pred>0.5,1,0)
pred1=data.frame(pred1)
pred1