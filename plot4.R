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


##### Plot 4 #####
# Set Parms for 2 x 2 and margins 
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
#4a 
plot(twodays$Global_active_power ~ twodays$DateTime, type = "l", ylab = "Global Active Power (Kilowatts)", xlab="", col = "black")
#4b
plot(twodays$Voltage ~ twodays$DateTime, type = "l", ylab = "Voltage", xlab="DateTime", col = "black")
#4c
# Init Graph 
with(twodays, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy Sub Metering", xlab =""))
# 3 Lines for different Sub_Metering 
points(twodays$DateTime, twodays$Sub_metering_1, type = "l", col = "black")
points(twodays$DateTime, twodays$Sub_metering_2, type = "l", col = "red")
points(twodays$DateTime, twodays$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lty=c(1,1), lwd=c(2.5,2.5) )
#4d 
plot(twodays$Global_reactive_power ~ twodays$DateTime, type = "l", ylab = "Global reactive Power", xlab="DateTime", col = "black")

setwd("C:/Users/Brad/Documents/R/Exploratory Analysis/Assignment1")
dev.copy(png, "plot4.png")
dev.off()
