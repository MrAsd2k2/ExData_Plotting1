# plot1.R script
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

# create an histogram with red vertical bars, change the main and x axis labels 
# save the results to a 480x480 pixels png file 

png("plot1.png", height = 480, width= 480, units = "px")
hist(as.numeric(wdata$Global_active_power), xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "red")
dev.off()
