plot1 <- function() {

file <- read.csv("household_power_consumption.txt", 
                      header=T, sep=';', na.strings="?",
                      nrows=2075259, check.names=F, 
                      stringsAsFactors=F, comment.char="",
                      quote='\"')
dataDesired <- subset(file, Date %in% 
                  c("1/2/2007","2/2/2007"))
dataDesired$Date <- as.Date(dataDesired$Date, format="%d/%m/%Y")


globalActivePower <- as.numeric(dataDesired$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()

}