fileRead <- readLines("household_power_consumption.txt")
extractedReads <- grep("^1/2/2007|^2/2/2007", fileRead)
headerCols<-unlist(strsplit(fileRead[1], ";"))

DT <- read.table("household_power_consumption.txt", sep=";", na.strings="?", col.names=headerCols, skip=extractedReads[1], nrows=length(extractedReads))

DT[,1] <- as.Date(as.character(DT[,1]), format="%d/%m/%Y")


#plot1
png(filename="plot1.png", width = 480, height = 480)

hist(DT$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()