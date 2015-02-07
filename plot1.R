
## Load data which are saved in current work directory
df <- read.table("household_power_consumption.txt",sep=";", na.strings="?",colClass="character",
                 col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                             "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                 skip=66637,nrows=2880 )

##
#dim(df)
#names(df)
#head(df)

##
df[,3] <- as.numeric(df[,3])
png(file="plot1.png",width=480,height=480,units="px",bg="transparent")
hist(df$Global_active_power,main="Global Active Power",
    xlab="Global Active Power (kilowatts)", col="red")
dev.off()

