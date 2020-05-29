library("data.table")

# Read data into data.table
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")

# Change Add full_date column containing both date and time
powerDT[, full_date := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Select appropriate dates
powerDT <- powerDT[(full_date >= "2007-02-01") & (full_date < "2007-02-03")]


# Create graphics device
png("plot4.png", width=480, height=480)

# Set number of plots on the screen 4(2 rows, 2 columns)
par(mfrow = c(2,2))

# Plot 1
plot(x=powerDT$full_date, y=powerDT$Global_active_power, type = "l" ,
     xlab="", ylab="Global Active Power")

# Plot 2
plot(x=powerDT$full_date, y=powerDT$Voltage, type = "l" ,
     xlab="datetime", ylab="Voltage")

# Plot 3
plot(x=powerDT$full_date, y=powerDT$Sub_metering_1, type = "l" ,
     xlab="", ylab="Energy sub metering")
lines(powerDT$full_date, powerDT$Sub_metering_2, col="red")
lines(powerDT$full_date, powerDT$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

# Plot 4
plot(x=powerDT$full_date, y=powerDT$Global_reactive_power, type = "l" ,
     xlab="datetime", ylab="Global_reactive_power")

dev.off()