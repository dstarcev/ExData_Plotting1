source("./functions.r")

data <- readConsumption()

withPng("plot4.png", {
    par(mfrow=c(2,2))
    
    # left top
    plot(data$Global_active_power ~ data$DateTime,
         type = "l",
         xlab = "",
         ylab = "Global Active Power")
    
    #right top
    plot(data$Voltage ~ data$DateTime,
         type = "l",
         xlab = "datetime",
         ylab = "Voltage")
    
    #left bottom
    plot(data$Sub_metering_1 ~ data$DateTime, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(data$Sub_metering_2 ~ data$DateTime, type = "l", col = "red")
    lines(data$Sub_metering_3 ~ data$DateTime, type = "l", col = "blue")
    legend("topright",
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty = c(1, 1),
           bty = "n",
           col = c("black", "red", "blue"))
    
    # right bottom
    plot(data$Global_reactive_power ~ data$DateTime,
         type = "l",
         xlab = "datetime",
         ylab = "Global_reactive_power")
})