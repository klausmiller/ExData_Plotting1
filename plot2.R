# Read data set after unzipping the data file
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert date and time to Date/Time classes
data <- within(data, DateTime <- as.POSIXlt(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

# Create subet of data for plotting
data <- subset(data, DateTime >= as.POSIXlt("2007-02-01") & DateTime < as.POSIXlt("2007-02-03"))

# Create canvas for plotting
png(filename = "plot2.png", width=480, height=480, units="px")

# Plot global active power over time
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close plotting device
dev.off()