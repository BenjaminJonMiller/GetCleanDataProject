#set working directory where smartphone fit data are located
setwd("C:/Users/Benjamin/Coursera/DataScience/GettingAndCleaningData/CourseProject/UCI HAR Dataset")

#read data into R from train and test sets
trainX <- read.table("./train/X_train.txt")
trainY <- read.table("./train/y_train.txt")
trainSub <- read.table("./train/subject_train.txt")
testX <- read.table("./test/X_test.txt")
testY <- read.table("./test/y_test.txt")
testSub <- read.table("./test/subject_test.txt")

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

#orders df4 based on subject(dominant) and activity to create df5
df5 <- df4[order(df4$Subject, df4$Activity),]

#Averages of each variable for each activity and each subject and appends to tidydf
tidydf <- data.frame(matrix(nrow = 0, ncol = 88))
count <- 1
for (n in 1:30) {
      for (m in 1:6){
            dftemp <- df5[df5$Subject == n & df5$Activity == activities[m],]
            x <- sapply(dftemp[,4:89], mean)
            tidydf[count, 1] <- n
            tidydf[count, 2] <- activities[m]
            tidydf[count, 3:88] <- x
            count <- count + 1
      }
}

#names tidydf variables and writes tidydf to a text file in working dir
colnames(tidydf) <- c("Subject", "Activity", paste("MEAN_", names(x), sep=""))
write.table(tidydf, "./tidydf.txt", sep="\t")