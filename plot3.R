library("lubridate")
Datafile <- "household_power_consumption.txt"
dat <- read.table(file=Datafile, header=TRUE, sep = ";", na.strings="?", stringsAsFactors = FALSE)
dat$Date.Time <- paste(dat$Date,dat$Time)
dat$Date.Time <- dmy_hms(dat$Date.Time)
dat$Date <- dmy(dat$Date)
subDat <- dat[which(dat$Date=="2007-02-01"| dat$Date == "2007-02-02"),]

png(file="plot3.png",width=480,height=480)  
par(mar=c(4,4,2,2))

plot(subDat$Date.Time,subDat$Sub_metering_1, type="n",
     xlab="",
     ylab="Energy sub metering",
     cex.axis=1.0,cex.lab = 1.0)

lines(subDat$Date.Time,subDat$Sub_metering_1, type="l",col="black")
lines(subDat$Date.Time,subDat$Sub_metering_2, type="l",col="red")
lines(subDat$Date.Time,subDat$Sub_metering_3, type="l",col="blue")

legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),col=c("black","blue","red"))

dev.off()
