library(dplyr)

power.download <- function() {
    ## Download and unzip the project data, recording the download time for auditing.
    
    # The remote file
    zipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    
    # Output files
    timeFile    <- "DownloadTime.txt"
    zipFile     <- "DataSet.zip"

    # Download the Project ZIP file
    message("Downloading Dataset")
    download.file(zipUrl, zipFile, mode = "wb", quiet = TRUE)
    
    # Save the time
    write.table(Sys.time(), timeFile, col.names = FALSE, row.names = FALSE)    
    
    # Unzip the data.
    message("Unzipping Dataset")
    unzip(zipFile) 
}

power.tidy <- function() {

    sourceFile <- "household_power_consumption.txt"
    dateFormat <- "%d/%m/%Y"
    
    message("Reading Dataset")
    table <- read.table(sourceFile, header=TRUE, sep=";", na.strings = "?")

    # We're only interested in 2 days of data
    message("Triming Dataset")
    table$Date <- as.Date(table$Date, dateFormat)
    table      <- subset(table ,(Date >= as.Date("1/2/2007", dateFormat))
                         & (Date <= as.Date("2/2/2007", dateFormat)))

    message("Tidying Dataset")
    # Remove NAs
    table <- table[complete.cases(table), ]
    
    # Merge the date and time columns
    table <- table  %>% mutate(DateTime = as.POSIXct(paste(Date, Time))) %>%
                        select(-(Date:Time))
    
    # Return the data
    table
}
