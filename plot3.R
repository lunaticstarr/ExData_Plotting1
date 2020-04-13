# Read the data into R
## First put the file in your work directory
data<-read.csv("./household_power_consumption.txt",
               sep=";",stringsAsFactors = FALSE)
# Subset the data from 2007.2.1 to 2007.2.2
power<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
power$Sub_metering_1<-as.numeric(power$Sub_metering_1)
power$Sub_metering_2<-as.numeric(power$Sub_metering_2)
power$Sub_metering_3<-as.numeric(power$Sub_metering_3)
# Create a column to store the date and time information
library(lubridate)
power$date<-dmy_hms(paste(power$Date,power$Time))
# Create a png file in my work directory
png("plot3.png")
# Construct the initial plot
plot(power$date, power$Sub_metering_1,
     ylab = "Energy sub metering",xlab="",type = "l")
# Add other data points in different colors
lines(power$date,power$Sub_metering_2,col="red")
lines(power$date,power$Sub_metering_3,col="blue")
# Add the legend to explain the meaning of colors
legend("topright",lty = 1,col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Remember to close the device!
dev.off()