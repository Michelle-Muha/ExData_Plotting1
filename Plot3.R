library(dplyr)
library(lubridate)

## Import and subset data
HPC <- read.delim("./Downloads/household_power_consumption.txt", sep = ";")
HPC$houDate <- as.Date(HPC$houDate, format="%d/%m/%Y")
HPC_sub <- subset(HPC, subset=(houDate >= "2007-02-01" & houDate <= "2007-02-02"))

## Format data
HPC_sub$Global_active_power <- as.numeric(as.character(HPC_sub$Global_active_power))
HPC_sub <- mutate(HPC_sub, dateTime = paste(houDate, Time))
HPC_sub$dateTime <- ymd_hms(HPC_sub$dateTime)
HPC_sub$Sub_metering_1 <- as.numeric(as.character(HPC_sub$Sub_metering_1))
HPC_sub$Sub_metering_2 <- as.numeric(as.character(HPC_sub$Sub_metering_2))
HPC_sub$Sub_metering_3 <- as.numeric(as.character(HPC_sub$Sub_metering_3))

## Plot data

plot(HPC_sub$dateTime, HPC_sub$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(HPC_sub$dateTime, HPC_sub$Sub_metering_2,col='Red')
  lines(HPC_sub$dateTime, HPC_sub$Sub_metering_3,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()