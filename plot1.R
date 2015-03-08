## Read in the data from the UCI file
cp1 <- read.csv("household_power_consumption.txt",sep=";")

##subset to get the data for only the relevant dates
scp1 <- subset(cp1,Date == "1/2/2007" | Date == "2/2/2007")

## drop the original data set
rm(cp1)

#create our PNG graphics device
png(filename = "Plot1.png",width = 480, height = 480, units = "px")

##histogram for global active power variable
hist(as.numeric(levels(scp1$"Global_active_power")[scp1$"Global_active_power"]), 
     xlab="Global Active Power (kilowatts)",
     col="Red",
     main = "Global Active Power")

## Close the file
dev.off()