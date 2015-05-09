source("./functions.r")

data <- readConsumption()

withPng("plot1.png", {
    hist(data$Global_active_power,
         col = "red",
         main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)")
})