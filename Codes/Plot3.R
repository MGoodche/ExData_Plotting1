unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";",comment.char="%", stringsAsFactors=FALSE, na.strings="?")
head(data)
        Date     Time Global_active_power Global_reactive_power Voltage Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3
1 16/12/2006 17:24:00               4.216                 0.418  234.84             18.4              0              1             17
2 16/12/2006 17:25:00               5.360                 0.436  233.63             23.0              0              1             16
3 16/12/2006 17:26:00               5.374                 0.498  233.29             23.0              0              2             17
4 16/12/2006 17:27:00               5.388                 0.502  233.74             23.0              0              1             17
5 16/12/2006 17:28:00               3.666                 0.528  235.68             15.8              0              1             17
6 16/12/2006 17:29:00               3.520                 0.522  235.02             15.0              0              2             17
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)
