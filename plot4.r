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
subset_data$Global_reactive_power<-as.numeric(subset_data$Global_reactive_power)
subset_data$Voltage<-as.numeric(subset_data$Voltage)
subset_data$Sub_metering_1<-as.numeric(subset_data$Sub_metering_1)
subset_data$Sub_metering_2<-as.numeric(subset_data$Sub_metering_2)
subset_data$Sub_metering_3<-as.numeric(subset_data$Sub_metering_3)
# Creating variable for time
subset_data$datetime<-paste(subset_data$Date, subset_data$Time)
subset_data$datetime<-strptime(subset_data$datetime, "%d/%m/%Y %H:%M:%S")
head(subset_data)
# Creating png file
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))
# Top left subplot
plot(subset_data$datetime, subset_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# Bottom left subplot
plot(subset_data$datetime, subset_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subset_data$datetime, subset_data$Sub_metering_2, type="l", col="red")
lines(subset_data$datetime, subset_data$Sub_metering_3, type="l", col="blue")
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Top right subplot
plot(subset_data$datetime, subset_data$Voltage, type="l", xlab="datetime", ylab="Voltage")
# Bottom right subplot
plot(subset_data$datetime, subset_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()