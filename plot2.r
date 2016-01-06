setwd("C:/DATA/Office/Current/Coursera/Exploratory Data Analysis")
# Downloading and unzipping file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), header=T, sep=";", dec=".")
unlink(temp)
head(data)
# Subsetting and converting variables
subset_data<-data[data$Date=="1/2/2007"  | data$Date=="2/2/2007", ]
rm(data)
names(subset_data)
subset_data$Global_active_power<-as.numeric(subset_data$Global_active_power)
subset_data$datetime<-paste(subset_data$Date, subset_data$Time)
subset_data$datetime<-strptime(subset_data$datetime, "%d/%m/%Y %H:%M:%S")
head(subset_data)

# Creating png file
png("plot2.png", width=480, height=480)
plot(subset_data$datetime, subset_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
