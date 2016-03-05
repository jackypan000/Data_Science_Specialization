# Code Book
<br>
## Project Description
> This project is the course assignment of **[Getting and Cleaning Data - Data Science Specialization](https://www.coursera.org/learn/data-cleaning)**.

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Study design and data processing
### Collection of the raw data

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip




## Creating the tidy datafile

### Guide to create the tidy data file
1. Download the data
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names.
6. From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### Cleaning of the data

Short, high-level description of what the cleaning script does. [link to the readme document that describes the code in greater detail](https://github.com/jackypan000/Data_Science_Specialization/blob/master/3.%20Getting%20and%20Cleaning%20Data/README.md)


## Description of the variables in the tidy_data.txt file

There are 180 rows for each activity and each subject and 68 columns for each variable.

###The variables present in the dataset consist:
> #### Subject

Represent the label of 30 volunteers the experiment carried out.

Some information on the variable including:

* Class of the variable: **Integer**
* Unique values/levels of the variable: **1, 2, 3,......,30**
* Unit of measurement: **N/A**




> #### ActivityName

Represent the activities performed during the experiment.

Some information on the variable including:

* Class of the variable: **Character**
* Unique values/levels of the variable: 
**WALKING**, **WALKING_UPSTAIRS**, **WALKING_DOWNSTAIRS**, **SITTING**, **STANDING**, **LAYING**
* Unit of measurement: **N/A**

##### Notes on ActivityName:

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

> #### Other variables

Represent the vector of features was obtained by calculating variables from the time and frequency domain. 
**Only include the measurements on the mean and standard deviation.**

#####The pattern of vector of features:

`__1__`.`__2__`-`__3__`-`__4__`

`1`:  **Time**/ **FFT**

`2`:  **BodyAcc(Mag)**/ **GravityAcc(Mag)**/ **BodyAccJerk(Mag)**/ **BodyGyroJerk(Mag)**/ **BodyBodyAccJerkMag**/ **BodyBodyGyroMag**/ **BodyBodyGyroJerkMag**

`3`:  **Mean**/ **Std**

`4`:  **(Empty)**/ **X**/ **Y**/ **Z**

##### These signals were used to estimate variables of the feature vector for each pattern:  

* `-X`, `-Y` and `-Z` are used to denote 3-axial signals in the X, Y and Z directions.
* `Std` and `Mean` are used to denote the standard deviation and mean value.
* `Time.` and `FFT.` are used to denote time domain and frequency domain for signals.
* `BodyAcc`: Body acceleration signals.
* `GravityAcc`: Gravity acceleration signals.
* `BodyAccJerk`: Body linear acceleration were derived in time to obtain Jerk signals.
* `BodyGyroJerk`: Body angular velocity were derived in time to obtain Jerk signals.
* `...Mag...`: The magnitude of these three-dimensional signals were calculated using the Euclidean norm.


## Sources

Adopted from this [CodeBook Example](https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41)

