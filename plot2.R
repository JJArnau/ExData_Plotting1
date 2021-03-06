plot2 <- function()
{
  #Load Data into DataTable
  File <- "./data/exdata-data-household_power_consumption/household_power_consumption.txt"
  data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE)
  #Subset relevant data for the analysis (data from the dates 2007-02-01 and 2007-02-02)
  subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  
  #Subset data to be used on the graph
  datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  globalActivePower <- as.numeric(subSetData$Global_active_power)
  png("plot2.png", width=480, height=480)
  
  #Create plot graph and replicate format
  plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
}