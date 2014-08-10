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
# Create image of Global Active Power on 2/1/2007 and 2/2/2007
plot2 <- function() { 
    #Read Raw Data
    data <- read.table("./data/household_power_consumption.txt", colClasses = "character", sep=";", header=TRUE,na.strings ="?")
    #Extract relevant days
    subset <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007", ]
    #Create usable timestamp
    subset$DateTime <- strptime(paste(subset$Date, subset$Time), "%d/%m/%Y %H:%M")
    #Open png device for plot output
    png(file="plot2.png",width=480,height=480)
    par(mfrow=c(1,1))
    plot(subset$DateTime,subset$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab = "")
    dev.off()
}