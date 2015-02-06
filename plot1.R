
# Read and subset (somewhat optimized)
time <- system.time(dt <- read.table("household_power_consumption.txt",header=TRUE,sep=";",quote="",stringsAsFactors=FALSE,comment.char="",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?")))
print("Loading done in:")
print(time)
fdt <- subset(dt, Date %in% c("1/2/2007", "2/2/2007"), drop = TRUE)

# Convert firs two columns to POSIX time
fdt$unixtime <- strptime(paste(fdt$Date,fdt$Time),"%d/%m/%Y %H:%M:%S")

# Generate and save plot
png(filename = "plot1.png",width = 480, height = 480)
hist(fdt$Global_active_power,xlab="Global active power (kilowatts)",col="orangered",main="Global Active Power")
dev.off()