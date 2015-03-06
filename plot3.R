#Plot 3

#Input data
x <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
y <- subset(x, (Date == "1/2/2007" | Date == "2/2/2007"))

#Convert data types
y$Date <- as.Date(y$Date, format="%d/%m/%Y")
y$DateTime <-as.POSIXct(strptime(paste(y$Date, y$Time), "%Y-%m-%d %H:%M:%S"))
y$Sub_metering_1 <- as.numeric(levels(y$Sub_metering_1))[y$Sub_metering_1]
y$Sub_metering_2 <- as.numeric(levels(y$Sub_metering_2))[y$Sub_metering_2]

#Plot multiple line graphs, output to png file
png("plot3.png", width = 480, height = 480)
plot(y$DateTime, y$Sub_metering_1, type="l", col="black", 
     xlab="",
     ylab="Energy sub metering")
lines(y$DateTime, y$Sub_metering_2, type="l", col="red")
lines(y$DateTime, y$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()