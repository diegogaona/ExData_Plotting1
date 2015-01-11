#code for reading the data 
source("loadData.R")

plot4 <- function()
{
  #reading data
  data <- readData()
  
  png(filename = "plot4.png", width = 480, height = 480, units = "px")
  
  par (mfrow = c(2,2))
  
  #top left
  plot(data$DateTime, data$Global_active_power, xlab="", ylab="Global Active Power", type="l")
  
  #top right
  plot(data$DateTime, data$Voltage, xlab="datetime", ylab="Voltage", type="l")
  
  #bottom left
  plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", xlab="", ylab="Energy sub metering") 
  
  #adding the extra lines
  lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red") 
  
  lines(data$DateTime, data$Sub_metering_3, type = "l", col= "blue") 
  
  #adding the legend but without the box "bty=n".
  cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 
  
  legend("topright", lty=1, lwd=1, col=c("black","red","blue"), legend= cols, bty = "n") 
  
  #bottom right
  
  plot(data$DateTime, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")      
  
  #close plotting device
  dev.off()
}

plot4()