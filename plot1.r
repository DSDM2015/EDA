setwd("C:/DATA/Office/Current/Coursera/Exploratory Data Analysis")
# Downloading and unzipping file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), header=T, sep=";", dec=".")
unlink(temp)
head(data)
# Subsetting and converting variable
subset_data<-data[data$Date=="1/2/2007"  | data$Date=="2/2/2007", ]
rm(data)
names(subset_data)
subset_data$Global_active_power<-as.numeric(subset_data$Global_active_power)
# Creating histogram for the screen device
hist(subset_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
# Creating png file
png("plot1.png", width=480, height=480)
hist(subset_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
