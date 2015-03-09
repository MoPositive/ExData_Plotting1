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
png(filename = "Plot4.png",width = 480, height = 480, units = "px")

## setup for a 2x2 set of plots
par(mfrow = c(2,2))

##Plot for global active power variable over time (days of week)
plot(ts,
     as.numeric(levels(scp1$"Global_active_power")[scp1$"Global_active_power"]),
     type="l",
     ylab="Global Active Power",
     xlab="")

##Plot for voltage over time
plot(ts,
     as.numeric(levels(scp1$Voltage)[scp1$Voltage]),
     type="l",
     ylab="Voltage",
     xlab="datetime")

##Plot for sub_metering variables over time (days of week)
plot(ts,
     as.numeric(levels(scp1$"Sub_metering_1")[scp1$"Sub_metering_1"]),
     type="l",
     ylab="Energy sub metering",
     xlab="")
lines(ts,
      as.numeric(levels(scp1$"Sub_metering_2")[scp1$"Sub_metering_2"]),
      type="l",
      col="red")
lines(ts,
      scp1$"Sub_metering_3",
      type="l",
      col="blue")
legend("topright",
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       lwd=c(2,2),
       bty="n",
       col=c("black","red","blue"))

## plot for global reactive power over time
plot(ts,
     as.numeric(levels(scp1$"Global_reactive_power")[scp1$"Global_reactive_power"]),
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime")

## Close the file
dev.off()