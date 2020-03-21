plot3 <- function() {
    ## Plot the sub-metering against time.
    
    # Filename
    plotFile    = "plot3.png"
    
    # Read in the dataset
    source('download.R')
    table <- power.tidy()
    
    # Create the plot
    message("Preparing Plot")
    dev.new()
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
           cex = 0.5
           )
    
    # Write out the data file
    message("Saving Plot")
    dev.copy(png, plotFile, width = 480, height = 480)
    dev.off()
}