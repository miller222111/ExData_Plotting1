#Import data:
dat<-read.table('household_power_consumption 2.txt',header=TRUE,sep=";",na.strings="?")

#Convert "Date" and "Time" variables type:
datetime<-paste(dat$Date,dat$Time)
dat$Datetime<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")
head(dat$Datetime)

#Subset data using "2007-02-01" and "2007-02-02":
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
newdata<-subset(dat,Date %in% c(as.Date('2007-02-01',"%Y-%m-%d"),
                                as.Date('2007-02-02',"%Y-%m-%d")))
tail(newdata)

#Create png file:
png(filename='plot4.png',width=480,height=480)

par(mfrow=c(2,2))
plot(newdata$Datetime,newdata$Global_active_power,type="l",col='black',
     ylab='Global Active Power',xlab='')

plot(newdata$Datetime,newdata$Voltage,type="l",col='black',
     ylab='Voltage',xlab='datetime')

plot(newdata$Datetime,newdata$Sub_metering_1,type="l",col='black',
     ylab='Energy sub metering',xlab='',ylim=c(0,38));par(new=T)
plot(newdata$Datetime,newdata$Sub_metering_2,type="l",col='red',
     ylab='Energy sub metering',xlab='',ylim=c(0,38));par(new=T)
plot(newdata$Datetime,newdata$Sub_metering_3,type="l",col='blue',
     ylab='Energy sub metering',xlab='',ylim=c(0,38));par(new=F)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c('black', 'red','blue'),text.col = "black", 
       lty = c(1,1,1),merge = TRUE, bg = "white",bty='n')

plot(newdata$Datetime,newdata$Global_reactive_power,type="l",col='black',
     ylab='Global_reactive_power',xlab='datetime')

dev.off()
