data <- read.csv("household_power_consumption.txt",na.strings="?",header=TRUE,sep=";",stringsAsFactors=F)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

my_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#This is a lot of data, we are not using it let's get rid of it.
rm(data)

date_time <- paste(my_data$Date,my_data$Time)

my_data$DateTime <- as.POSIXct(date_time)

##Done loading data. Let's build plot1


hist(as.numeric(my_data$Global_active_power), xlab="Global Active Power (kilowatts)", main="Global Active Power",col="red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()



