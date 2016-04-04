plot3 <- function()
{
  #Load Data into DataTable
  File <- "./data/exdata-data-household_power_consumption/household_power_consumption.txt"
  data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE)
  #Subset relevant data for the analysis (data from the dates 2007-02-01 and 2007-02-02)
  subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  
  #Subset data to be used on the graph
  datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
  Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
  Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)
  globalActivePower <- as.numeric(subSetData$Global_active_power)
  
  png("plot3.png", width=480, height=480)
  #Create plot graph and replicate format
  plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  
  #Add additional lines with other submetering
  lines(datetime, Sub_metering_2, type="l", col="red")
  lines(datetime, Sub_metering_3, type="l", col="blue")
  
  #Include Legend
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  dev.off()
}