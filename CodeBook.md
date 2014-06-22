##CodeBook
#Code book that describes the variables, the data, and any transformations or work that were performed to clean up the data
=======================
#Link to original incoming data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Script Variables
TRAINING DATA 

trainX: incoming training dataset that has 561 variables and 7352 observations without headers 

trainY: incoming training activity dataset that has 1 variable and 7352 observations without headers.  Data are integer codes representing a specific activity 

trainSub: incoming subject id dataset that has one id variable and 7352 observations.  Subject id's 1:30

TEST DATA 

testX: incoming training dataset that has 561 variables and 2947 observations without headers 

testY: incoming training activity dataset that has 1 variable and 2947 observations without headers.  Data are integer codes      representing a specific activity 

testSub: incoming subject id dataset that has one id variable and 2947 observations.  Subject id's 1:30

DATA FRAMES 

testdf: test data labeled with feature headers, which are the variables measured during testing.  The activity codes (1-6) were replaced with the corresponding activity descriptor.  An additional variable "TestOrTrain" was added for each observation.  The TestOrTrain column data were populated with the character "Test"

traindf: training data labeled with feature headers, which are the variables measured during testing.  The activity codes (1-6) were replaced with the corresponding activity descriptor.  An additional variable "TestOrTrain" was added for each observation.  The TestOrTrain column data were populated with the character "Train"

masterdf:  addition of traindf to end of testdf by rbind.  This created a master data frame with 564 variables and 10299 observations

df2: subset of masterdf where only the columns that contain mean or standard deviation measuremenst were included

df3: subset of first three columns of masterdf, which include TestOrTrain, Subject, and Activity data

df4: merge of df2 and df3 by cbind


#masterdf variables
TestOrTrain: categorical variable indicating Test or Train

Subject: Subject ID (1-30)

Activity: categorical variable indicating activity being performed 6 categories

Columns 4-564:  see following features information from features_info.txt

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag


The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values.

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean


The complete list of variables of each feature vector is available in 'features.txt'






