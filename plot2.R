plot2 <- function() {
    ## Plot the histogram of the global active power histogram.
    
    # Filename
    plotFile    = "plot2.png"
    
    # Read in the dataset
    source('download.R')
    table <- power.tidy()
    
    # Create the histogram
    message("Preparing Plot")
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