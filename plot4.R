# Data file 
dataFile <- "data/household_power_consumption.txt"

if (!file.exists(dataFile)) {
        stop("Please have the datafile(household_power_consumption.txt) available under data subdirectory and try again!")
}

# Read only the required data, from 2007-02-01 to 2007-02-02
firstRow <- 66637
lastRow <- 69517
numRows <- lastRow - firstRow
powerConsumptionData <- read.table(dataFile, header=FALSE, sep = ";", skip=firstRow, nrows=numRows)
png(filename="plot4.png")

# Combine date & time columns to a date time column
powerConsumptionData$DateTime <- strptime(paste(powerConsumptionData$V1,powerConsumptionData$V2), format="%d/%m/%Y %H:%M:%S")

# Set global number of plots to 2 X 2 = 4 plots
par(mfrow=c(2,2))

# Plot #1
with(powerConsumptionData, plot(DateTime,V3, xlab="", ylab="Global Active Power", type="s"))

# Plot #2
with(powerConsumptionData, plot(DateTime,V5, xlab="datetime", ylab="Voltage", type="s"))

# Plot #3
with(powerConsumptionData, plot(DateTime,V7, xlab="", ylab="Energy sub metering", type="n"))
with(powerConsumptionData, lines(DateTime,V7, col="black"))
with(powerConsumptionData, lines(DateTime,V8, col="red"))
with(powerConsumptionData, lines(DateTime,V9, col="blue"))
legend('topright','groups',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1),col=c('black','red','blue'), bty="n")

# Plot #4
with(powerConsumptionData, plot(DateTime,V4, xlab="datetime", ylab="Global_reactive_power", type="s"))

dev.off()