plot3 <- function() { 
    data <- read.table("household_power_consumption.txt", colClasses = "character", sep=";", header=TRUE)
    subset <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007", ]
    subset$DateTime <- strptime(paste(subset$Date, subset$Time), "%d/%m/%Y %H:%M")
    png(file="plot3.png",width=480,height=480)
    plot(subset$DateTime,subset$Sub_metering_1,type="l",ylab="Energy sub metering", xlab = "")
    lines(subset$DateTime,subset$Sub_metering_3,col="blue")
    lines(subset$DateTime,subset$Sub_metering_2,col="red")
    leg.txt <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
    col.txt <- c("black","red","blue")
    legend("topright",legend = leg.txt, col = col.txt,lty= c(1,1))
    dev.off()
}