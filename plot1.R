#Import data:
dat<-read.table('household_power_consumption 2.txt',header=TRUE,sep=";",na.strings="?")

#Convert "Date" and "Time" variables type:
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
dat$Time<-strptime(dat$Time,"%H:%M:%S")

#Subset data using "2007-02-01" and "2007-02-02":
newdata<-subset(dat,Date %in% c(as.Date('2007-02-01',"%Y-%m-%d"),
                                as.Date('2007-02-02',"%Y-%m-%d")))

#Create png file:
png(filename='plot1.png',width=480,height=480)
hist(newdata$Global_active_power,col='red',xlab='Global Active Power (Kilowatts)',
     main='Global Active Power')
dev.off()