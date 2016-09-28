library(dplyr)
library(lubridate)
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
household_power_consumption$Date <- as.Date(strptime(household_power_consumption$Date, format = "%d/%m/%Y"))
filtered <- filter(household_power_consumption, (Date == "2007-02-01") | (Date == "2007-02-02"))

datetime <- paste(as.Date(filtered$Date), filtered$Time)
filtered$Datetime <- as.POSIXct(datetime)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(filtered$Datetime, as.numeric(as.character(filtered$Global_active_power)), type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(filtered$Datetime, as.numeric(as.character(filtered$Voltage)), type="l", xlab="datetime", ylab="Voltage")

plot(as.numeric(as.character(filtered$Sub_metering_1))~filtered$Datetime, type="l",
    ylab="Energy sub metering", xlab="")
lines(as.numeric(as.character(filtered$Sub_metering_2))~filtered$Datetime, type="l",
      col = "red")
lines(as.numeric(as.character(filtered$Sub_metering_3))~filtered$Datetime, type="l",
      col = "blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , 
       lty=1, col=c('black','red', 'blue'), cex=.75)

plot(filtered$Datetime, as.numeric(as.character(filtered$Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()