# Script name: "plot4.R"
# Author: Richard Badham
# Date: 2015.03.07
# Coursera: Exploratory Data Analysis

# Run this script in working directory "ExData_Plotting1"

# Clean out memory
rm(list=ls())

# Load libraries
library(sqldf)
library(chron)

# Import records for 1st and 2nd of February 2007
f <- file("household_power_consumption.txt")
df <- read.csv.sql(sql = "select * from f where Date = '1/2/2007' or Date = '2/2/2007'", header = T , sep = ";")

# Convert Date and Time from character to Date and times class
df$Date <- as.Date(as.character(df$Date),format="%d/%m/%Y")
df$Time <- times(df$Time)
df$timestamp <- as.POSIXct(paste(df$Date, df$Time),tz="", "%Y-%m-%d %H:%M:%S")

# Set up graphics device with 2 rows and 2 columns
par(mfrow = c(2,2))

# Create the 4 plots
plot(Global_active_power ~ timestamp, df, xaxt = "s", type = "l", xlab="",ylab = "Global Active Power")
plot(Voltage ~ timestamp, df, xaxt = "s", type = "l", xlab="datetime",ylab = "Voltage")
plot(Sub_metering_1 ~ timestamp, df, xaxt = "s", type = "l", xlab="",ylab = "Energy sub metering")
lines(Sub_metering_2 ~ timestamp, df, col="red")
lines(Sub_metering_3 ~ timestamp, df, col="blue")
legend("topright",bty="n", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red", "blue"))
plot(Global_reactive_power ~ timestamp, df, xaxt = "s", type = "l", xlab="datetime")

# Copy the resultant plot to a png file
dev.copy(png, file="plot4.png")
dev.off()
