
# Read and subset (somewhat optimized)
time <- system.time(dt <- read.table("household_power_consumption.txt",header=TRUE,sep=";",quote="",stringsAsFactors=FALSE,comment.char="",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?")))
print("Loading done in:")
print(time)
fdt <- subset(dt, Date %in% c("1/2/2007", "2/2/2007"), drop = TRUE)

# Convert firs two columns to POSIX time
fdt$unixtime <- strptime(paste(fdt$Date,fdt$Time),"%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

# Generate and save plot
png(filename = "plot2.png",width = 480, height = 480)
plot(fdt$unixtime,fdt$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()