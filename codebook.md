Codebook
========
The Codebook was created on 16th April 2014 and describes the variables, 
the data, transformations or any work performed on the source data. 

Source Data
===========
The source data used to generate the final data tidy data sets "tidy1.txt" and "tidy2.txt" 
in this repository were downloaded on 16th Oct. 2014 from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip". 
A full description of the source data is available at the site:
"http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"


Description and Transformation of the Variables
===============================================
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

The data do contain as well the ID of the subjects ie. the person whose activities were analysed 
for each window sample and the activity that was performed.  

Work Performed On The Source Data 
=================================
The major process steps to transform the source data to the tidy data set for the project were:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
2. Uses descriptive activity names to name the activities in the data set
3. Appropriately labels the data set with descriptive activity names. 
4. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

After the source dataset was downloaded to the R working directory as 
"getdata_projectfiles_UCI HAR Dataset.zip",
the training and test sets as wella s the activity_labels and feature names were loaded into R.

After step 1 the merged training and test set contained 10299 observations and 563 columns.

The extraction of the mean and standard deviation in step 2 reduced the dataframe to only 81 columns  including the subject id and the activity.

Using descriptive activity names to name the activities in the data set and appropriately labeling the data set with descriptive activity names were acheived in step 2 and 3.

In addition the id of the subject was converted to a factor.

The tidy comma separated dataset with the mean and standard deviation variables as well as the subject id and the activity were stored into the working directoy as "tidy1.txt". 

In step 4 a second, independent tidy data set with the average of each variable for each activity and each subject was created and stored into the working directoy as "tidy2.txt", This dataframe contains still 81 columns, but was reduced to 180 observations due to the averaging of the variables.

Script run_analysis.R
=====================
The script "run_analysis.R" can be used to perform all the work described as above.
The script was developed and tested on R i386 3.0.3.
 


