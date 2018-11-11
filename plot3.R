file <- read.csv("household_power_consumption.txt", 
                header=T, sep=';', na.strings="?",
                nrows=2075259, check.names=F, 
                stringsAsFactors=F, comment.char="",
                quote='\"')

dataDesired <- subset(file, Date %in% 
                 c("1/2/2007","2/2/2007"))
dataDesired$Date <- as.Date(dataDesired$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(dataDesired$Date), dataDesired$Time)
dataDesired$Datetime <- as.POSIXct(datetime)

globalActivePower <- as.numeric(dataDesired$Global_active_power)

subMetering1 <- as.numeric(dataDesired$Sub_metering_1)
subMetering2 <- as.numeric(dataDesired$Sub_metering_2)
subMetering3 <- as.numeric(dataDesired$Sub_metering_3)

png("plot3.png", width=480, height=480)

with(dataDesired, {
            plot(subMetering1~Datetime, type="l",
            ylab="Global Active Power (kilowatts)", xlab="")
            lines(subMetering2~Datetime,col='Red')
            lines(subMetering3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
