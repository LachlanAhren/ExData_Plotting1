# Retrieve file in a reproducible manner
retrieve_file <- function() {
    if (!file.exists("./data"))
    {
        dir.create("./data")
    }
    if (!file.exists("./data/household_power_consumption.txt"))
    {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl,"./data/household_power_consumption.zip", "curl")
        unzip("./data/household_power_consumption.zip",exdir = "./data")
    }
}
# Create image of Sub metering on 2/1/2007 and 2/2/2007
plot3 <- function() { 
    #Read Raw Data
    data <- read.table("./data/household_power_consumption.txt", colClasses = "character", sep=";", header=TRUE,na.strings ="?")
    #Extract relevant days
    subset <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007", ]
    #Create usable timestamp
    subset$DateTime <- strptime(paste(subset$Date, subset$Time), "%d/%m/%Y %H:%M")
    #Open png device for plot output
    png(file="plot3.png",width=480,height=480)
    par(mfrow=c(1,1))
    plot(subset$DateTime,subset$Sub_metering_1,type="l",ylab="Energy sub metering", xlab = "")
    lines(subset$DateTime,subset$Sub_metering_3,col="blue")
    lines(subset$DateTime,subset$Sub_metering_2,col="red")
    leg.txt <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
    col.txt <- c("black","red","blue")
    legend("topright",legend = leg.txt, col = col.txt,lty= c(1,1))
    dev.off()
}
plot3()