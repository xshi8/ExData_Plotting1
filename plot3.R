
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
for (i in 7:9){
    df[,i] <- as.numeric(df[,i])
    }
df$DateTime <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %T")

png(file="plot3.png",width=480,height=480,units="px",bg="transparent")

yrange<-range(c(df$Sub_metering_1,df$Sub_metering_2,df$sub_metering_3))

plot(x=df$DateTime,y=df$Sub_metering_1,ylab="Energy sub metering",
     xlab="",col="black", type="s",ylim=yrange)
par(new=T)
plot(x=df$DateTime,y=df$Sub_metering_2,ylab="Energy sub metering",
     xlab="",col="red", type="s",ylim=yrange)
par(new=T)
plot(x=df$DateTime,y=df$Sub_metering_3,ylab="Energy sub metering",
     xlab="",col="blue", type="s",ylim=yrange)
par(new=F)

legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c("Black","red","blue"),lty="solid")

dev.off()
 