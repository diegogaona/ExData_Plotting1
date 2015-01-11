#Preparing the data

readData <- function()
{
  #create the data directory within the working directory
  if(!file.exists("data")) 
  { 
    dir.create("data") 
  } 
  
  
  if(!file.exists("./data/household_power_consumption.txt"))
  {
    #URL data location
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    
    #Download the dataset
    download.file(fileUrl, destfile = "data/Dataset.zip")
    
    #Unzip the file
    unzip("data/Dataset.zip", exdir="data")
  }
  
  subset <- "./data/subset.csv"
  
  if(file.exists(subset)) 
  { 
    data <- read.csv(subset) 
    data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S") 
  } 
  else
  {
    data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
               colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", 
                              "numeric", "numeric", "numeric"))
       
    #filtering data from the dates 2007-02-01 and 2007-02-02
    data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
    
    #creating a new Column called DateTime
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    #writing a new file if is needed later
    write.csv(data, file = subset, row.names=FALSE, na="?")
  }
  data
}

