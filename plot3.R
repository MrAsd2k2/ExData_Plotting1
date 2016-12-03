# plot3.R script
#
# Note: this script will load and unzip a 2075259x9 data frame
# it needs a computer with an adequate amount of RAM

# download the data from itnernet
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "household_power_consumption.zip", method="auto")

#unzip the data on-the-fly
data <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"), 
                   header = TRUE, sep = ";", stringsAsFactors = FALSE)

# subset the records produced on February the 1st 2007 and February the 2nd 2007
wdata <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]


# convert the date time and save in a vector of POXSIXlt and POSIXt
tempo <- strptime(paste(wdata$Date,wdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# reset locale so weekdays will appears in english  
# Warning: this might not work under different OS/architectures!
Sys.setlocale("LC_TIME", "C")

# create the plot and save the result to a 480x480 pixels png file 

png("plot3.png", height = 480, width= 480, units = "px")
plot(x = tempo, y = wdata$Sub_metering_1, xlab = "", ylab = "Energy sub metering",
     col = "black", type = "l")
lines(x = tempo, y = wdata$Sub_metering_2, col = "red")
lines(x = tempo, y = wdata$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lwd = 1)
dev.off()