plot2 <- function() {
    ## Plot the active power against time.
    
    # Filename
    plotFile    = "plot2.png"
    
    # Read in the dataset
    source('download.R')
    table <- power.tidy()
    
    # Create the plot
    message("Preparing Plot")
    dev.new()
    plot(table$DateTime,
         table$Global_active_power,
         xlab = "", 
         ylab = "Global Active Power (kilowatts)",
         type = "l"
    )

    # Write out the data file
    message("Saving Plot")
    dev.copy(png, plotFile)
    dev.off()
}