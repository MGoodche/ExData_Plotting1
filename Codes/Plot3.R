## First, we unzip the file
unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
## Then, we read the data, taking into consideration three things:
## 1. comment.char="%" -> a character vector of length one containing a single character or an empty string.
## So I use "%" to turn off the interpretation of comments altogether
## 2. stringsAsFactors=FALSE -> Will be a character vector, instead of a factor
## 3. na.strings="?" -> tells R that in addition to the usual NA, empty strings in columns of character data are also
## to be treated as missing. By default, R treats a blank cell in a column of character data as a character string
## of zero length rather than as missing.
data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";",comment.char="%", stringsAsFactors=FALSE, na.strings="?")
##head(data)
##        Date     Time Global_active_power Global_reactive_power Voltage Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3
##1 16/12/2006 17:24:00               4.216                 0.418  234.84             18.4              0              1             17
##2 16/12/2006 17:25:00               5.360                 0.436  233.63             23.0              0              1             16
##3 16/12/2006 17:26:00               5.374                 0.498  233.29             23.0              0              2             17
##4 16/12/2006 17:27:00               5.388                 0.502  233.74             23.0              0              1             17
##5 16/12/2006 17:28:00               3.666                 0.528  235.68             15.8              0              1             17
##6 16/12/2006 17:29:00               3.520                 0.522  235.02             15.0              0              2             17
## We convert date and time variables to Date/Time class
## Format dates using the as.Date, or format dates with times using strptime. There are helpful defaults for as.Date.
## as.Date(x, format="%Y-%m-%d")
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# Only use data from the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)
## You can simply make a plot by using the plot() function
plot(data$Time, data$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
    lines(data$Time, data$Sub_metering_2, col="red")
    lines(data$Time, data$Sub_metering_3, col="blue")
    legend("topright", col=c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd = 2)
## Copy the plot to a plot3.PNG file
dev.copy(png, file = "plot3.png" ,width = 500, height = 500)  
dev.off()
