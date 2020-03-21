plot4 <- function() {
    ## Multiple plots.
    
    # Filename
    plotFile    = "plot4.png"
    
    # Read in the dataset
    source('download.R')
    table <- power.tidy()
    
    # Create the plot
    message("Preparing Plot")
    dev.new()
    par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,0,0))
    
    # Global Active Power
    plot(table$DateTime,
         table$Global_active_power,
         xlab = "", 
         ylab = "Global Active Power",
         type = "l"
    )
    
    # Voltage
    plot(table$DateTime,
         table$Voltage,
         xlab = "datetime", 
         type = "l"
    )
    
    # Sub-metering
    plot(table$DateTime, 
         table$Sub_metering_1,
         type = "l", 
         col  = "black",
         ylab = "Energy sub metering", 
         xlab=""
    )
    lines(table$DateTime, table$Sub_metering_2, col = 'red')
    lines(table$DateTime, table$Sub_metering_3, col = 'blue')
    
    legend("topright", 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"), 
           lwd = c(1, 1, 1),
           cex = 0.5,
           bty = "n"
    )
    
    # Global Reactive Power 
    plot(table$DateTime,
         table$Global_reactive_power,
         xlab = "datetime", 
         type = "l"
    )
    
    # Write out the data file
    message("Saving Plot")
    dev.copy(png, plotFile)
    dev.off()
}