source("./functions.r")

data <- readConsumption()

withPng("plot2.png", {
    plot(data$Global_active_power ~ data$DateTime,
         type = "l",
         xlab = "",
         ylab = "Global Active Power (kilowatts)")
})