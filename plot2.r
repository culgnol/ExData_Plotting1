fileRead <- readLines("household_power_consumption.txt")
extractedReads <- grep("^1/2/2007|^2/2/2007", fileRead)
headerCols<-unlist(strsplit(fileRead[1], ";"))

DT <- read.table("household_power_consumption.txt", sep=";", na.strings="?", col.names=headerCols, skip=extractedReads[1], nrows=length(extractedReads))

DT[,1] <- as.Date(as.character(DT[,1]), format="%d/%m/%Y")

#plot2
plot(strptime(paste(DT[,1], DT[,2]), "%Y-%m-%d %H:%M:%S"), DT$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png")

dev.off()