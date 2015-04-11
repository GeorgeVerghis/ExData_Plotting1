#######  Assignment 4 ######################################
setwd("/Users/georgeverghis/desktop/Coursera")
png(filename="plot4.png",width = 480, height = 480, units = "px") 
par(mfrow=c(2,2), mar = c(4,4,3,1))
datafile<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
datafile$Date<-as.Date(datafile$Date, format = "%d/%m/%Y")
get.rows   <- datafile$Date >= as.Date("2007-02-01") & datafile$Date <= as.Date("2007-02-02")
data <- datafile[get.rows, ]
plot(as.POSIXct(paste(data$Date, data$Time)),as.numeric(as.character(data$Global_active_power)),type='l',xlab="",ylab="Global Active Power")
plot(as.POSIXct(paste(data$Date, data$Time)),as.numeric(as.character(data$Voltage)),type='l',xlab="datetime",ylab="Voltage")
plot(as.POSIXct(paste(data$Date, data$Time)),as.numeric(as.character(data$Sub_metering_1)),type='l',xlab="",ylab="Energy sub metering")
lines(as.POSIXct(paste(data$Date, data$Time)),as.numeric(as.character(data$Sub_metering_2)),type='l',col="red")
lines(as.POSIXct(paste(data$Date, data$Time)),as.numeric(as.character(data$Sub_metering_3)),type='l',col="blue")
legend("topright", # places a legend at the appropriate place 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)       
       cex=.8, #Font Size
       lwd=c(1,1,1),col=c("black","red","blue")) # gives the legend lines the correct color and width
plot(as.POSIXct(paste(data$Date, data$Time)),as.numeric(as.character(data$Global_reactive_power)),type='l',xlab="datetime",ylab="Global_reactive_power")
dev.off()