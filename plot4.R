# Read data set after unzipping the data file
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert date and time to Date/Time classes
data <- within(data, DateTime <- as.POSIXlt(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

# Create subet of data for plotting
data <- subset(data, DateTime >= as.POSIXlt("2007-02-01") & DateTime < as.POSIXlt("2007-02-03"))

# Create canvas for plotting
png(filename = "plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))


# Plot Global active power over time
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plot Voltage over time
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot Engery sub metering over time
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)

# Plot Global reactive power
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime")

# Close plotting device
dev.off()