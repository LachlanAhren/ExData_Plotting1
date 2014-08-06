# Create image representing histogram of Global Active Power on 2/1/2007 and 2/2/2007
plot1 <- function() { 
    #Read Raw Data
    data <- read.table("household_power_consumption.txt", colClasses = "character", sep=";", header=TRUE)
    #Extract relevant days
    subset <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007", ]
    #Create usable timestamp
    subset$DateTime <- strptime(paste(subset$Date, subset$Time), "%d/%m/%Y %H:%M")
    #Open png device for plot output
    png(file="plot1.png",width=480,height=480)
    hist(as.numeric(subset$Global_active_power), col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
    dev.off()
}