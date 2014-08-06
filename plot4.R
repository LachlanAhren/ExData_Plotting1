# Create 4 plot image of power consumption on 2/1/2007 and 2/2/2007
plot4 <- function() { 
    #Read Raw Data
    data <- read.table("household_power_consumption.txt", colClasses = "character", sep=";", header=TRUE)
    #Extract relevant days
    subset <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007", ]
    #Create usable timestamp
    subset$DateTime <- strptime(paste(subset$Date, subset$Time), "%d/%m/%Y %H:%M")
    #Open png device for plot output
    png(file="plot4.png",width=480,height=480)
    par(mfrow=c(2,2))
    plot(subset$DateTime,subset$Global_active_power,type="l",ylab="Global Active Power", xlab = "")
    plot(subset$DateTime,subset$Voltage,type="l",ylab="Voltage", xlab = "datetime")
    plot(subset$DateTime,subset$Sub_metering_1,type="l",ylab="Energy sub metering", xlab = "")
    lines(subset$DateTime,subset$Sub_metering_3,col="blue")
    lines(subset$DateTime,subset$Sub_metering_2,col="red")
    leg.txt <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
    col.txt <- c("black","red","blue")
    legend("topright",legend = leg.txt, col = col.txt,lty= c(1,1))
    plot(subset$DateTime,subset$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab = "datetime")
    dev.off()
}