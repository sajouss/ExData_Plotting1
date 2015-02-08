data <- read.csv("household_power_consumption.txt",na.strings="?",header=TRUE,sep=";",stringsAsFactors=F)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

my_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#This is a lot of data, we are not using it let's get rid of it.
rm(data)

date_time <- paste(my_data$Date,my_data$Time)

my_data$DateTime <- as.POSIXct(date_time)

#We are done loading the data. Let's build plot2

plot(my_data$Global_active_power~my_data$DateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

