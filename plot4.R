header = read.table("household_power_consumption.txt", header = FALSE, sep = ";", nrows=1)
dataset = read.table("household_power_consumption.txt", header = TRUE, sep = ";", skip="66636", nrows=2880)
colnames(dataset) = unlist(header)
dataset$DateTime = strptime(paste(dataset$Date, dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


par(mfrow=c(2,2))
with(dataset, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

with(dataset, plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

with(dataset, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy submetering"))
with(dataset, lines(DateTime, Sub_metering_2, col="red"))
with(dataset, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(dataset, plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

