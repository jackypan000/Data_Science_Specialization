pollutantmean <- function(directory, pollutant, id = 1:332){
        #1.Directory setting 
        file_dir <- paste(directory, sprintf("/%03d.csv", id), sep = "")
        
        #2.Initialize data frame for storing monitor data
        data_of_monitor <- data.frame() 
        
        #3.Loop for binding the specified data by id
        for (i in 1:length(id)) {
                temp <- read.csv(file_dir[i], header = TRUE)
                data_of_monitor <- rbind(data_of_monitor, temp)
        }
    
        #4. Calculate the mean excluding missing value, 3 digits as example
        round( mean(data_of_monitor[, pollutant], na.rm = TRUE) ,digits = 3)
}