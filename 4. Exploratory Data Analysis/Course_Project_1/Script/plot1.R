source("preprocess.R")

#==============================
#==== Base Plotting System ====
#==============================
png(file = "plot1.png")

hist(data$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     col = "red")

dev.off()

#=================================
#==== Lattice Plotting System ====
#=================================
png(file = "plot1.png")
library(lattice)
histogram(x = data$Global_active_power, col = "red",
          xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
          main = "Global Active Power",
          par.settings = list(axis.line = list(col = 0)))

dev.off()



#================================
#==== Ggplot Plotting System ====
#================================
png(file = "plot1.png")
library(ggplot2)
qplot(x = Global_active_power, data = data, geom = "histogram",
      main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
      ylab = "Frequency", binwidth = 0.5, 
      fill = I("red"), color = I("black")) +  theme_bw()

dev.off()   

