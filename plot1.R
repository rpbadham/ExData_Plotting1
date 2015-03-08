# Script name: "plo1.R"
# Author: Richard Badham
# Date: 2015.03.07
# Coursera; Exploratory Data Analysis

#Put and run this script in working directory "ExData_Plotting1"

# Clean out memory
rm(list=ls())

# Load libraries
library(sqldf)
library(chron)

#Import records for 1st and 2nd of February 2007
f <- file("household_power_consumption.txt")
df <- read.csv.sql(sql = "select * from f where Date = '1/2/2007' or Date = '2/2/2007'", header = T , sep = ";")

#Convert Date and Time from character to Date and times class
df$Date <- as.Date(as.character(df$Date),format="%d/%m/%Y")
df$Time <- times(df$Time)

#Plot histogram on screen device 
hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")

# Copy to png file
dev.copy(png, file="plot1.png")
dev.off()



