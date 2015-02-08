## Data Prep
csvData <- read.csv("~/downloads/household_power_consumption.txt", sep=";", na.strings="?");
matches <- as.Date(csvData$Date, format="%d/%m/%Y") >= as.Date("01/02/2007", format="%d/%m/%Y") & as.Date(csvData$Date, format="%d/%m/%Y") < as.Date("03/02/2007", format="%d/%m/%Y") 
meterdata <- csvData[matches,]
meterdata$datetime<- strptime(paste(meterdata$Date, meterdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## plot 2
png(filename="~/documents/plot2.png")
par(mfrow=c(1,1))
with(meterdata, plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", cex.axis=0.8, cex.lab = 0.8, type="n"))
with(meterdata, lines(datetime, Global_active_power))
dev.off()