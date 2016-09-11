## run_analysis.R
## 
## This script transforms the UCI Human Activity Recognition Using 
## Smartphones Dataset in a way that satisfies the following requirements:
##
## You should create one R script called run_analysis.R that does the following
## 1) Merges the training and the test sets to create one data set.
## 2) Extracts only the measurements on the mean and standard deviation for 
##    each measurement. 
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive variable names. 
## 5) From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.
##
## The script assumes that the extracted dataset can be found in the current 
## working directory, i.e. the current working directory contains the folder
## "UCI HAR Dataset".
##
## The transformed data is written to a file called "tidy_data.txt". This
## file can be read into a data.frame via read.table("tidy_data.txt", header = T).

# load needed libraries
library(data.table)
library(dplyr)
library(plyr)

# download the data and unzip
	zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(zipURL, destfile = "./data/FUCIHARDataset.zip")
	unzip("./data/FUCIHARDataset.zip")

# change directory to the root
setwd("UCI HAR Dataset")

# read into tables for the features and activity labels found at root
	features <- read.table("features.txt")
	activityLabels <- read.table("activity_labels.txt")

# set the column names for activityLabels
		colnames(activityLabels) <- c("activityID", "activity")

# change directory to test
setwd("test")

# read into tables for the test data results
	Xtest <- read.table("X_test.txt")
	Ytest <- read.table("y_test.txt")
	subjectTest <- read.table("subject_test.txt")
# set the column names for the subjectTest, Xtest, Ytest
		colnames(subjectTest) <- "subjectId"
		colnames(Xtest) <- features$V2
		colnames(Ytest) <- "activity"

# combine the data into single test data set
	dataShareTest <- bind_cols(Ytest, Xtest)
	dataShareTest <- bind_cols(subjectTest, dataShareTest)

# change directory to the train data
setwd("../train")

# read into tables for the train data results
	Xtrain <- read.table("X_train.txt")
	Ytrain <- read.table("y_train.txt")
	subjectTrain <- read.table("subject_train.txt")
# set the column names for the subjectTrain, Xtrain, Ytrain
		colnames(subjectTrain) <- "subjectId"
		colnames(Xtrain) <- features$V2
		colnames(Ytrain) <- "activity"

# combine the data into single train data set
	dataShareTrain <- bind_cols(Ytrain, Xtrain)
	dataShareTrain <- bind_cols(subjectTrain, dataShareTrain)

# combine the test data and the train data
alldata <- bind_rows(dataShareTest, dataShareTrain)

# get which columns contain "mean()" or "std()"
meanStdfeatures <- grepl("mean|std", names(alldata))

# include subjectId and activity columns
	meanStdfeatures[1:2] <- TRUE

# remove unnecessary columns
	alldata <- alldata[, meanStdfeatures]

# factorize and set the activity labels
	alldata$activity <- factor(alldata$activity);
	alldata$activity <- factor(alldata$activity,labels=as.character(activityLabels$activity))

# clean up the column names to attempt to make readable
	names(alldata)<-gsub("^t", "time", names(alldata))
	names(alldata)<-gsub("^f", "frequency", names(alldata))
	names(alldata)<-gsub("Acc", "Accelerometer", names(alldata))
	names(alldata)<-gsub("Gyro", "Gyroscope", names(alldata))
	names(alldata)<-gsub("Mag", "Magnitude", names(alldata))
	names(alldata)<-gsub("BodyBody", "Body", names(alldata))

# Creates a second,independent tidy data set and ouput it with the average 
# of each variable for each activity and each subject 
	alldata_avg <- aggregate(. ~subjectId + activity, alldata, mean)
	alldata_avg <- alldata_avg[order(alldata_avg$subjectId,alldata_avg$activity),]
# and ouput it
	write.table(alldata_avg, file = "tidydata.txt",row.name=FALSE)