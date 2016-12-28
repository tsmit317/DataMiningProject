setwd("~/Downloads/ITCS3162_Project")
combine <- data.frame()
combine <- read.csv("combine.csv", header = TRUE)
#Check to make sure csv was read
str(combine)

#Remove colunms dont need
combine<- subset(combine, select = c("year","heightfeet", "heightinches", "heightinchestotal", "weight","fortyyd","twentyss","threecone","vertical","broad","bench","pickround","nflgrade"))


#Check for null values
combine<-combine[which(combine$weight != 0),]
combine<-combine[which(combine$fortyyd != 0),]
combine <- combine[combine$bench !=0,]
combine<-combine[which(combine$nflgrade != 0),]

combine <- combine[!is.na(combine$nflgrade),]

#Get Train and Test 
rowSize <- nrow(combine)
testSize <- .2*rowSize
testI <- sample(1:rowSize, size = testSize)
test <- combine[testI,]
train <- combine[-testI,]

#Check train and test
str(train)
str(test)

#Get The Mean
mean(train$fortyyd)

#Plot weight vs forty time
plot(fortyyd~weight, data=train, main="Training Set Regression Model")
cor(train$fortyyd, train$weight)

#Create linear regression model
trainmodel <-lm(fortyyd~weight, data=train)

#View the model (different views)
trainmodel
summary(trainmodel)

#Add the model to the plot
abline(trainmodel, col="green")

#Get Y-intercept and slope
yintercept<-coefficients(trainmodel)[[1]]
slope<-coefficients(trainmodel)[[2]]

#Prediction Equation
#Could also use the predict() function
findforty<- function(w){ return(yintercept + (slope * w)) }

#Apply to test set
expectedforty<-lapply(test$weight, findforty)

#create df to hold results
testresult <- data.frame()
testresult <- cbind(test, unlist(expectedforty))
names(testresult)[[14]]<-c("pforty")
str(testresult)

#Sum of Squares

#Find SSE, SST, SSR
sse <-sum((testresult$fortyyd-testresult$pforty)^2)
sst<-sum((testresult$fortyyd-median(train$fortyyd))^2)
ssr<-(sst-sse)
#find R2 and display in console
r2<-ssr/sst
r2



