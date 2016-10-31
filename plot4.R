## set path
path<-setwd("D:\\exploratory data\\project 1\\household_power_consumption")

## read data
data_raw <- read.table("./household_power_consumption.txt",header=T, sep=';', na.strings="?")
head(data_raw)

## select qualified data
data_selected <- data_raw[data_raw$Date %in% c("1/2/2007","2/2/2007") ,]
head(data_selected)

## conver to numeric
data_selected$Global_active_power_numeric<-as.numeric(data_selected$Global_active_power)

## plot 4
data_selected$Weekday<-strptime(paste(data_selected$Date,data_selected$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png",width=480,height=480)

par(mfrow=c(2,2))

with(data_selected,plot(Weekday,Global_active_power_numeric,xlab="",ylab="Global Active Power",type="l"))

with(data_selected,plot(Weekday,Voltage,xlab="datetime",ylab="Voltage",type="l"))

with(data_selected,plot(Weekday,Sub_metering_1,xlab="",ylab="Energy Sub metering",type="l",col="black"))
lines(data_selected$Weekday,data_selected$Sub_metering_2,xlab="",ylab="Energy Sub metering",type="l",col="red")
lines(data_selected$Weekday,data_selected$Sub_metering_3,xlab="",ylab="Energy Sub metering",type="l",col="blue")
legend("topright",pch=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(data_selected,plot(Weekday,Global_reactive_power,xlab="datetime",ylab="Global Reactive Power",type="l"))

dev.off()