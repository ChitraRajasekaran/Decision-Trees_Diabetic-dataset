#load the data into R
head(diabet)

#divide the data into training and testing datasets
split<-sample.split(diabet, SplitRatio = 0.7)
training<-subset(diabet, split == 'TRUE')
testing<-subset(diabet, split == 'FALSE')

