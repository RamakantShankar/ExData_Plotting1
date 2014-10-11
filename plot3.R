## -------------------------------------------------------------------------------------------------- ##
#  Exploratory Data Analysis : Course Project 1
#  Author 		: Ramakant Shankar
#  Source Data 	: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#  Assumption 	: 
#					The source file name is - "household_power_consumption.txt"
#					The source file exists in current working directory of R session
#  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#  Output 		: plot3.png (current working directory) 
## -------------------------------------------------------------------------------------------------- ##

# Reading Data
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

# Filtering data for dates 2007-02-01 and 2007-02-02
power <- power[as.Date(power$Date,"%d/%m/%Y") %in%  as.Date(c("2007-02-01","2007-02-02"),"%Y-%m-%d"),]

# Adding new column DateTime by concatenating Date and Time columns
power$DateTime <- paste(power$Date,power$Time,sep=" ")

# Converting the data type of dtetime column to datetime
power$DateTime <- strptime (power$DateTime,"%Y-%m-%d %H:%M:%S")

# Converting the Column data type from Factor to Numeric
for(i in 3:8){power[,i] <- as.numeric(as.character(power[,i]))}

# Creating png file for plot
png(filename="plot3.png",height=480,width=480)
with(power,plot(DateTime,Sub_metering_1,type="l", xlab="",ylab="Energy sub metering"))
lines(power$DateTime,power$Sub_metering_2,type="l",col="red")
lines(power$DateTime,power$Sub_metering_3,type="l",col="blue")
legend("topright", lty=1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()