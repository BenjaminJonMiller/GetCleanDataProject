GetCleanDataProject
===================
#set working directory where smartphone fit data are located
setwd("C:/Users/Benjamin/Coursera/DataScience/GettingAndCleaningData/CourseProject/UCI HAR Dataset")

#read data into R from train and test sets
#trainX <- read.table("./train/X_train.txt")
#trainY <- read.table("./train/y_train.txt")
#trainSub <- read.table("./train/subject_train.txt")
#testX <- read.table("./test/X_test.txt")
#testY <- read.table("./test/y_test.txt")
#testSub <- read.table("./test/subject_test.txt")

#create data frame that includes all test data, subjects and activities 
#called testdf
testdf <- data.frame(matrix(nrow = 2947, ncol = 3))
testdf$X1 <- "Test"
testdf$X2 <- testSub[[1]]
testdf$X3 <- testY[[1]]
testdf <- cbind(testdf, testX)

#name testdf columns using values from features.txt
features <- read.table("./features.txt")
featurenames <- as.character(features[[2]])
colnames(testdf) <- c("TestOrTrain", "Subject", "Activity", featurenames)

#create data frame that includes all training data, subjects and activities 
#called traindf and merge with testdf to create masterdf
traindf <- data.frame(matrix(nrow = 7352, ncol = 3))
traindf$X1 <- "Train"
traindf$X2 <- trainSub[[1]]
traindf$X3 <- trainY[[1]]
traindf <- cbind(traindf, trainX)
colnames(traindf) <- c("TestOrTrain", "Subject", "Activity", featurenames)
masterdf <- rbind(testdf, traindf)

#get activity labels and name the activities in the dataset with the descriptors
#instead of integer codes
activityfile <- read.table("./activity_labels.txt")
activities <- activityfile$V2
activities <- as.character(activities)
activitycodes <- masterdf$Activity
for (i in 1:nrow(masterdf)) {
      masterdf$Activity[i] <- activities[activitycodes[i]]
}

#Extract only the measurements on the mean and standard deviation 
#for each measurement by pattern matching and creates new data frame
#called df4
df2 <- masterdf[, grep("mean|std", colnames(masterdf), ignore.case = T)]
df3 <- masterdf[,1:3]
df4 <- cbind(df3, df2)
