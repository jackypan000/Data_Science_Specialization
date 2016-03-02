## Packages we need to process and tidy the raw data
library(dplyr)
library(reshape2)

## Download the data from web
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "getdata-projectfiles-UCI HAR Dataset.zip", method = "curl")

## Read the data of subjects, features and activity labels from training set and test set
unzip("getdata-projectfiles-UCI HAR Dataset.zip")
train <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = "numeric")
test <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses = "numeric")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
train_act <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "ActivityName")
test_act <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "ActivityName")
feature_name <- read.table("./UCI HAR Dataset/features.txt", colClasses = "character")
activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("ClassLabels", "ActivityName"), stringsAsFactors = FALSE)

## Merge the training and the test sets to create one data set.
merge_data <- rbind(train, test)

## Labels the dataset with each measurement (feature name)
# Label the data excluding the duplicate column names
names(merge_data) <- feature_name[ ,2]
merge_data <- merge_data[, !duplicated(names(merge_data))]

# You can also make the duplicate column names valid through `make.names` to force column unique.  
# names(total) <- make.names(names = feature_name[, 2], unique = TRUE, allow_ = TRUE)
# See the method on stackoverflow: http://stackoverflow.com/a/28576595

## Extracts only the measurements on the mean and standard deviation for each measurement
data_set <- select(merge_data, matches("(mean|std)\\(.*\\)"))

## Append the Subject & Activity Name columns to new data frame
Act_Col <- rbind(train_act, test_act)
Sub_Col <- rbind(train_subject, test_subject)
data_set <- cbind(Sub_Col, Act_Col, data_set)

## Uses descriptive activity names to name the activities in the data set
data_set$ActivityName <- activity_label[match(data_set$ActivityName, activity_label$ClassLabels), 'ActivityName']
# Reference: http://stackoverflow.com/a/10158737

## Appropriately labels the data set with descriptive variable names.
names(data_set) <- gsub("std\\(.*\\)", "Std", names(data_set))
names(data_set) <- gsub("mean\\(.*\\)", "Mean", names(data_set))
names(data_set) <- gsub("^t", "Time.", names(data_set))
names(data_set) <- gsub("^f", "FFT.", names(data_set))

## Independent tidy data set with the average of each variable for each activity and each subject.
data_melt <- melt(data_set, id = c("Subject", "ActivityName"))
tidy_data <- dcast(data_melt, Subject + ActivityName ~ variable, mean)
write.table(tidy_data, "tidy_data.txt", sep = "\t", quote = FALSE, row.names = FALSE)