
# Read and subset (somewhat optimized)
time <- system.time(dt <- read.table("household_power_consumption.txt",header=TRUE,sep=";",quote="",stringsAsFactors=FALSE,comment.char="",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?")))
print("Loading done in:")
print(time)
fdt <- subset(dt, Date %in% c("1/2/2007", "2/2/2007"), drop = TRUE)

# Convert firs two columns to POSIX time
fdt$datetime <- strptime(paste(fdt$Date,fdt$Time),"%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

# Generate and save plot
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,2)) 
with(fdt,{
#1,1
plot(datetime,Global_active_power,type="l",ylab="Global Active Power",xlab="")
#1,2
plot(datetime,Voltage,type="l")
#2,1
plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(datetime,Sub_metering_2,col="red")
lines(datetime,Sub_metering_3,col="blue")
legend("topright",bty = "n",cex=0.8,col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#2,2
plot(datetime,Global_reactive_power,type="l")
})
dev.off()