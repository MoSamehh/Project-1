# reading and subsetting data
data <- read.table("household_power_consumption.txt", header= TRUE, sep =";")
subdata <- subset(data, Date %in% c("2/2/2007","1/2/2007"))

# composing the graph

hist(as.numeric(dat$Global_active_power), col= "red",xlab = "Global Active Power (Kilowatts)", main = 'Global Active Power')
