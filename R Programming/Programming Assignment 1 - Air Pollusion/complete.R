complete <- function(directory, id = 1:332) {
        #1.Directory setting 
        file_dir <- paste(directory, sprintf("/%03d.csv", id), sep = "")
        
        #2.Initialize data frame for storing monitor data
        data_of_monitor <- data.frame() 
        
        #3.Loop for binding the specified data by id
        for (i in 1:length(id)) {
                #Change ID class from integer to factor for using tapply and avoiding the tapply INDEX sorting issue      
                temp <- read.csv(file_dir[i], header = TRUE, colClasses = c("factor", "numeric", "numeric", "factor"))
                #Remove every missing values, NAs
                temp <- temp[complete.cases(temp), ] 
                data_of_monitor <- rbind(data_of_monitor, temp)
        }
        
        #4. Desired data frame
        #Note. `tapply` returns the numbers of complete data for each monitor
        result <- data.frame(id = id, nobs = tapply(data_of_monitor$ID, data_of_monitor$ID, length))
        result
}