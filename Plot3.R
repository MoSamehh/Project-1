#reading and subsetting the data

data <- read.table("household_power_consumption.txt", header= TRUE, sep =";")
sub_data <- subset(data, Date %in% c("2/2/2007","1/2/2007"))

#changing the type of Date and Time respectively

sub_data1<- mutate(subdata, Date = as.Date(Date, format = "%d/%m/%Y"), Time = strptime(paste(subdata$Date, subdata$Time, sep = " "),"%d/%m/%Y %H:%M:%S"))

plot(sub_data1$Time,sub_data1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(sub_data1,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(sub_data1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(sub_data1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

