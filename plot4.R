# Read the data into R
## First put the file in your work directory
data<-read.csv("./household_power_consumption.txt",
               sep=";",stringsAsFactors = FALSE)
# Subset the data from 2007.2.1 to 2007.2.2
power<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
power$Global_active_power<-as.numeric(power$Global_active_power)
power$Global_reactive_power<-as.numeric(power$Global_reactive_power)
power$Voltage<-as.numeric(power$Voltage)
power$Sub_metering_1<-as.numeric(power$Sub_metering_1)
power$Sub_metering_2<-as.numeric(power$Sub_metering_2)
power$Sub_metering_3<-as.numeric(power$Sub_metering_3)
# Create a column to store the date and time information
library(lubridate)
power$date<-dmy_hms(paste(power$Date,power$Time))
# Create a png file in my work directory
png("plot4.png")
# Set the par to make multiple plots
par(mfrow=c(2,2))
# Draw the 1st plot
plot(power$date, power$Global_active_power,
     ylab = "Global Active Power (kilowatts)",xlab="",
     type = "l")
# Draw the 2nd plot
plot(power$date,power$Voltage,
     ylab = "Voltage",xlab="datetime",type = "l")
# Draw the 3rd plot
plot(power$date, power$Sub_metering_1,
     ylab = "Energy sub metering",xlab="",type = "l")
lines(power$date,power$Sub_metering_2,col="red")
lines(power$date,power$Sub_metering_3,col="blue")
legend("topright",lty = 1,col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Draw the 4th plot
plot(power$date,power$Global_reactive_power,
     ylab="Global_reactive_power",xlab = "datetime",
     type = "l")
# Remember to close the device!
dev.off()