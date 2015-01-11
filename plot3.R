#code for reading the data 
source("loadData.R")

plot3 <- function()
{
  #reading data
  data <- readData() 
  
  png(filename = "plot3.png", width = 480, height = 480, units = "px")
  
  plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", xlab="", ylab="Energy sub metering") 
  
  #adding the extra submetering lines
  lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red") 
  
  lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue") 
  
  #adding the legend
  cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 
  
  legend("topright", lty = 1, lwd = 1, col = c("black","red","blue"), legend=cols) 
  
  #close plotting device
  dev.off()
}

plot3()