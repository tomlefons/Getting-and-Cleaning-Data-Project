Getting-and-Cleaning-Data-Project
=================================

This repo explains how all of the scripts work and how they are connected. 

In detail this repository contains:
- run_analysis.R, the R code to achieve the project 
- codebook.md, which describes the variables, the data, transformations or work performed 
- tidy1.txt, a comma separated first tidy data set produced after the first 4 process steps 
- tidy2.txt, a comma separated first tidy data set produced after 5th process step 

The source data used to generate the final data tidy data sets "tidy1.txt" and "tidy2.txt" 
in this repository were downloaded on 16th Oct. 2014 from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip". 
A full description of the source data is available at the site:
"http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

The major process steps to transform the source data to the tidy data set for the project were:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
2. Uses descriptive activity names to name the activities in the data set
3. Appropriately labels the data set with descriptive activity names. 
4. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

To reproduce the tidy data sets,
download the source data file into the working directory of R
and run the script "run_analysis.R".
