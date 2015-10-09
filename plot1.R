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

# Plot 1 
hist(twodays$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", col = "red")
setwd("C:/Users/Brad/Documents/R/Exploratory Analysis/Assignment1")
dev.copy(png, "plot1.png")
dev.off()

