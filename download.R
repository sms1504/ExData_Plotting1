power.download <- function() {
    ## Download and unzip the project data, recording the download time for auditing.
    
    # The remote file
    zipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    
    # Output files
    timeFile    <- "DownloadTime.csv"
    zipFile     <- "DataSet.zip"

    # Download the Project ZIP file
    message("Downloading Dataset")
    download.file(zipUrl, zipFile, mode = "wb", quiet = TRUE)
    
    # Save the time
    write.csv(Sys.time(), timeFile);
    
    # Unzip the data.
    message("Unzipping Dataset")
    unzip(zipFile) 
}
    