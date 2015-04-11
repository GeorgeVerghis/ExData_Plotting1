#######  Assignment 2 ######################################
getwd()
setwd("/Users/georgeverghis/desktop/Coursera")
datafile<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
datafile$Date<-as.Date(datafile$Date, format = "%d/%m/%Y")
get.rows   <- datafile$Date >= as.Date("2007-02-01") & datafile$Date <= as.Date("2007-02-02")
data <- datafile[get.rows, ]
png(filename="plot2.png")
plot(as.POSIXct(paste(data$Date, data$Time)),as.numeric(as.character(data$Global_active_power)),type='l',xlab="",ylab="Global Active Power (kilowatts)")
dev.off()