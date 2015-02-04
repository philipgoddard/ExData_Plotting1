library("lubridate")
Datafile <- "household_power_consumption.txt"
dat <- read.table(file=Datafile, header=TRUE, sep = ";", na.strings="?", stringsAsFactors = FALSE)
dat$Date.Time <- paste(dat$Date,dat$Time)
dat$Date.Time <- dmy_hms(dat$Date.Time)
dat$Date <- dmy(dat$Date)
subDat <- dat[which(dat$Date=="2007-02-01"| dat$Date == "2007-02-02"),]

png(file="plot2.png",width=480,height=480)  

par(mar=c(4,4,2,2))

plot(subDat$Date.Time,subDat$Global_active_power, type="n",
     xlab="",
     ylab="Global Active Power (kilowatts)",
     cex.axis=1.0,cex.lab = 1.0)
lines(subDat$Date.Time,subDat$Global_active_power,
      type="l",
      col="black",
      lwd=1.0)

dev.off()
