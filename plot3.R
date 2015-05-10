header = read.table("household_power_consumption.txt", header = FALSE, sep = ";", nrows=1)
dataset = read.table("household_power_consumption.txt", header = TRUE, sep = ";", skip="66636", nrows=2880)
colnames(dataset) = unlist(header)
dataset$DateTime = strptime(paste(dataset$Date, dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


with(dataset, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy submetering"))
with(dataset, lines(DateTime, Sub_metering_2, col="red"))
with(dataset, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
