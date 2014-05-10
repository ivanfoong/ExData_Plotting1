dat <- read.table("household_power_consumption.txt", sep=";", na.strings="?", skip=66637, nrows=2880)

names(dat) <- names(read.table("household_power_consumption.txt", sep=";", header=T, nrows=1))

dat$DateTime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M") 

par(mfrow=c(2,2))

with(dat, {
  plot(dat$DateTime, dat[,3], type="n", xlab="", ylab="Global Active Power (kilowatts)")
  lines(dat$DateTime, dat[,3])
  
  plot(dat$DateTime, dat$Voltage, type="n", xlab="datetime", ylab="Voltage")
  lines(dat$DateTime, dat$Voltage)
  
  plot(dat$DateTime, dat$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(dat$DateTime, dat$Sub_metering_1, col="black")
  lines(dat$DateTime, dat$Sub_metering_2, col="red")
  lines(dat$DateTime, dat$Sub_metering_3, col="blue")
  legend("topright", lty=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
  
  plot(dat$DateTime, dat[,4], type="n", xlab="datetime", ylab="Global_reactive_power")
  lines(dat$DateTime, dat[,4])
})

dev.copy(png, file="plot4.png")
dev.off()