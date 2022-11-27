x<-read.table("household_power_consumption.txt",header =  TRUE,  sep = ";", colClasses = c("character","character", rep("numeric",7)),na.strings = "?" )  
x<-subset(x,x$Date == "1/2/2007" | x$Date == "2/2/2007")
x$Timestamp <-paste(x$Date, x$Time)


#Plot 1
png("plot1.png")
hist(x$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()