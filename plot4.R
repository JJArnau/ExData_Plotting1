plot4 <- function()
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
  Global_active_power <- as.numeric(subSetData$Global_active_power)
  Global_reactive_power <- as.numeric(subSetData$Global_reactive_power)
  Voltage <- as.numeric(subSetData$Voltage)

  png("plot4.png", width=480, height=480)
  par(mfrow = c(2, 2)) 
  
  #Create graph and replicate format. Also add additional info (lines)
  plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
  
  plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(datetime, Sub_metering_2, type="l", col="red")
  lines(datetime, Sub_metering_3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
  
  plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.off()
}