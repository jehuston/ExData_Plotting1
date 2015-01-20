setwd("/Users/janehuston/mypy/coursera/ExData_Plotting1")
library(data.table)
p<- fread('grep "^[12]/2/2007" household_power_consumption.txt', na.strings=c("?", ""))
setnames(p, colnames(fread('household_power_consumption.txt', nrows=0)))
p<- as.data.frame(p)
p$DateTime <- as.POSIXlt(paste(p$Date, p$Time), format="%d/%m/%Y %H:%M:%S")

png(filename="plot1.png", width=480, height=480, units="px")
hist(p$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
