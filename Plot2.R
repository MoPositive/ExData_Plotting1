## Read in the data from the UCI file
cp1 <- read.csv("household_power_consumption.txt",sep=";")

##subset to get the data for only the relevant dates
scp1 <- subset(cp1,Date == "1/2/2007" | Date == "2/2/2007")

## drop the original data set
rm(cp1)

## Convert Date and time columns into POSIXlt format
scp1$Date <- as.Date(scp1$Date,format="%d/%m/%Y")
ts <- strptime(paste(scp1$Date,scp1$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

#create our PNG graphics device
png(filename = "Plot2.png",width = 480, height = 480, units = "px")

##Plot for global active power variable over time (days of week)
plot(ts,
     as.numeric(levels(scp1$"Global_active_power")[scp1$"Global_active_power"]),
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

## Close the file
dev.off()