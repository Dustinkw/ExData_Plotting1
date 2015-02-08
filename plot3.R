
## Data Prep
csvData <- read.csv("~/downloads/household_power_consumption.txt", sep=";", na.strings="?");
matches <- as.Date(csvData$Date, format="%d/%m/%Y") >= as.Date("01/02/2007", format="%d/%m/%Y") & as.Date(csvData$Date, format="%d/%m/%Y") < as.Date("03/02/2007", format="%d/%m/%Y") 
meterdata <- csvData[matches,]
meterdata$datetime<- strptime(paste(meterdata$Date, meterdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## plot 3
png(filename="~/documents/plot3.png")
par(mfrow=c(1,1))

with(meterdata, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", cex.axis=0.8, cex.lab = 0.8, type="n"))
with(meterdata, lines(datetime, Sub_metering_1))
with(meterdata, lines(datetime, Sub_metering_2, col="red"))
with(meterdata, lines(datetime, Sub_metering_3, col="blue"))
legend("topright",col=c("black","red","blue"),lty=1,lwd=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=1)

dev.off()
