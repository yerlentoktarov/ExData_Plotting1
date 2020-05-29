library("data.table")

# Read data into data.table
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")

# Change Add full_date column containing both date and time
powerDT[, full_date := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Select appropriate dates
powerDT <- powerDT[(full_date >= "2007-02-01") & (full_date < "2007-02-03")]

# Create graphics device
png("plot2.png", width=480, height=480)

# Plot 2
plot(y= powerDT$Global_active_power, x=powerDT$full_date,type = "l" ,
     xlab="", ylab="Global Active Power (kilowatts)")

dev.off()