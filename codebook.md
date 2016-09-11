Getting and Cleaning Data Course Project is to create one R script called run_analysis.R that does the following:

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names.
    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
    Study was is "Human Activity Recognition Using Smartphones Dataset" and done by:
    ==================================================================
    Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
    Smartlab - Non Linear Complex Systems Laboratory
    DITEN - Università degli Studi di Genova.
    Via Opera Pia 11A, I-16145, Genoa, Italy.
    activityrecognition@smartlab.ws
    www.smartlab.ws
    ==================================================================

    Sampling information: 
    The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
    Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
    wearing a smartphone (Samsung Galaxy S II) on the waist. The obtained dataset has been randomly 
    partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
    
    Technical information about the files themselves: number of observations, record length, number of records per observation, etc.
    FUCIHARDataset.zip downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    
    unziped structure and files:
    'UCI HAR Dataset/activity_labels.txt'
    'UCI HAR Dataset/features.txt'
    'UCI HAR Dataset/features_info.txt'
    'UCI HAR Dataset/README.txt'
    'UCI HAR Dataset/test/Inertial Signals'/
    'UCI HAR Dataset/test/subject_test.txt'
    'UCI HAR Dataset/test/X_test.txt'
    'UCI HAR Dataset/test/y_test.txt'
    'UCI HAR Dataset/train/Inertial Signals'/
    'UCI HAR Dataset/train/subject_train.txt'
    'UCI HAR Dataset/train/tidydata.txt'
    'UCI HAR Dataset/train/X_train.txt'
    'UCI HAR Dataset/train/y_train.txt'

The input data is split into two subsets: a training data set and a test data set. 
Each consists of three files:

    - features file, X_test.txt and X_train.txt, with one feature vector per row
    - label with one activity label per row, y_train.txt and y_test.txt
    - file with a subject id per row, subject_train.txt and subject_test.txt

The names of the features are listed in the file features.txt.
The file activity_labels.txt links the class labels with their activity name.
Note: The Inertial data was not used for this data set.

tidy data set is 180 observations with 81 variables

 [1] "subjectId"                                         
 [2] "activity"                                          
 [3] "timeBodyAccelerometer.mean...X"                    
 [4] "timeBodyAccelerometer.mean...Y"                    
 [5] "timeBodyAccelerometer.mean...Z"                    
 [6] "timeBodyAccelerometer.std...X"                     
 [7] "timeBodyAccelerometer.std...Y"                     
 [8] "timeBodyAccelerometer.std...Z"                     
 [9] "timeGravityAccelerometer.mean...X"                 
[10] "timeGravityAccelerometer.mean...Y"                 
[11] "timeGravityAccelerometer.mean...Z"                 
[12] "timeGravityAccelerometer.std...X"                  
[13] "timeGravityAccelerometer.std...Y"                  
[14] "timeGravityAccelerometer.std...Z"                  
[15] "timeBodyAccelerometerJerk.mean...X"                
[16] "timeBodyAccelerometerJerk.mean...Y"                
[17] "timeBodyAccelerometerJerk.mean...Z"                
[18] "timeBodyAccelerometerJerk.std...X"                 
[19] "timeBodyAccelerometerJerk.std...Y"                 
[20] "timeBodyAccelerometerJerk.std...Z"                 
[21] "timeBodyGyroscope.mean...X"                        
[22] "timeBodyGyroscope.mean...Y"                        
[23] "timeBodyGyroscope.mean...Z"                        
[24] "timeBodyGyroscope.std...X"                         
[25] "timeBodyGyroscope.std...Y"                         
[26] "timeBodyGyroscope.std...Z"                         
[27] "timeBodyGyroscopeJerk.mean...X"                    
[28] "timeBodyGyroscopeJerk.mean...Y"                    
[29] "timeBodyGyroscopeJerk.mean...Z"                    
[30] "timeBodyGyroscopeJerk.std...X"                     
[31] "timeBodyGyroscopeJerk.std...Y"                     
[32] "timeBodyGyroscopeJerk.std...Z"                     
[33] "timeBodyAccelerometerMagnitude.mean.."             
[34] "timeBodyAccelerometerMagnitude.std.."              
[35] "timeGravityAccelerometerMagnitude.mean.."          
[36] "timeGravityAccelerometerMagnitude.std.."           
[37] "timeBodyAccelerometerJerkMagnitude.mean.."         
[38] "timeBodyAccelerometerJerkMagnitude.std.."          
[39] "timeBodyGyroscopeMagnitude.mean.."                 
[40] "timeBodyGyroscopeMagnitude.std.."                  
[41] "timeBodyGyroscopeJerkMagnitude.mean.."             
[42] "timeBodyGyroscopeJerkMagnitude.std.."              
[43] "frequencyBodyAccelerometer.mean...X"               
[44] "frequencyBodyAccelerometer.mean...Y"               
[45] "frequencyBodyAccelerometer.mean...Z"               
[46] "frequencyBodyAccelerometer.std...X"                
[47] "frequencyBodyAccelerometer.std...Y"                
[48] "frequencyBodyAccelerometer.std...Z"                
[49] "frequencyBodyAccelerometer.meanFreq...X"           
[50] "frequencyBodyAccelerometer.meanFreq...Y"           
[51] "frequencyBodyAccelerometer.meanFreq...Z"           
[52] "frequencyBodyAccelerometerJerk.mean...X"           
[53] "frequencyBodyAccelerometerJerk.mean...Y"           
[54] "frequencyBodyAccelerometerJerk.mean...Z"           
[55] "frequencyBodyAccelerometerJerk.std...X"            
[56] "frequencyBodyAccelerometerJerk.std...Y"            
[57] "frequencyBodyAccelerometerJerk.std...Z"            
[58] "frequencyBodyAccelerometerJerk.meanFreq...X"       
[59] "frequencyBodyAccelerometerJerk.meanFreq...Y"       
[60] "frequencyBodyAccelerometerJerk.meanFreq...Z"       
[61] "frequencyBodyGyroscope.mean...X"                   
[62] "frequencyBodyGyroscope.mean...Y"                   
[63] "frequencyBodyGyroscope.mean...Z"                   
[64] "frequencyBodyGyroscope.std...X"                    
[65] "frequencyBodyGyroscope.std...Y"                    
[66] "frequencyBodyGyroscope.std...Z"                    
[67] "frequencyBodyGyroscope.meanFreq...X"               
[68] "frequencyBodyGyroscope.meanFreq...Y"               
[69] "frequencyBodyGyroscope.meanFreq...Z"               
[70] "frequencyBodyAccelerometerMagnitude.mean.."        
[71] "frequencyBodyAccelerometerMagnitude.std.."         
[72] "frequencyBodyAccelerometerMagnitude.meanFreq.."    
[73] "frequencyBodyAccelerometerJerkMagnitude.mean.."    
[74] "frequencyBodyAccelerometerJerkMagnitude.std.."     
[75] "frequencyBodyAccelerometerJerkMagnitude.meanFreq.."
[76] "frequencyBodyGyroscopeMagnitude.mean.."            
[77] "frequencyBodyGyroscopeMagnitude.std.."             
[78] "frequencyBodyGyroscopeMagnitude.meanFreq.."        
[79] "frequencyBodyGyroscopeJerkMagnitude.mean.."        
[80] "frequencyBodyGyroscopeJerkMagnitude.std.."         
[81] "frequencyBodyGyroscopeJerkMagnitude.meanFreq.."  
	
Transformations

To compute the mean values for the features, the input data was grouped by column 1 and column 2. 
Afterwards the mean for each feature variable per group was computed.

The activity ids were converted to readable activity descriptions by loading the activity descriptions 
from the file "activity_labels.txt" provieded with the input data.
