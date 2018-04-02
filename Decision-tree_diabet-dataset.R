diabet<-read.csv(file = "/Users/chitrasekar2k5/R work/diabet.txt", head = TRUE, sep = "\t", stringsAsFactors = FALSE)
#load the data into R
head(diabet)

#divide the data into training and testing datasets
set.seed(3)
id<-sample(2,nrow(diabet), prob = c(0.7,0.3), replace = TRUE)
training<- diabet[id == 1,]
testing<- diabet[id ==2,]

#Building decision tree
library("rpart")

model<- rpart(type~., data = training)
#here we are using all columns for our model
model
#we can plot it as
plot(model,margin = 0.2)
#margin is used to adjust the size of the plot for viewing labels
text(model,use.n = TRUE, pretty = TRUE,cex = 0.8)

#how good is this model? we use this model to predict using testing data
pred_d<- predict(model, testing, type = c("class"))
pred_d
testing$type #to check what is the value in the orginal sheet 

#compare it with actual values
library(caret)
confusionMatrix(table(pred_d,testing$type))

# ACCURACY OF THE MODEL = 71.13%
