#This file assumes you've downloaded and unzipped the datafile into your working directory.

#opens the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

#converts and combines the Date and Time into a POSIXct datetime field DateTime.
#this then deletes the previous Date and Time fields.
dateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- data[-c(1,2)]
data <- cbind(dateTime, data)
data <- subset(data, dateTime >= as.POSIXct('2007-02-01') & dateTime < as.POSIXct('2007-02-03'))

#create the plot as a PNG file.
png(filename = "plot1.png", height = 480, width = 480, units = "px")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
