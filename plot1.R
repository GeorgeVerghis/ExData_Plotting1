###### Assignment 1 ########################################
setwd("/Users/georgeverghis/desktop/Coursera")
datafile<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
datafile$Date<-as.Date(datafile$Date, format = "%d/%m/%Y")
get.rows   <- datafile$Date >= as.Date("2007-02-01") & datafile$Date <= as.Date("2007-02-02")
data <- datafile[get.rows, ]
png(filename="plot1.png",width = 480, height = 480, units = "px")
hist(as.numeric(as.character(data$Global_active_power)), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()