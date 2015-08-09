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
png(filename='plot2.png',width=480,height=480)
plot(newdata$Datetime,newdata$Global_active_power,type="l",col='black',
     ylab='Global Active Power (Kilowatts)',xlab='')
dev.off()
