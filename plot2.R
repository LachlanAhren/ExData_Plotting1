plot2 <- function() { 
    data <- read.table("household_power_consumption.txt", colClasses = "character", sep=";", header=TRUE)
    subset <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007", ]
    subset$DateTime <- strptime(paste(subset$Date, subset$Time), "%d/%m/%Y %H:%M")
    png(file="plot2.png",width=480,height=480)
    plot(subset$DateTime,subset$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab = "")
    dev.off()
}