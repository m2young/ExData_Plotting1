#Plot 1

#Input data
x <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
y <- subset(x, (Date == "1/2/2007" | Date == "2/2/2007"))

#Convert data types
y$Date <- as.Date(y$Date, format="%d/%m/%Y")
y$Global_active_power <- as.numeric(levels(y$Global_active_power))[y$Global_active_power]

#Plot histogram, output to png file
png("plot1.png", width = 480, height = 480)
hist(y$Global_active_power, 
     freq=TRUE,
     col="red", 
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power"
     )

dev.off()
