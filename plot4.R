data <- read.csv("household_power_consumption.txt",na.strings="?",header=TRUE,sep=";",stringsAsFactors=F)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

my_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#This is a lot of data, we are not using it let's get rid of it.
rm(data)

date_time <- paste(my_data$Date,my_data$Time)

my_data$DateTime <- as.POSIXct(date_time)

## Done loading data. Let's build plot4.png

quartz()
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(my_data, {
  plot(Global_active_power~DateTime,
       type="l", 
       ylab="Global Active Power",
       xlab="")
  plot(Voltage~DateTime,
       type="l", 
       ylab="Voltage",
       xlab="datetime")
  plot(Sub_metering_1~DateTime,
       type="l", 
       ylab="Energy sub metering",
       xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright",
         col=c("black", "red", "blue"),
         lty=1,
         lwd=2,         
         bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime,
       type="l", 
       xlab="datetime")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()