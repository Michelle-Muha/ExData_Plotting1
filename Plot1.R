## Import and subset data
HPC <- read.delim("./Downloads/household_power_consumption.txt", sep = ";")
HPC$houDate <- as.Date(HPC$houDate, format="%d/%m/%Y")
HPC_sub <- subset(HPC, subset=(houDate >= "2007-02-01" & houDate <= "2007-02-02"))
data <- as.numeric(as.character(HPC_sub$Global_active_power))

## Draw histogram                    
hist(data, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
