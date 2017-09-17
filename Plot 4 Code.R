#Set Data
data <- read.table("C:/Users/Chris/Desktop/Coursera/Exploratory Data Analysis/household_power_consumption.txt", header = T, sep = ";")
data2 <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))
rm(data)

#format data
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
data2$Global_reactive_power <- as.numeric(as.character(data2$Global_reactive_power))
data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Voltage <- as.numeric(as.character(data2$Voltage))
data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
data2$DateTime <- paste(data2$Date, data2$Time)
data2$DateTime <- as.POSIXct(data2$DateTime)

#Plot 4
par(mfrow = c(2,2))
plot(data2$DateTime, data2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(data2$DateTime, data2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data2$DateTime, data2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data2$DateTime, data2$Sub_metering_2, col = "red")
lines(data2$DateTime, data2$Sub_metering_3, col = "blue")
legend("topright", inset = .02, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),lty = 1, box.lty = 0)
plot(data2$DateTime, data2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, 'C:/Users/Chris/Desktop/Coursera/Exploratory Data Analysis/Plot 4.png', width = 480, height = 480)
dev.off()