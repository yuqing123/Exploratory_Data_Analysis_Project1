library(data.table)
data <- fread("./data/household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

date_time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(date_time,data$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()