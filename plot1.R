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


# Create image representing histogram of Global Active Power on 2/1/2007 and 2/2/2007
plot1 <- function() { 
    #Read Raw Data
    retrieve_file()
    data <- read.table("./data/household_power_consumption.txt", colClasses = "character", sep=";", header=TRUE, na.strings ="?")
    #Extract relevant days
    subset <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007", ]
    #Create usable timestamp
    subset$DateTime <- strptime(paste(subset$Date, subset$Time), "%d/%m/%Y %H:%M")
    #Open png device for plot output
    png(file="plot1.png",width=480,height=480)
    par(mfrow=c(1,1))
    hist(as.numeric(subset$Global_active_power), col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
    dev.off()
}