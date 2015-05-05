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

## Plot data
plot(HPC_sub$dateTime, HPC_sub$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()