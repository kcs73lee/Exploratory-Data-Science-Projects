hpcdat <- read.table("household_power_consumption.txt", header= TRUE, sep =";", na.strings = c("?"), stringsAsFactors = FALSE)
hpcdat$Date<-as.Date(hpcdat$Date, format="%d/%m/%Y")
hpcdatsub <- subset(hpcdat, Date >= "2007-02-01" & Date <= "2007-02-02")

## plo1 1
png("plot1.png", height = 480, width = 480)
hist(hpcdatsub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()

##plot 2
DT<- paste(as.Date(hpcdatsub$Date), hpcdatsub$Time)
hpcdatsub$datetime <- as.POSIXct(DT)
plot(hpcdatsub$Global_active_power~hpcdatsub$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
png("plot2.png", height = 480, width= 480)
dev.off()

##plot3
with(hpcdatsub, {plot(Sub_metering_1~datetime, type="l",
                      ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
png("plot3.png", height = 480, width= 480)
dev.off()

##plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(hpcdatsub, {plot(Global_active_power~datetime, type="l", 
                      ylab="Global Active Power", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power",xlab="")})
png("plot4.png", height = 480, width= 480)
dev.off()