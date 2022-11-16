## Read the file
power<- read.delim(unzip("exdata_data_household_power_consumption.zip","household_power_consumption.txt"), sep = ";")

##Change the fomat of the Date column from character to date
power$Date<- as.Date(power$Date,c("%d/%m/%Y" ))

##Subset the dataframe with dates between 2007-02-01 and 2007-02-02
power<- subset(power, power$Date>as.Date("2007-01-31")&power$Date<as.Date("2007-02-03"))

# Change the Global active Power format from character to numeric
power$Global_active_power<- as.numeric(power$Global_active_power)

##paste date and time

power$DateTime<- as.character(paste(power$Date,power$Time), sep=" ")

##Format Date and time as Date

power$DateTime<- as.POSIXct(power$DateTime, c("%d/%m/%Y %T"))


##Create the png device
png(filename = "plot2.png",width = 480, height = 480, units = "px")

##Plot the chart

with(power, plot(DateTime, Global_active_power, type="l", xlab="",
                 ylab="Global Active Power (kilowatts)"))

##Close the png device
dev.off()