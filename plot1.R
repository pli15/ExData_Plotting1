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


## plot 1
png("plot1.png",width=480,height=480)
hist(data_selected$Global_active_power_numeric,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
