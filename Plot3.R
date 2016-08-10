library(data.table)
data <- fread("./data/household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

date_time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot3.png", width=480, height=480)
plot(date_time,data$Sub_metering_1,type="l", xlab="", ylab="Energy Submetering")
lines(date_time,data$Sub_metering_2,col="red")
lines(date_time,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1,col=c("black", "red", "blue"))
dev.off()