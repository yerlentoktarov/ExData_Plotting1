library("data.table")

# Read data into data.table
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")

# Change Date Column to Date Type
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Select appropriate dates
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

# Create graphics device
png("plot1.png", width=480, height=480)

#Plot 1
hist(powerDT$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()