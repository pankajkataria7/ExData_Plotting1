## Download the file and unzip to get the dataset
fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile="Graphs_Data_1.zip")

unzip("Graphs_Data_1.zip")

filename <- "household_power_consumption.txt"

## Use sqldf package to read only the required data
require(sqldf)

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

data <- read.csv2.sql(filename,mySql)

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

## Open a png device to plot the dataset.
## Note that it is not clear from instructions whether to have a transparent background or keep it white
## The reference plots from the fork are transparent and so I have made my plots transparent, but it shouldn't
## matter in the evaluation.
png(file="plot4.png",width=480, height=480, bg="transparent")

par(mfrow=c(2,2))

## Plot the 4 graphs on y-axis against DateTime on x-axis
plot(myData$DateTime,myData$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(myData$DateTime,myData$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(myData$DateTime,myData$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")

lines(myData$DateTime,myData$Sub_metering_2,type="l",col="red")

lines(myData$DateTime,myData$Sub_metering_3,type="l",col="blue")

legend("topright", col=c("black", "red", "blue"), cex = 0.95, lty=1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

plot(myData$DateTime,myData$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

## Turn off the device to get the required png image (plot4.png) in the working directory
dev.off()