# Getting_and_Cleaning_Data_proj
Getting and Cleaning Data Course Project

The files in this folder provide a solution for the Coursera "Getting And Cleaning Data" course project. The course project works with the "Human Activity Recognition Using Smartphones Dataset" from the UCI Machine Learning Repository. A description of the dataset can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The dataset can be downloaded at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
The Transformation Script run_analysis.R

The file run_analysis.R contains an R script for transforming the original dataset into a second dataset according to the following rules:

You should create one R script called run_analysis.R that does the following:

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names.
    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Running The Script

The script requires the packages dplyr, plyr, and data.table.

To run the script run_analysis.R:
    type source("run_analysis.R") to execute the script

The script will:
        download the data and unzip
        change directory to the root
        read into tables for the features and activity labels found at root
        set the column names for activityLabels
        change directory to test
        read into tables for the test data results
        set the column names for the subjectTest, Xtest, Ytest
        combine the data into single test data set
        change directory to the train data
        read into tables for the train data results
        set the column names for the subjectTrain, Xtrain, Ytrain
        combine the data into single train data set
        combine the test data and the train data
        get which columns contain "mean()" or "std()" and include subjectId and activity columns
        remove unnecessary columns
        factorize and set the activity labels
        clean up the column names to attempt to make readable
        create a second,independent tidy data set and ouput it with the average of each variable for each activity and each subject 
        and ouput it

The file "tidydata.txt" can be read into a data.frame using

read.table("tidydata.txt", header = T)

Folowing the rules of what is tidy dataset: 

    all observations are in rows
    all variables are in columns
    and contained in a single dataset.

