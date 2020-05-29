library("data.table")

# Read data into data.table
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")

# Change Add full_date column containing both date and time
powerDT[, full_date := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Select appropriate dates
powerDT <- powerDT[(full_date >= "2007-02-01") & (full_date < "2007-02-03")]

# Create graphics device
png("plot3.png", width=480, height=480)

# Plot 3
plot(x=powerDT$full_date, y=powerDT$Sub_metering_1, type = "l" ,
     xlab="", ylab="Energy sub metering")
lines(powerDT$full_date, powerDT$Sub_metering_2, col="red")
lines(powerDT$full_date, powerDT$Sub_metering_3, col="blue")
# Add legend
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()