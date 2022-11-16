## Read the file
power<- read.delim(unzip("exdata_data_household_power_consumption.zip","household_power_consumption.txt"), sep = ";")

##Change the fomat of the Date column from character to date
power$Date<- as.Date(power$Date,c("%d/%m/%Y" ))

##Subset the dataframe with dates between 2007-02-01 and 2007-02-02
power<- subset(power, power$Date>as.Date("2007-01-31")&power$Date<as.Date("2007-02-03"))

# Change the Submeterings format from character to numeric
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)
##paste date and time

power$DateTime<- as.character(paste(power$Date,power$Time), sep=" ")

##Format Date and time as Date

power$DateTime<- as.POSIXct(power$DateTime, c("%d/%m/%Y %T"))

##Create the png device
png(filename = "plot3.png",width = 480, height = 480, units = "px")

##Plot the chart

with(power, plot(DateTime, Sub_metering_1, type="l", xlab="",
                 ylab="Energy submetering"))

points(power$DateTime,power$Sub_metering_2, type = "l", col="red")

points(power$DateTime,power$Sub_metering_3, type = "l", col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"),lty=1, cex=1)

##Close the png device
dev.off()