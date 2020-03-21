plot1 <- function() {
    ## Plot the histogram of the global active power histogram.
    
    # Filename
    plotFile    = "plot1.png"
    
    # Read in the dataset
    source('download.R')
    table <- power.tidy()
    
    # Create the histogram
    message("Preparing Plot")
    dev.new()
    hist(table$Global_active_power, 
         main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)", 
         col = "red"
         )
    
    # Write out the data file
    message("Saving Plot")
    dev.copy(png, plotFile, width = 480, height = 480)
    dev.off()
}