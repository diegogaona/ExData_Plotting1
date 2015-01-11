#code for reading the data 
source("loadData.R")

#reading data
data <- readData() 

plot1 <- function()
{
  png(filename = "plot1.png", width = 480, height = 480, units = "px")
  
  #creating an historigram with the global active power
  hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red") 
  
  #close plotting device
  dev.off() 
}

plot1()