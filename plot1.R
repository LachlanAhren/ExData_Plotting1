plot1 <- function() { 
    data <- read.table("household_power_consumption.txt", colClasses = "character", sep=";", header=TRUE)
    subset <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007", ]
    subset$DateTime <- strptime(paste(subset$Date, subset$Time), "%d/%m/%Y %H:%M")
    png(file="plot1.png",width=480,height=480)
    hist(as.numeric(subset$Global_active_power), col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
    dev.off()
}