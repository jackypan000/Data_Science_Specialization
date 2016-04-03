source("preprocess.R")

#==============================
#==== Base Plotting System ====
#==============================
png(file = "plot3.png")
# First create an empty plot.
plot(x = data$Date_Time, y = data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
with(data, lines(Date_Time, Sub_metering_1, col = "black"))
with(data, lines(Date_Time, Sub_metering_2, col = "red"))
with(data, lines(Date_Time, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()

#=================================
#==== Lattice Plotting System ====
#=================================
png(file = "plot3.png")
library(lattice)
xyplot(Sub_metering_1 + Sub_metering_2 + Sub_metering_3 ~ Date_Time, data = data, type = "l", col = c("black", "red", "blue"),xlab = "", ylab = "Energy sub metering", key = list(corner = c(1,1), lines=list(col=c("black","red", "blue")), text=list(c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))),scales = list(x = list(format = "%a", tick.number = 3)))

dev.off()

#================================
#==== Ggplot Plotting System ====
#================================
png(file = "plot3.png")
library(ggplot2)
df <- select(data, c(1,6,7,8))
ggplot(data = df, aes(x = Date_Time, y = value, color = variable)) +
        geom_line(aes(y = Sub_metering_1, col = "Sub_metering_1")) + 
        geom_line(aes(y = Sub_metering_2, col = "Sub_metering_2")) +
        geom_line(aes(y = Sub_metering_3, col = "Sub_metering_3")) +
        theme_bw() + scale_x_datetime(date_breaks = "1 day", date_labels = "%a") +
        xlab("") + ylab("Energy sub metering") +
        scale_colour_manual("",breaks = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),values = c("black", "red", "blue")) 
        

dev.off()