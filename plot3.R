# Script name: "plot3.R"
# Author: Richard Badham
# Date: 2015.03.07
# Coursera; Exploratory Data Analysis

# Put and run this script in working directory "ExData_Plotting1"

rm(list=ls())
library(sqldf)
library(chron)

# Import records for 1st and 2nd of February 2007
f <- file("household_power_consumption.txt")
df <- read.csv.sql(sql = "select * from f where Date = '1/2/2007' or Date = '2/2/2007'", header = T , sep = ";")

# Convert Date and Time from character to Date and times class
df$Date <- as.Date(as.character(df$Date),format="%d/%m/%Y")
df$Time <- times(df$Time)
df$timestamp <- as.POSIXct(paste(df$Date, df$Time),tz="", "%Y-%m-%d %H:%M:%S")

# Set up graphics device with 1 row and 1 column
par(mfrow = c(1,1))

# Plot x,y line on screen device and then copy to png file
plot(Sub_metering_1 ~ timestamp, df, xaxt = "s", type = "l", xlab="",ylab = "Energy sub metering")
lines(Sub_metering_2 ~ timestamp, df, col="red")
lines(Sub_metering_3 ~ timestamp, df, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red", "blue"))

# Copy the resultant plot to a png file
dev.copy(png, file="plot3.png")
dev.off()
