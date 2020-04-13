# Read the data into R
## First put the file in your work directory
data<-read.csv("./household_power_consumption.txt",
               sep=";",stringsAsFactors = FALSE)
# Subset the data from 2007.2.1 to 2007.2.2
power<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
power$Global_active_power<-as.numeric(power$Global_active_power)
# Create a png file in my work directory
png("plot1.png")
# Plot the histogram
hist(power$Global_active_power,breaks=12,col="red",
     xlab = "Global Active Power (kilowatts)",ylab="Frequency",
     main = "Global Active Power")
# Remember to close the device!
dev.off()