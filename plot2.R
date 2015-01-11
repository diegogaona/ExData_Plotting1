#code for reading the data 
source("loadData.R")

plot2 <- function()
{
  #reading data
  data <- readData() 
  
  png(filename = "plot2.png", width = 480, height = 480, units = "px") 
  
  #plot the active power, x = DateTime and y axis the Global active power
  plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
  
  #close plotting device
  dev.off() 
}

plot2()
