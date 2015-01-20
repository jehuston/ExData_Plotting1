setwd("/Users/janehuston/mypy/coursera/datasciencecoursera")
library(data.table)
p<- fread('grep "^[12]/2/2007" household_power_consumption.txt', na.strings=c("?", ""))
setnames(p, colnames(fread('household_power_consumption.txt', nrows=0)))
p<- as.data.frame(p)
p$DateTime <- as.POSIXlt(paste(p$Date, p$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 3: Energy sub metering (y) by day of week(x) with diff color line for sub_metering_1, _2, _3  
png(filename="plot3.png")
plot(p$DateTime, p$Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="")
lines(p$DateTime, p$Sub_metering_2, type="l", col="red")
lines(p$DateTime, p$Sub_metering_3, type="l", col="blue")
legend("topright", pch=19, col=c("black", "blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()