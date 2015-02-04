library("lubridate")
Datafile <- "household_power_consumption.txt"
dat <- read.table(file=Datafile, header=TRUE, sep = ";", na.strings="?", stringsAsFactors = FALSE)
dat$Date.Time <- paste(dat$Date,dat$Time)
dat$Date.Time <- dmy_hms(dat$Date.Time)
dat$Date <- dmy(dat$Date)
subDat <- dat[which(dat$Date=="2007-02-01"| dat$Date == "2007-02-02"),]

png(file="plot4.png",width=480,height=480)  

par(mfrow=c(2,2))
par(mar=c(6,4,2,2))
par(oma=c(0,0,2,0))

plot(subDat$Date.Time,subDat$Global_active_power, type="n",
     xlab="",
     ylab="Global Active Power",
     cex.axis=1.0,cex.lab = 1.0)
lines(subDat$Date.Time,subDat$Global_active_power, type="l",col="black")

plot(subDat$Date.Time,subDat$Voltage, type="n",
     xlab="datetime",
     ylab="Voltage",
     cex.axis=1.0,cex.lab = 1.0)
lines(subDat$Date.Time,subDat$Voltage, type="l",col="black")

plot(subDat$Date.Time,subDat$Sub_metering_1, type="n",
     xlab="",
     ylab="Energy sub metering",
     cex.axis=1.0,cex.lab = 1.0)

lines(subDat$Date.Time,subDat$Sub_metering_1, type="l",col="black")
lines(subDat$Date.Time,subDat$Sub_metering_2, type="l",col="red")
lines(subDat$Date.Time,subDat$Sub_metering_3, type="l",col="blue")

##bty = "n" turns off box
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),col=c("black","blue","red"),bty="n",cex=1.0) 

plot(subDat$Date.Time,subDat$Global_reactive_power, type="n",
     xlab="datetime",
     ylab="Global_reactive_power",
     cex.axis=1.0,cex.lab = 1.0)
lines(subDat$Date.Time,subDat$Global_reactive_power, type="l",col="black")

dev.off()


