#-----------------------------------------------------------------------------------------#
###Exploratory Data Analysis - Project -1
#-----------------------------------------------------------------------------------------#
##Data Loading and Processing
#-----------------------------------------------------------------------------------------#
getwd()
directory<-setwd("C:/Users/Mandeep/Desktop/My studies/Data Science/Exploratory Data Science/P-1/exdata_data_household_power_consumption/")
list.files(directory)
#-----------------------------------------------------------------------------------------#
##Data Reading and Executing
#-----------------------------------------------------------------------------------------#
power <- read.table("household_power_consumption.txt", sep=";" , header=TRUE, )
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
#-----------------------------------------------------------------------------------------#
##PLOT-2
#-----------------------------------------------------------------------------------------#
plot2 <- function() {
  plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("plot2.png has been saved in", getwd())
}
plot2()
#-----------------------------------------------------------------------------------------#
##E N D
#-----------------------------------------------------------------------------------------#
