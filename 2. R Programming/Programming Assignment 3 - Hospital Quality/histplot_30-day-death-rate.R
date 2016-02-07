## Changing working directory to the directory where the data are unzipped
## Serve as the new working directory
setwd("ProgAssignment3-data/")

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
outcome[, 11] <- as.numeric(outcome[, 11])

hist(outcome[, 11], main = "30-day mortality rates for heart attack",
     xlab = "30-day mortality rate")