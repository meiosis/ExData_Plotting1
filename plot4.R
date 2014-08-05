# plot4.R 
#
# This file defines and runs a function plot4() and support functions
# thereto, given that the data set contained in
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# is extracted and present in the current working directory. 
# 
# The script uses the subset of data from the dates 
# 2007-02-01 and 2007-02-02, and creates a PNG file plot1.png in the 
# current directory that is visually similar to a reference image at
# https://github.com/rdpeng/ExData_Plotting1/blob/master/figure/unnamed-chunk-5.png





#
# plot4() is the top-level function that does all the script's processing
#
plot4 <- function() {
    
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
    png(file = "plot4.png", width=480, height=480, units="px", 
        bg="white")
    
    # Set Graphics as 2x2 grid and construct 4 subplots from working data
    par(mfcol = c(2, 2))
    with(working_data, {
        
        # Plot  Global Active Power  vs. Date_time (c.f. Plot2)
        # at top left
        plot (Global_active_power ~ Date_time,
              type="l",
              xlab="",
              cex.lab=0.9, cex.axis=0.9,
              ylab="Global Active Power")
        
        # Plot  Sub_metering values vs. Date_time (c.f. Plot3)
        # at bottom left
        plot (Sub_metering_1 ~ Date_time,
              type="l",
              xlab="",
              cex.lab=0.9, cex.axis=0.9,
              ylab="Energy sub metering")
        lines (Sub_metering_2 ~ Date_time,
               col="red")
        lines (Sub_metering_3 ~ Date_time,
               col="blue")
        legend("topright",
               lwd=1,
               bty="n",
               col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", 
                          "Sub_metering_3"))    
        
        # Plot  Voltagevs. Date_time at top right
        plot (Voltage ~ Date_time,
              type="l",
              cex.lab=0.9, cex.axis=0.9,
              xlab="datetime")
        
        # Plot  Global Reactive Power vs. Date_time at bottom right
        plot (Global_reactive_power ~ Date_time,
              type="l",
              cex.lab=0.9, cex.axis=0.9,
              xlab="datetime")
        
    })
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

plot4()

