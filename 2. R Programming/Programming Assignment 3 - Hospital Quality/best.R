## The function is to find the best hospital in that state which is with the lowest
## mortality rate in specific outcome(case).

## Parameter `state` & `outcome`
## `state` : char (2) Lists the 2 letter State code in which the hospital is located.
## `outcome` : The outcomes can be one of “heart attack”, “heart failure”, or “pneumonia”

best <- function(state, outcome) {
        ## Preprocess the data
        
        # 1. Assign each class of column into character for future convenience(conversion purpose)
        # 2. Assign "Not Available" strings into NAs(missing value)
        data <- read.csv("outcome-of-care-measures.csv", header = TRUE, 
                         colClasses = "character", na.strings = c("NA", "Not Available"))
        # 3. Select the columns we want and rename them for better manipulation
        data <- data[,c(2, 7, 11, 17, 23)]
        names(data) <- c("Hospital.Name", "State", "heart attack",
                         "heart failure", "pneumonia")
        # 4. Convert outcome variables into numeric
        data[, 3:5] <- sapply(data[,3:5], as.numeric)
        
        
        ## Input validness check for `state` & `outcome`
        state_name <- unique(data$State)
        outcome_name <- names(data[,3:5])
        
        ## Control structure for results
        if (!(state %in% state_name)) {stop("invalid state")}
        else if (!(outcome %in% outcome_name)) {stop("invalid outcome")}
               else {
                       # 1. Subset the data to get dataframe only with columns:
                       #    hospital name & outcome variables 
                       temp <- subset(data, State == state)[, c("Hospital.Name", outcome)]
                       
                       # 2. Sort the data to deal with alphabet order issue
                       # (i.e. if hospitals “b”, “c”, and “f” are tied for best, 
                       # then hospital “b” should be returned)
                       temp <- temp[order(temp$Hospital.Name),]
                       temp <- temp[order(temp[,outcome]), ]
                       temp <- na.omit(temp) #Remove NAs
                       
                       # 3. Return the best hospital
                       result <- head(temp,1)[,1]
               }
        
        result 
}
