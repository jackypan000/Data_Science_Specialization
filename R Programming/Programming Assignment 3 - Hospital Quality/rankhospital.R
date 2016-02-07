rankhospital <- function(state, outcome, num="best"){
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
        data <- na.omit(data)
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
                if (num == "best") {result <- temp[1,1] }
                else if (num == "worst") {result <- tail(temp,1)[,1] }
                else {result <- temp[num, 1] }
        }
        
        result 
}
