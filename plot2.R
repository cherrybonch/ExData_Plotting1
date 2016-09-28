library(dplyr)
library(lubridate)
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
household_power_consumption$Date <- as.Date(strptime(household_power_consumption$Date, format = "%d/%m/%Y"))
filtered <- filter(household_power_consumption, (Date == "2007-02-01") | (Date == "2007-02-02"))

datetime <- paste(as.Date(filtered$Date), filtered$Time)
filtered$Datetime <- as.POSIXct(datetime)

#plot
plot(as.numeric(as.character(filtered$Global_active_power))~filtered$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()