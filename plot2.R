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

## plot 2
data_selected$Weekday<-strptime(paste(data_selected$Date,data_selected$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png",width=480,height=480)
with(data_selected,plot(Weekday,Global_active_power_numeric,xlab="",ylab="Global Active Power (kilowatts)",type="l"))
dev.off()
