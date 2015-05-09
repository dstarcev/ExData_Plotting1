library(data.table)
library(dplyr)
library(lubridate)

readConsumption <- function() {
    originalPath <- "./data/household_power_consumption.txt"

    fread(originalPath, colClasses = c("character")) %>%
        filter(Date %in% c("1/2/2007", "2/2/2007"), Global_active_power != "?") %>%
        mutate(
            DateTime = fast_strptime(paste(Date, Time, sep = " "), format="%d/%m/%Y %H:%M:%S"),
            Global_active_power = as.numeric(Global_active_power),
            Global_reactive_power = as.numeric(Global_reactive_power),
            Voltage = as.numeric(Voltage),
            Global_intensity = as.numeric(Global_intensity),
            Sub_metering_1 = as.numeric(Sub_metering_1),
            Sub_metering_2 = as.numeric(Sub_metering_2),
            Sub_metering_3 = as.numeric(Sub_metering_3)
        ) %>%
        select(DateTime,
               Voltage,
               Global_active_power,
               Global_reactive_power,
               Sub_metering_1:Sub_metering_3)
}

withPng <- function(fileName, plotFunc) {
    Sys.setlocale("LC_TIME", "English")
    print(paste("plotting", fileName))
    png(filename = fileName, width = 480, height = 480, bg = "transparent")
    tryCatch(plotFunc, finally = { dev.off() })
}