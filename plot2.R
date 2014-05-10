dat <- read.table("household_power_consumption.txt", sep=";", na.strings="?", skip=66637, nrows=2880)

names(dat) <- names(read.table("household_power_consumption.txt", sep=";", header=T, nrows=1))

dat$DateTime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M") 

par(mfrow=c(1,1))

plot(dat$DateTime, dat[,3], type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(dat$DateTime, dat[,3])

dev.copy(png, file="plot2.png")
dev.off()