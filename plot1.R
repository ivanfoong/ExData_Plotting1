dat <- read.table("household_power_consumption.txt", sep=";", na.strings="?", skip=66637, nrows=2880)

names(dat) <- names(read.table("household_power_consumption.txt", sep=";", header=T, nrows=1))

dat$DateTime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M") 

par(mfrow=c(1,1))

hist(dat[,3], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.copy(png, file="plot1.png")
dev.off()