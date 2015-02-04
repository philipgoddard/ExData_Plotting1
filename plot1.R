library("lubridate")
Datafile <- "household_power_consumption.txt"
dat <- read.table(file=Datafile, header=TRUE, sep = ";", na.strings="?", stringsAsFactors = FALSE)
dat$Date <- dmy(dat$Date)
#dat$Time <- strptime(dat$Time, "%H:%M:%S")
subDat <- dat[which(dat$Date=="2007-02-01"| dat$Date == "2007-02-02"),]
    
png(file="plot1.png",width=480,height=480)  

par(mar=c(4,4,2,2))
par(oma=c(1,1,1,1)

with(subDat,hist(Global_active_power,col="red",
                 main="Global Active Power",
                 xlab= "Global Active Power (kilowatts)",
                 cex.axis=1.0,cex.lab = 1.0,cex.main=1.0))    

dev.off()

