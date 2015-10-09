setwd("c:/data")

# Read Data
data <- read.csv("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";", na.strings="?")

# Create Date Time Column 
DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Append new DateTime Column 
all <- cbind(data, DateTime)

# Conver Date 
all$Date <- as.Date(all$Date,"%d/%m/%Y")

# Just get two days of data 
twodays <- subset(all, Date >= '2007-02-01' & Date <= '2007-02-02')

# Plot 3
# Init Graph 
with(twodays, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy Sub Metering", xlab =""))

# Plot 3 Lines for different Sub_Metering 
points(twodays$DateTime, twodays$Sub_metering_1, type = "l", col = "black")
points(twodays$DateTime, twodays$Sub_metering_2, type = "l", col = "red")
points(twodays$DateTime, twodays$Sub_metering_3, type = "l", col = "blue")

setwd("C:/Users/Brad/Documents/R/Exploratory Analysis/Assignment1")
dev.copy(png, "plot3.png")
dev.off()
