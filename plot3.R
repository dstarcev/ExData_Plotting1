source("./functions.r")

data <- readConsumption()

withPng("plot3.png", {
    plot(data$Sub_metering_1 ~ data$DateTime, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(data$Sub_metering_2 ~ data$DateTime, type = "l", col = "red")
    lines(data$Sub_metering_3 ~ data$DateTime, type = "l", col = "blue")
    legend("topright",
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty = c(1, 1),
           col = c("black", "red", "blue"))
})