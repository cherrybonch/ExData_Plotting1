library(dplyr)
library(lubridate)
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
household_power_consumption$Date <- as.Date(strptime(household_power_consumption$Date, format = "%d/%m/%Y"))
filtered <- filter(household_power_consumption, (Date == "2007-02-01") | (Date == "2007-02-02"))

datetime <- paste(as.Date(filtered$Date), filtered$Time)
filtered$Datetime <- as.POSIXct(datetime)

#plot
plot(as.numeric(as.character(filtered$Sub_metering_1))~filtered$Datetime, type="l",
     ylab="Energy sub metering", xlab="")
lines(as.numeric(as.character(filtered$Sub_metering_2))~filtered$Datetime, type="l",
      col = "red")
lines(as.numeric(as.character(filtered$Sub_metering_3))~filtered$Datetime, type="l",
      col = "blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , 
       lty=1, col=c('black','red', 'blue'), cex=.75)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()