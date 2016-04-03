source("preprocess.R")

#==============================
#==== Base Plotting System ====
#==============================
png(file = "plot4.png")
par(mfrow = c(2,2))
#Plot 1
plot(x = data$Date_Time, y = data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

#Plot 2
plot(x = data$Date_Time, y = data$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

#Plot3
plot(x = data$Date_Time, y = data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
with(data, lines(Date_Time, Sub_metering_1, col = "black"))
with(data, lines(Date_Time, Sub_metering_2, col = "red"))
with(data, lines(Date_Time, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#Plot 4
plot(x = data$Date_Time, y = data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()


#=================================
#==== Lattice Plotting System ====
#=================================
png(file = "plot4.png")
library(lattice)
# Plot 1 assignments as upleft
upleft <- xyplot(Global_active_power ~ Date_Time, type = "l", data = data, col = "black", 
       scales = list(x = list(format = "%a", tick.number = 3)),
       xlab = "", ylab = "Global Active Power")

# Plot 2 assignments as upright
upright <- xyplot(Voltage ~ Date_Time, type = "l", data = data, col = "black", 
       scales = list(x = list(format = "%a", tick.number = 3)),
       xlab = "datetime", ylab = "Voltage")

# Plot 3 assignments as downleft
downleft <- xyplot(Sub_metering_1 + Sub_metering_2 + Sub_metering_3 ~ Date_Time, data = data, type = "l", col = c("black", "red", "blue"),xlab = "", ylab = "Energy sub metering", key = list(corner = c(1,1), lines=list(col=c("black","red", "blue")), text=list(c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))),scales = list(x = list(format = "%a", tick.number = 3)))

# Plot 4 assignments as downright
downright <- xyplot(Global_reactive_power ~ Date_Time, type = "l", data = data, col = "black", 
       scales = list(x = list(format = "%a", tick.number = 3)),
       xlab = "datetime", ylab = "Global_reactive_power")

# Plot prints
print(upleft, split = c(1,1,2,2), more = TRUE)
print(upright, split = c(2,1,2,2), more = TRUE)
print(downleft, split = c(1,2,2,2), more = TRUE)
print(downright, split = c(2,2,2,2), more = FALSE)

dev.off()


#================================
#==== Ggplot Plotting System ====
#================================
png(file = "plot4.png")
library(ggplot2)
# Plot 1 assignments as upleft
upleft <- ggplot(data = data, aes(Date_Time, Global_active_power)) + geom_line() + xlab("") + ylab("Global Active Power") + theme_bw() + scale_x_datetime(date_breaks = "1 day", date_labels = "%a")

# Plot 2 assignments as upright
upright <- ggplot(data = data, aes(Date_Time, Voltage)) + geom_line() + xlab("datetime") + ylab("Voltage") + theme_bw() + scale_x_datetime(date_breaks = "1 day", date_labels = "%a")

# Plot 3 assignments as downleft
df <- select(data, c(1,6,7,8))
downleft <- ggplot(data = df, aes(x = Date_Time, y = value, color = variable)) +
        geom_line(aes(y = Sub_metering_1, col = "Sub_metering_1")) + 
        geom_line(aes(y = Sub_metering_2, col = "Sub_metering_2")) +
        geom_line(aes(y = Sub_metering_3, col = "Sub_metering_3")) +
        theme_bw() + scale_x_datetime(date_breaks = "1 day", date_labels = "%a") +
        xlab("") + ylab("Energy sub metering") +
        scale_colour_manual("",breaks = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),values = c("black", "red", "blue")) 

# Plot 4 assignments as downright
downright <- ggplot(data = data, aes(Date_Time, Global_reactive_power)) + geom_line() + xlab("datetime") + ylab("Global_reactive_power") + theme_bw() + scale_x_datetime(date_breaks = "1 day", date_labels = "%a")

# Need to install the package called Rmisc to use multiplot
library(Rmisc)
multiplot(upleft, downleft, upright,  downright,  cols= 2)

dev.off()