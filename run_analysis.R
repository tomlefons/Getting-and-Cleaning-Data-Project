# run_analysis.R script
# Peer Assessments Getting and Cleaning Data Project
# You should create one R script called run_analysis.R that does the following. 
#    1. Merges the training and the test sets to create one data set.
#    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#    3. Uses descriptive activity names to name the activities in the data set
#    4. Appropriately labels the data set with descriptive activity names. 
#    5. Creates a second, independent tidy data set with the average of each variable 
#       for each activity and each subject. 
#    0: Other pre-requsites, tasks:
#       The code should have a file run_analysis.R in the main directory 
#       that can be run as long as the Samsung data is in your working directory. 

# 0. Samsung data were downloard into the working directory

# data loading into R 

data <- "getdata_projectfiles_UCI HAR Dataset.zip"
n_activity_labels <- "UCI HAR Dataset/activity_labels.txt"
n_features        <- "UCI HAR Dataset/features.txt"
n_X_train         <- "UCI HAR Dataset/train/X_train.txt"
n_y_train         <- "UCI HAR Dataset/train/y_train.txt"
n_subject_train   <- "UCI HAR Dataset/train/subject_train.txt"
n_X_test          <- "UCI HAR Dataset/test/X_test.txt"
n_y_test          <- "UCI HAR Dataset/test/y_test.txt"
n_subject_test    <- "UCI HAR Dataset/test/subject_test.txt"

activity_labels   <- read.table(unz(data, n_activity_labels), sep="", stringsAsFactors=FALSE)
features          <- read.table(unz(data, n_features), sep="", stringsAsFactors=FALSE)
x_train           <- read.table(unz(data, n_X_train), sep="", col.names = features$V2)
y_train           <- read.table(unz(data, n_y_train), sep="", col.names = "activity")
subject_train     <- read.table(unz(data, n_subject_train), sep="", col.names="id")
x_test            <- read.table(unz(data, n_X_test), sep="", col.names = features$V2)
y_test            <- read.table(unz(data, n_y_test), sep="", col.names = "activity")
subject_test      <- read.table(unz(data, n_subject_test), sep="", col.names="id")

# 1. Merges the training and the test sets to create one data set.
train <- cbind(subject_train, y_train, x_train)
test  <- cbind(subject_test, y_test, x_test)
df    <- rbind(train, test)

# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement.
df_ex <- df[,c(1,2, grep("std", names(df)), grep("mean", names(df)))]

# 3. Uses descriptive activity names to name the activities in the data set
# and 4. Appropriately labels the data set with descriptive activity names. 
df_ex$activity <- factor(df_ex$activity, levels=activity_labels$V1, labels=activity_labels$V2)
df_ex$id <- as.factor(df_ex$id) # id was integer and should be factor

write.table(df_ex, "tidy1.txt", sep=",", row.names=FALSE) 
# tidy1.txt is first tidy data set.

# 5. Creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject. 
table(df_ex$activity) # 6 different activities  
table(df_ex$id)       # 30 different ids.
# 2.dataset will have 330*6= 180 observations i.e. rows.
library(plyr)
df_ex2 <- ddply(df_ex, .(id, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })
colnames(df_ex2)[-c(1:2)] <- paste0("mean_", colnames(df_ex2)[-c(1:2)]) 
dim(df_ex2) 
# confirms 180 rows for 2.dataset

write.table(df_ex2, "tidy2.txt", sep=",", row.names=FALSE) 
# tidy2.txt is second data set.

