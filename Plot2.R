#reading and subsetting the data

data <- read.table("household_power_consumption.txt", header= TRUE, sep =";")
sub_data <- subset(data, Date %in% c("2/2/2007","1/2/2007"))

#changing the type of Date and Time respectively

sub_data1<- mutate(subdata, Date = as.Date(Date, format = "%d/%m/%Y"), Time = strptime(paste(subdata$Date, subdata$Time, sep = " "),"%d/%m/%Y %H:%M:%S"))
#plotting the function

plot(sub_data1$Time,as.numeric(as.character(sub_data1$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
                   
