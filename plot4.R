setwd("/Users/janehuston/mypy/coursera/datasciencecoursera")
library(data.table)
p<- fread('grep "^[12]/2/2007" household_power_consumption.txt', na.strings=c("?", ""))
setnames(p, colnames(fread('household_power_consumption.txt', nrows=0)))
p<- as.data.frame(p)
p$DateTime <- as.POSIXlt(paste(p$Date, p$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 4:4 line charts with dateime on x and Global_active_power, Voltage, Energy_sub_metering, 
#and Global_reactive_power on y-axes
png("plot4.png")
par(mfrow = c(2, 2))
with(p, {
  plot(DateTime, Global_active_power, type="l", ylab = "Global Active Power")
  plot(DateTime, Voltage, type="l", ylab = "Voltage")
  plot(DateTime, Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="")
  lines(DateTime, Sub_metering_2, type="l", col="red")
  lines(DateTime, Sub_metering_3, type="l", col="blue")
  plot(DateTime, Global_reactive_power, type="l", ylab="Global Reactive Power")
})
dev.off()