header = read.table("household_power_consumption.txt", header = FALSE, sep = ";", nrows=1)
dataset = read.table("household_power_consumption.txt", header = TRUE, sep = ";", skip="66636", nrows=2880)
colnames(dataset) = unlist(header)
dataset$DateTime = strptime(paste(dataset$Date, dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

with(dataset, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
