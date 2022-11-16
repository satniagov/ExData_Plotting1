## Read the file
power<- read.delim(unzip("exdata_data_household_power_consumption.zip","household_power_consumption.txt"), sep = ";")

##Change the fomat of the Date column from character to date
power$Date<- as.Date(power$Date,c("%d/%m/%Y" ))

##Subset the dataframe with dates between 2007-02-01 and 2007-02-02
power<- subset(power, power$Date>as.Date("2007-01-31")&power$Date<as.Date("2007-02-03"))

# Change the Global active Power format from character to numeric
power$Global_active_power<- as.numeric(power$Global_active_power)

##Create the png device
png(filename = "plot1.png",width = 480, height = 480, units = "px")

##Plot the Histogram
hist(power$Global_active_power, col = "red",
     xlab="Global Active Power (kilowatts)", main = "Global Active Power")

##Close the png device
dev.off()
