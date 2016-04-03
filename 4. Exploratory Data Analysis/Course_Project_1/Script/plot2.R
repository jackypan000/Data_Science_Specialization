source("preprocess.R")

#==============================
#==== Base Plotting System ====
#==============================
png(file = "plot2.png")
plot(x = data$Date_Time, y = data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()

#=================================
#==== Lattice Plotting System ====
#=================================
png(file = "plot2.png")
library(lattice)
xyplot(Global_active_power ~ Date_Time, type = "l", data = data, col = "black", 
       scales = list(x = list(format = "%a", tick.number = 3)),
       xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()

#================================
#==== Ggplot Plotting System ====
#================================
png(file = "plot2.png")
library(ggplot2)
ggplot(data = data, aes(Date_Time, Global_active_power)) + geom_line() + xlab("") + ylab("Global Active Power (kilowatts)") + theme_bw() + scale_x_datetime(date_breaks = "1 day", date_labels = "%a")

dev.off()