# Read the data into R
## First put the file in your work directory
data<-read.csv("./household_power_consumption.txt",
               sep=";",stringsAsFactors = FALSE)
# Subset the data from 2007.2.1 to 2007.2.2
power<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
power$Global_active_power<-as.numeric(power$Global_active_power)
# Create a column to store the date and time information
library(lubridate)
power$date<-dmy_hms(paste(power$Date,power$Time))
# Create a png file in my work directory
png("plot2.png")
# Plot the line graph
plot(power$date, power$Global_active_power,
     ylab = "Global Active Power (kilowatts)",xlab="",
     type = "l")
# Remember to close the device!
dev.off()