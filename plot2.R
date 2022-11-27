x<-read.table("household_power_consumption.txt",header =  TRUE,  sep = ";", colClasses = c("character","character", rep("numeric",7)),na.strings = "?" )  
x<-subset(x,x$Date == "1/2/2007" | x$Date == "2/2/2007")
x$Timestamp <-paste(x$Date, x$Time)



#Plot 2
png("plot2.png")
plot(strptime(x$Timestamp, "%d/%m/%Y %H:%M:%S"),
     x$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()