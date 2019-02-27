#install.packages("arules")
#install.packages("arulesViz")
library("arules")
library("arulesViz")
library("datasets")
rm(list = ls())
setwd("/Users/manu/Desktop/Fall'18/IST 707/Wk3")
bank<-read.csv("bankdata_csv_all.csv",stringsAsFactors = FALSE, sep = ',')
#removing id number column
bank<-bank[,-1]
#discretizing data or converting data to nominal form
bank$age<-cut(bank$age, breaks = c(0,20,40,60,80,100), labels = c('Child','Young','Adult','Senior','Old'))
bank$income<-cut(bank$income, breaks = 4, labels = c('Low class','Middle class','High class','Rich'))
bank$children<-cut(bank$children, breaks = 4, labels = c('None','One','Two','Three'))
#converting type to factor and making it into transactional data
str(bank)
bank$sex<-as.factor(bank$sex)
bank$region<-as.factor(bank$region)
bank$married<-as.factor(bank$married)
bank$car<-as.factor(bank$car)
bank$save_act<-as.factor(bank$save_act)
bank$current_act<-as.factor(bank$current_act)
bank$mortgage<-as.factor(bank$mortgage)
bank$pep<-as.factor(bank$pep)
str(bank)
trans<-as(bank, "transactions")
#exploring the items frequency set - for 20,25,30 itmes
itemFrequencyPlot(trans, topN=20, type="absolute")
itemFrequencyPlot(trans, topN=25, type="absolute")
itemFrequencyPlot(trans, topN=30, type="absolute")
#generating rules by providing support of 0.1% and confidence of 80%
rules<- apriori(trans, parameter = list(supp=0.001, conf=0.8))
inspect(rules[1:5]) 
#sorting rules based on confidence
rules_top<-sort(rules, by="confidence",decreasing = TRUE)
inspect(rules_top[1:5]) 

#getting top 5 rules based on lift and confidence
rules_top_liftconf<-sort(rules, by=c("lift","confidence"),decreasing = TRUE)
inspect(rules_top_liftconf[1:5]) 

#getting top 5 rules based on lift, confidence, and support
rules_top_all<-sort(rules, by=c("lift","confidence","support"),decreasing = TRUE)
inspect(rules_top_all[1:5]) 


#taking 'PEP-YES' on RHS which is our target that is to see what association will lead the busienss to enroll for PEP
rules_pep_YES<-apriori(data=trans, parameter=list(supp=0.001,conf = 0.08), 
               appearance = list(default="lhs",rhs="pep=YES"),
               control = list(verbose=F))
inspect(rules_pep_YES[1:5])
#getting top 5 rules based in confidence
rules_top_pep<-sort(rules_pep_YES, decreasing=TRUE,by="confidence")
inspect(rules_top_pep[1:5])
#getting top 5 rules based on lift, confidence, and support
rules_top_pep_all<-sort(rules_pep_YES, decreasing=TRUE,by=c("lift","confidence","support"))
inspect(rules_top_pep_all[1:5])
#visualizing the 'PEP-YES' top 20 rules
plot(rules_pep_YES[1:20],method="graph")
