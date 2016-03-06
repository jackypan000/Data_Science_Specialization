## Getting and Cleaning Data - Course Project
### General description about this README
This README is used to explain the `run_analysis.R` clearly and understandably. 

This file includes how to get the raw data, preprocess the data and obtain our final goal: the tidy dataset.



<br>
### 0.Data preparation
* Packages we need to process and tidy the raw data

```r
## Download the packages for analysis
install.packages("dplyr")
install.packages("reshape2")

## Load the two packages
library(dplyr)
library(reshape2)
```


* Download the data from web

```r
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "getdata-projectfiles-UCI HAR Dataset.zip", method = "curl")

unzip("getdata-projectfiles-UCI HAR Dataset.zip")
```

### 1.Data preprocessing
* Read the data of subjects, features and activity labels from training set and test set.
 
```r
train <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = "numeric")
test <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses = "numeric")

## The subject labels from 1 to 30
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")

## The activity labels from classess 1 to 6
train_act <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "ActivityName")
test_act <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "ActivityName")

## The vector of features to estimate signals
feature_name <- read.table("./UCI HAR Dataset/features.txt", colClasses = "character")

## The activity labels to activities respectively
activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("ClassLabels", "ActivityName"), stringsAsFactors = FALSE)
```

* Merge the training and the test sets to create one data set

```r
## Combine two dataset (Merging)
merge_data <- rbind(train, test)
```
* Labels the dataset with each measurement (feature name)

```r
## Label the data excluding the duplicate column names
names(merge_data) <- feature_name[ ,2]
merge_data <- merge_data[, !duplicated(names(merge_data))]

## You can also make the duplicate column names valid through `make.names` to force column unique.  
# names(total) <- make.names(names = feature_name[, 2], unique = TRUE, allow_ = TRUE)
# See the method on stackoverflow: http://stackoverflow.com/a/28576595

```


* Extracts only the measurements on the mean and standard deviation for each measurement

```r
## Apply regular expression to better extract the measurement we want
data_set <- select(merge_data, matches("(mean|std)\\(.*\\)"))

## Append the Subject & Activity Name columns to new data frame
Act_Col <- rbind(train_act, test_act)
Sub_Col <- rbind(train_subject, test_subject)
data_set <- cbind(Sub_Col, Act_Col, data_set)

```

* Uses descriptive activity names to name the activities in the data set

```r
## Replace the classes 1 to 6 with the activity name
data_set$ActivityName <- activity_label[match(data_set$ActivityName, activity_label$ClassLabels), 'ActivityName']
# Reference: http://stackoverflow.com/a/10158737
```

* Appropriately labels the data set with descriptive variable names.

```r
names(data_set) <- gsub("std\\(.*\\)", "Std", names(data_set))
names(data_set) <- gsub("mean\\(.*\\)", "Mean", names(data_set))
names(data_set) <- gsub("^t", "Time.", names(data_set))
names(data_set) <- gsub("^f", "FFT.", names(data_set))
```
### 2.Reshaping data to obtain tidy dataset
**Requirement**: Independent tidy data set with the average of each variable for each activity and each subject.


* Step1. Melting data frames

```r
data_melt <- melt(data_set, id = c("Subject", "ActivityName"))
```
```r
Source: local data frame [679,734 x 4]

   Subject ActivityName            variable     value
     (int)        (chr)              (fctr)     (dbl)
1        1     STANDING Time.BodyAcc-Mean-X 0.2885845
2        1     STANDING Time.BodyAcc-Mean-X 0.2784188
3        1     STANDING Time.BodyAcc-Mean-X 0.2796531
4        1     STANDING Time.BodyAcc-Mean-X 0.2791739
5        1     STANDING Time.BodyAcc-Mean-X 0.2766288
6        1     STANDING Time.BodyAcc-Mean-X 0.2771988
7        1     STANDING Time.BodyAcc-Mean-X 0.2794539
8        1     STANDING Time.BodyAcc-Mean-X 0.2774325
9        1     STANDING Time.BodyAcc-Mean-X 0.2772934
10       1     STANDING Time.BodyAcc-Mean-X 0.2805857
..     ...          ...                 ...       ...
```

* Step2. Casting data frames by Mean

```r
tidy_data <- dcast(data_melt, Subject + ActivityName ~ variable, mean)
```

```r
Source: local data frame [180 x 68]

   Subject       ActivityName Time.BodyAcc-Mean-X Time.BodyAcc-Mean-Y Time.BodyAcc-Mean-Z Time.BodyAcc-Std-X Time.BodyAcc-Std-Y Time.BodyAcc-Std-Z Time.GravityAcc-Mean-X
     (int)              (chr)               (dbl)               (dbl)               (dbl)              (dbl)              (dbl)              (dbl)                  (dbl)
1        1             LAYING           0.2215982        -0.040513953          -0.1132036        -0.92805647       -0.836827406        -0.82606140             -0.2488818
2        1            SITTING           0.2612376        -0.001308288          -0.1045442        -0.97722901       -0.922618642        -0.93958629              0.8315099
3        1           STANDING           0.2789176        -0.016137590          -0.1106018        -0.99575990       -0.973190056        -0.97977588              0.9429520
4        1            WALKING           0.2773308        -0.017383819          -0.1111481        -0.28374026        0.114461337        -0.26002790              0.9352232
5        1 WALKING_DOWNSTAIRS           0.2891883        -0.009918505          -0.1075662         0.03003534       -0.031935943        -0.23043421              0.9318744
6        1   WALKING_UPSTAIRS           0.2554617        -0.023953149          -0.0973020        -0.35470803       -0.002320265        -0.01947924              0.8933511
7        2             LAYING           0.2813734        -0.018158740          -0.1072456        -0.97405946       -0.980277399        -0.98423330             -0.5097542
8        2            SITTING           0.2770874        -0.015687994          -0.1092183        -0.98682228       -0.950704499        -0.95982817              0.9404773
9        2           STANDING           0.2779115        -0.018420827          -0.1059085        -0.98727189       -0.957304989        -0.94974185              0.8969286
10       2            WALKING           0.2764266        -0.018594920          -0.1055004        -0.42364284       -0.078091253        -0.42525752              0.9130173
..     ...                ...                 ...                 ...                 ...                ...                ...                ...                    ...
Variables not shown: Time.GravityAcc-Mean-Y (dbl), Time.GravityAcc-Mean-Z (dbl), Time.GravityAcc-Std-X (dbl), Time.GravityAcc-Std-Y (dbl), Time.GravityAcc-Std-Z (dbl),
  Time.BodyAccJerk-Mean-X (dbl), Time.BodyAccJerk-Mean-Y (dbl), Time.BodyAccJerk-Mean-Z (dbl), Time.BodyAccJerk-Std-X (dbl), Time.BodyAccJerk-Std-Y (dbl),
  Time.BodyAccJerk-Std-Z (dbl), Time.BodyGyro-Mean-X (dbl), Time.BodyGyro-Mean-Y (dbl), Time.BodyGyro-Mean-Z (dbl), Time.BodyGyro-Std-X (dbl), Time.BodyGyro-Std-Y (dbl),
  Time.BodyGyro-Std-Z (dbl), Time.BodyGyroJerk-Mean-X (dbl), Time.BodyGyroJerk-Mean-Y (dbl), Time.BodyGyroJerk-Mean-Z (dbl), Time.BodyGyroJerk-Std-X (dbl),
  Time.BodyGyroJerk-Std-Y (dbl), Time.BodyGyroJerk-Std-Z (dbl), Time.BodyAccMag-Mean (dbl), Time.BodyAccMag-Std (dbl), Time.GravityAccMag-Mean (dbl), Time.GravityAccMag-Std
  (dbl), Time.BodyAccJerkMag-Mean (dbl), Time.BodyAccJerkMag-Std (dbl), Time.BodyGyroMag-Mean (dbl), Time.BodyGyroMag-Std (dbl), Time.BodyGyroJerkMag-Mean (dbl),
  Time.BodyGyroJerkMag-Std (dbl), FFT.BodyAcc-Mean-X (dbl), FFT.BodyAcc-Mean-Y (dbl), FFT.BodyAcc-Mean-Z (dbl), FFT.BodyAcc-Std-X (dbl), FFT.BodyAcc-Std-Y (dbl),
  FFT.BodyAcc-Std-Z (dbl), FFT.BodyAccJerk-Mean-X (dbl), FFT.BodyAccJerk-Mean-Y (dbl), FFT.BodyAccJerk-Mean-Z (dbl), FFT.BodyAccJerk-Std-X (dbl), FFT.BodyAccJerk-Std-Y (dbl),
  FFT.BodyAccJerk-Std-Z (dbl), FFT.BodyGyro-Mean-X (dbl), FFT.BodyGyro-Mean-Y (dbl), FFT.BodyGyro-Mean-Z (dbl), FFT.BodyGyro-Std-X (dbl), FFT.BodyGyro-Std-Y (dbl),
  FFT.BodyGyro-Std-Z (dbl), FFT.BodyAccMag-Mean (dbl), FFT.BodyAccMag-Std (dbl), FFT.BodyBodyAccJerkMag-Mean (dbl), FFT.BodyBodyAccJerkMag-Std (dbl), FFT.BodyBodyGyroMag-Mean
  (dbl), FFT.BodyBodyGyroMag-Std (dbl), FFT.BodyBodyGyroJerkMag-Mean (dbl), FFT.BodyBodyGyroJerkMag-Std (dbl)
```

* Step3. Write the tidy data into tidy_data.txt

```r
write.table(tidy_data, "tidy_data.txt", sep = "\t", quote = FALSE, row.names = FALSE)
``` 
