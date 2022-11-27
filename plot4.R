x<-read.table("household_power_consumption.txt",header =  TRUE,  sep = ";", colClasses = c("character","character", rep("numeric",7)),na.strings = "?" )  
x<-subset(x,x$Date == "1/2/2007" | x$Date == "2/2/2007")
x$Timestamp <-paste(x$Date, x$Time)


#Plot 4

png("plot4.png")
par(mfcol = c(2,2))

#1
plot(strptime(x$Timestamp, "%d/%m/%Y %H:%M:%S"), x$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power(kilowatts)")
#2
plot(strptime(x$Timestamp, "%d/%m/%Y %H:%M:%S"), x$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(strptime(x$Timestamp, "%d/%m/%Y %H:%M:%S"), x$Sub_metering_2, type = "l", col = "red" )
lines(strptime(x$Timestamp, "%d/%m/%Y %H:%M:%S"), x$Sub_metering_3, type = "l", col = "blue" )
legend("topright", lty= 1, col = c("black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#3
plot(strptime(x$Timestamp, "%d/%m/%Y %H:%M:%S"), x$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")


#4
plot(strptime(x$Timestamp, "%d/%m/%Y %H:%M:%S"),
     x$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")


dev.off()