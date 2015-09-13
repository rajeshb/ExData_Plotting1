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
png(filename="plot1.png")
hist(powerConsumptionData$V3, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()