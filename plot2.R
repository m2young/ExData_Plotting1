#Plot 2

#Input data
x <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
y <- subset(x, (Date == "1/2/2007" | Date == "2/2/2007"))

#Convert data types
y$Date <- as.Date(y$Date, format="%d/%m/%Y")
y$DateTime <-as.POSIXct(strptime(paste(y$Date, y$Time), "%Y-%m-%d %H:%M:%S"))
y$Global_active_power <- as.numeric(levels(y$Global_active_power))[y$Global_active_power]

#Plot line graph, output to png
png("plot2.png", width = 480, height = 480)
plot(y$DateTime, y$Global_active_power, type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()