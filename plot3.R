#######  Assignment 3 ######################################
setwd("/Users/georgeverghis/desktop/Coursera")
datafile<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
datafile$Date<-as.Date(datafile$Date, format = "%d/%m/%Y")
get.rows   <- datafile$Date >= as.Date("2007-02-01") & datafile$Date <= as.Date("2007-02-02")
data <- datafile[get.rows, ]
png(filename="plot3.png",width = 480, height = 480, units = "px") 
plot(as.POSIXct(paste(data$Date, data$Time)),as.numeric(as.character(data$Sub_metering_1)),type='l',xlab="",ylab="Energy sub metering")
lines(as.POSIXct(paste(data$Date, data$Time)),as.numeric(as.character(data$Sub_metering_2)),type='l',col="red")
lines(as.POSIXct(paste(data$Date, data$Time)),as.numeric(as.character(data$Sub_metering_3)),type='l',col="blue")
legend("topright", # places a legend at the appropriate place 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)       
       cex=.8, #Font Size
       lwd=c(1,1,1),col=c("black","red","blue")) # gives the legend lines the correct color and width
dev.off()