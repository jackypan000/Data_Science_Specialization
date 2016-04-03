## 0. System configuration: change time locale into English
system("defaults write org.R-project.R force.LANG en_US.UTF-8") 

## 1. Download the datasets
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("household_power_consumption.zip")) {
   download.file(url, destfile = "household_power_consumption.zip", method = "curl")
   unzip(zipfile = "household_power_consumption.zip")
}


## 2.1 Load the datasets from txt file, only select Date: 2007-02-01 and 2007-02-02
file_name <- "household_power_consumption.txt"
data <- subset(read.table(file_name, header = TRUE, na.strings = "?", sep = ";"), 
               Date == "1/2/2007" | Date == "2/2/2007")

## 2.2 Convert the Date and Time variables to Date/Time classes
library(dplyr)
data <- cbind(paste(data$Date, data$Time,  sep = " "), data)
data <- select(data, -Date, -Time) 
names(data)[1] <- "Date_Time" 
data$Date_Time <- as.POSIXct(strptime(data[,1], format = "%d/%m/%Y %H:%M:%S"))
# "POSIXct" is more convenient for including in data frames

