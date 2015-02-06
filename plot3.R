
# Read and subset (somewhat optimized)
time <- system.time(dt <- read.table("household_power_consumption.txt",header=TRUE,sep=";",quote="",stringsAsFactors=FALSE,comment.char="",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?")))
print("Loading done in:")
print(time)
fdt <- subset(dt, Date %in% c("1/2/2007", "2/2/2007"), drop = TRUE)

# Convert firs two columns to POSIX time
fdt$unixtime <- strptime(paste(fdt$Date,fdt$Time),"%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

# Generate and save plot
png(filename = "plot3.png",width = 480, height = 480)
with(fdt,plot(unixtime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(fdt,lines(unixtime,Sub_metering_2,col="red"))
with(fdt,lines(unixtime,Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()