plot1 <- function() {
    # Filename
    plotFile    = "plot1.png"
    
    # Read in the dataset
    source('download.R')
    table <- power.tidy()
    
    # Create the histogram
    hist(table$Global_active_power, 
         main="Global Active Power", 
         xlab = "Global Active Power (kilowatts)", 
         col="red")
    
    # Write out the data file
    dev.copy(png, "plot1.png")
    dev.off()
}