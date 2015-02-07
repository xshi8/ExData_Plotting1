## Load data which are saved in current work directory
df <- read.table("household_power_consumption.txt",sep=";", na.strings="?",colClass="character",
                 col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                             "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                 skip=66637,nrows=2880 )

##
#dim(df)
#names(df)
#head(df)
#str(df)
##
for (i in c(3,4,5,7,8,9)){
  df[,i] <- as.numeric(df[,i])
}
df$DateTime <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %T")

png(file="plot4.png",width=480,height=480,units="px",bg="transparent")

par(mfcol=c(2,2))

#topleft plot
plot(x=df$DateTime,y=df$Global_active_power,ylab="Global Active Power",
     xlab="",type="s")

#bottomleft
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

legend(x='topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c("Black","red","blue"),lty="solid",cex=0.95,
       y.intersp=0.9,bty='n'
         )

#topright
plot(x=df$DateTime,y=df$Voltage,xlab='datetime',ylab='Voltage',type='s')

#bottomright
plot(x=df$DateTime,y=df$Global_reactive_power,xlab='datetime',
    ylab='Global_reactive_power',type='s')

par(mfrow=c(1,1))
dev.off()


