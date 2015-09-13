#Plot 4 - Global Active Power
fileRead <- readLines("household_power_consumption.txt")
extractedReads <- grep("^1/2/2007|^2/2/2007", fileRead)
headerCols<-unlist(strsplit(fileRead[1], ";"))

DT <- read.table("household_power_consumption.txt", sep=";", na.strings="?", col.names=headerCols, skip=extractedReads[1], nrows=length(extractedReads))

DT[,1] <- as.Date(as.character(DT[,1]), format="%d/%m/%Y")

png(filename="plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(strptime(paste(DT[,1], DT[,2]), "%Y-%m-%d %H:%M:%S"), DT$Global_active_power, type="l", ylab="Global Active Power", xlab="")

plot(strptime(paste(DT[,1], DT[,2]), "%Y-%m-%d %H:%M:%S"), DT$Voltage, type="l", ylab="Voltage", xlab="datetime")

with(DT, plot(strptime(paste(DT[,1], DT[,2]), "%Y-%m-%d %H:%M:%S"), DT$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))

with(DT, lines(strptime(paste(DT[,1], DT[,2]), "%Y-%m-%d %H:%M:%S"), DT$Sub_metering_2, col="red"))

with(DT, lines(strptime(paste(DT[,1], DT[,2]), "%Y-%m-%d %H:%M:%S"), DT$Sub_metering_3, col="blue"))

legend("topright", pch=c(NA, NA, NA), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))

plot(strptime(paste(DT[,1], DT[,2]), "%Y-%m-%d %H:%M:%S"), DT$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()
