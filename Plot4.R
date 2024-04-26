#reading and subsetting the data

data <- read.table("household_power_consumption.txt", header= TRUE, sep =";")
sub_data <- subset(data, Date %in% c("2/2/2007","1/2/2007"))

#changing the type of Date and Time respectively

sub_data1<- mutate(sub_data, Date = as.Date(Date, format = "%d/%m/%Y"), Time = strptime(paste(sub_data$Date, sub_data$Time, sep = " "),"%d/%m/%Y %H:%M:%S"))
sub_data2 <- mutate(sub_data1, Sub_metering_1 = as.numeric(Sub_metering_1), Sub_metering_2 = as.numeric(Sub_metering_2), Sub_metering_3 = as.numeric(Sub_metering_3), Voltage = as.numeric(Voltage),Global_active_power = as.numeric(Global_active_power), Global_reactive_power = as.numeric(Global_reactive_power))


par(mfrow=c(2,2))

attach(sub_data2)
plot(Time, Global_active_power, ylab = "Global Active Power",type = "l", xlab = "")
plot(Time, Voltage, ylab= "Voltage", type ="l", xlab= "datetime")
plot(Time, Sub_metering_1, ylab="Energy sub metering", xlab="", type ="l")
lines(Time, Sub_metering_2, col="red",type="l")
lines(Time, Sub_metering_3, col="blue", type="l")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6, bty="n")
plot(Time, Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
