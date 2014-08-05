# plot1.R 
#
# This file defines and runs a function plot1() and support functions
# thereto, given that the data set contained in
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# is extracted and present in the current working directory. 
# 
# The script uses the subset of data from the dates 
# 2007-02-01 and 2007-02-02, and creates a PNG file plot1.png in the 
# current directory that is visually similar to a reference image at
# https://github.com/rdpeng/ExData_Plotting1/blob/master/figure/unnamed-chunk-2.png





#
# plot1() is the top-level function that does all the script's processing
#
plot1 <- function() {
    
    # Make sure dataset is present in working directory (or download)
    # The data we typically want is near the front of this large file,
    # so just look at first 70k rows.
    data <- read_data("household_power_consumption.txt", 70000)
    

    # Get working subset for given date range, with DateTimes prepended
    working_data <- get_working_data(data, "2007-02-01", "2007-02-02")
    rm(data)

    # Open PNG file: 
    #  a) 480x480 per instructions
    #  b) white instead of transparent background for consistent rendering
    png(file = "plot1.png", width=480, height=480, units="px", 
        bg="white")
    
    # Plot histogram of Global Active Power and label as ref. plot
    hist(working_data$Global_active_power, col="red",
         main="Global Active Power", 
         xlab="Global Active Power (kilowatts)")
    dev.off()
}




#
# Check for the data file and read it in (up to nrows if specified); 
# if missing, attempt to download and extract it first.
#
read_data <- function(filename, nrows=-1) {
    
    # File is supposed be in current directory. If not, attempt to download.
    dlname <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    if (! file.exists (filename)) {
        cat(filename, "not found in current directory - attempting to obtain",
        dlname, "from internet.\n")
        download.file(dlname, "household_power_consumption.zip")
        unzip("household_power_consumption.zip")
    }
    
    # Columns are date, time and numbers.
    cl <- c('character', 'character', rep('numeric', 7))
    read.csv("household_power_consumption.txt",
                     colClasses=cl, sep=";",na.strings="?", nrows=70000)
}


# 
# Get working subset of power data for given date range, with 
# Date+Times prepended
#
get_working_data <- function(data, date1, date2) {

    # Establish rows matching our rates (need to convert date string)
    dates <- as.Date(data$Date, format = "%d/%m/%Y")
    range<- which(dates >= date1 & dates <= date2)
    working_subset <- data[range, ]
        
    # Prepend extra Date+Time column and return
    Date_time <- strptime(paste(working_subset$Date, working_subset$Time),
                        format="%d/%m/%Y %H:%M:%S")
    cbind(Date_time, working_subset)
}

plot1()

