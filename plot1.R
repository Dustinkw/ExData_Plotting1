## Data Prep
csvData <- read.csv("~/downloads/household_power_consumption.txt", sep=";", na.strings="?");
matches <- as.Date(csvData$Date, format="%d/%m/%Y") >= as.Date("01/02/2007", format="%d/%m/%Y") & as.Date(csvData$Date, format="%d/%m/%Y") < as.Date("03/02/2007", format="%d/%m/%Y") 
meterdata <- csvData[matches,]
meterdata$datetime<- strptime(paste(meterdata$Date, meterdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## plot 1
png(filename="~/documents/plot1.png")
par(mfrow=c(1,1))
hist(meterdata$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", cex.axis=0.65, cex.lab = 0.8);
dev.off()