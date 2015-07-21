
##The script run_analysis.R does the following:
* Merges the training and the test sets to create one data set
* Extracts only the measurements on the mean and standard deviation for each measurement
* Uses activity names to name the activities in the data set
* Labels the data set with descriptive variable names
* From the data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject

## You should install 'dplyr' package to perform the analysis with the script.
The additional information about script working is availible in the script comment lines.

## Describing the data set and variables:  
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. The obtained dataset has been randomly partitioned into two sets,
where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The features selected for this set come from the accelerometer and gyroscope. 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ - body acceleration signals, from accelerometer
* tGravityAcc-XYZ - gravity acceleration signals, from accelerometer
* tBodyAccJerk-XYZ - body linear acceleration Jerk signals, from accelerometer
* tBodyGyro-XYZ - body angular velocity, from gyroscope
* tBodyGyroJerk-XYZ - body angular velocity Jerk signals, from gyroscope
* tBodyAccMag - magnitude of body acceleration signals
* tGravityAccMag - magnitude of gravity acceleration signals
* tBodyAccJerkMag - magnintude of body linear acceleration Jerk signals
* tBodyGyroMag - magnitude of body angular velocity
* tBodyGyroJerkMag - magnitude of body angular velocity Jerk signals
* fBodyAcc-XYZ - Fast Fourier Transform (FFT) of body acceleration signals
* fBodyAccJerk-XYZ - FFT of body linear acceleration Jerk signal
* fBodyGyro-XYZ - FFT of body angular velocity
* fBodyAccMag - FFT of magnitude of body acceleration signals
* fBodyAccJerkMag - FFT of magnintude of body linear acceleration Jerk signals
* fBodyGyroMag - FFT of magnitude of body angular velocity
* fBodyGyroJerkMag - FFT of magnitude of body angular velocity Jerk signals

The set of variables that were estimated from these signals are: 
* mean(): Mean value
* std(): Standard deviation
