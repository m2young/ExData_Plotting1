#Plot 4

#Input data
x <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
y <- subset(x, (Date == "1/2/2007" | Date == "2/2/2007"))

#Convert data types
y$Date <- as.Date(y$Date, format="%d/%m/%Y")
y$DateTime <-as.POSIXct(strptime(paste(y$Date, y$Time), "%Y-%m-%d %H:%M:%S"))
y$Global_active_power <- as.numeric(levels(y$Global_active_power))[y$Global_active_power]
y$Global_reactive_power <- as.numeric(levels(y$Global_reactive_power))[y$Global_reactive_power]
y$Voltage <- as.numeric(levels(y$Voltage))[y$Voltage]
y$Sub_metering_1 <- as.numeric(levels(y$Sub_metering_1))[y$Sub_metering_1]
y$Sub_metering_2 <- as.numeric(levels(y$Sub_metering_2))[y$Sub_metering_2]

#Plot multiple graphs, output to png file
png("plot4.png")
par(mfrow=c(2,2))

plot(y$DateTime, y$Global_active_power, type="l",
     xlab="",
     ylab="Global Active Power")
plot(y$DateTime, y$Voltage, type="l",
     xlab="datetime",
     ylab="Voltage")
plot(y$DateTime, y$Sub_metering_1, type="l", col="black", 
     xlab="",
     ylab="Energy sub metering")
lines(y$DateTime, y$Sub_metering_2, type="l", col="red")
lines(y$DateTime, y$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), bty="n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(y$DateTime, y$Global_reactive_power, type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
