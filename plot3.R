data <- read.csv("household_power_consumption.txt",na.strings="?",header=TRUE,sep=";",stringsAsFactors=F)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

my_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#This is a lot of data, we are not using it let's get rid of it.
rm(data)

date_time <- paste(my_data$Date,my_data$Time)

my_data$DateTime <- as.POSIXct(date_time)


## Dome loading data. Let's build plot3
with(my_data, {
  plot(Sub_metering_1~DateTime, type="l",
  ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright",
       col=c("black", "red", "blue"),
       lty=1,
       lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()