library(dplyr)
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
household_power_consumption$Date <- as.Date(strptime(household_power_consumption$Date, format = "%d/%m/%Y"))
filtered <- filter(household_power_consumption, (Date == "2007-02-01") | (Date == "2007-02-02"))

hist(as.numeric(as.character(filtered$Global_active_power)), 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()