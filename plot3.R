x<-read.table("household_power_consumption.txt",header =  TRUE,  sep = ";", colClasses = c("character","character", rep("numeric",7)),na.strings = "?" )  
x<-subset(x,x$Date == "1/2/2007" | x$Date == "2/2/2007")
x$Timestamp <-paste(x$Date, x$Time)




#Plot 3
png("plot3.png")
plot(strptime(x$Timestamp, "%d/%m/%Y %H:%M:%S"), x$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

#Add line graph in red
lines(strptime(x$Timestamp, "%d/%m/%Y %H:%M:%S"), x$Sub_metering_2, type = "l", col = "red" )

#Add line graph in blue
lines(strptime(x$Timestamp, "%d/%m/%Y %H:%M:%S"), x$Sub_metering_3, type = "l", col = "blue" )

#Legend to graph
legend("topright", lty= 1, col = c("black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()