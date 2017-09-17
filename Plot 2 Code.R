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

#Plot 2
plot(data2$DateTime, data2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, 'C:/Users/Chris/Desktop/Coursera/Exploratory Data Analysis/Plot 2.png')
dev.off()