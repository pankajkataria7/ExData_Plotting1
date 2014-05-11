## Download the file and unzip to get the dataset
fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile="Graphs_Data_1.zip")

unzip("Graphs_Data_1.zip")

filename <- "household_power_consumption.txt"

## Use sqldf package to read only the required data
require(sqldf)

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

data <- read.csv2.sql(filename,mySql)

## Open a png device to plot the dataset.
## Note that it is not clear from instructions whether to have a transparent background or keep it white
## The reference plots from the fork are transparent and so I have made my plots transparent, but it shouldn't
## matter in the evaluation.

png(file="plot1.png", width=480, height=480, bg="transparent")

## Plot the histogram for Global Active Power with a red color
hist(myData$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)", bg="transparent")

## Turn off the device to get the required png image (plot1.png) in the working directory
dev.off()