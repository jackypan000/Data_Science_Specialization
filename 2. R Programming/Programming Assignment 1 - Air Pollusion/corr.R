corr <- function(directory, threshold = 0) {
        #1.Directory setting  
        id = 1:332
        file_dir <- paste(directory, sprintf("/%03d.csv", id), sep = "")
        
        #2.Initialize numeric vector for storing monitor correlation results
        cr_vector <- vector(mode = "numeric") 
        
        #3.Loop for selecting data without NAs in sulfate & nitrate columns
        for (i in id) {
                temp <- read.csv(file_dir[i], header = TRUE)
                #Remove missing values, NAs
                temp <- temp[complete.cases(temp), ] 
                temp <- temp[!is.na(temp$sulfate) & !is.na(temp$nitrate), ]
                #Count the numbers of complete cases
                com_num <- nrow(temp)
                #Select the data are larger than threshold and correlate them
                if (com_num > threshold) {
                        cr_vector <- append(cr_vector, cor(temp$nitrate, temp$sulfate))
                }
        }
        
        #Result                
        cr_vector
}