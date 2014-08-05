# README for the submitted plots and scripts

This README file has been updated and extended with new content to accompany the submission of the plots and the scripts that make them for the Coursera Exploring Data Project 1. The original material has been retained in the appendix.

## The plots

The plots which have been generated for the project are to be found in the top level of the directory with the names plot<i>n</i>.png as specified.

They have been designed to [_visually_ match](https://class.coursera.org/exdata-005/forum/thread?thread_id=3#post-10) the reference plots as given in the appendix, i.e. to show the same data in the same way with the same annotations, subject to the following requirements and considerations:

* 480x480 pixels as specified (compared to 504x504 for the reference plots)
* White background rather than transparent, for correct visual matching with web browser 
* very small variations in rendering fonts and graphics between platforms

## The scripts

The scripts that generate the plots for the project are also to be found in the top level of the directory with the names plot<i>n</i>.R as specified. 


### Usage of the plot<i>n</i>.R scripts


**Description**

Generate a plot of an aspect of individual household electric power consumption for the dates 2007-02-01 and 2007-02-02

**Synopsis**

    source("plot<i>n</i>.R")

**Arguments**

None.

**Input**

The input to the script is the data set of Electric power consumption at
https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip,
which should be downloaded from the internet, unzipped and placed in the current directory as the file "household_power_consumption.txt".

If this file cannot be found, the script attempts to obtain the data from the internet; this may or may not be successful, depending on the user's platform and environment.
 
**Output**

Each plot<i>n</i>.R script generates the corresponding plot<i>n</i>.png file in the current directory

The function has no useful return value.

**Environment**

Run the script from an R console (verified for R V3.1.0 tunning on Windows 7 64 bits). 

### Implementation notes on the scripts

The structure of each of the scripts is similar and each goes through the same three main steps:

1. Read in the raw data, downloading it first if necessary, in the function read_data()

2. Form the date subset of interest in get_working_data()

3. Generate the required plot using the png device and base plotting package, in the top-level function.

Note that in step 1, only a small fraction of the file is actually read in order to conserve resources, because the file is very large, and the data of interest is towards the front. 

Steps 1 and 2 are the same for each script. Had it not been required to make each script file stand-alone and self-contained, the functions read_data() and get_working_data() might otherwise have been better structured as shared code between the four plots. Likewise, as two subplots in plot 4 are similar to plots 2 and 3, they could also have been implemented as shared code.

# Appendix -- original project description

This section and the following ones retain the original material in this README prior to implementation of the scripts for the project.

## Introduction 


This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data





When loading the dataset into R, please consider the following:

* The dataset has 2,075,259 rows and 9 columns. First
calculate a rough estimate of how much memory the dataset will require
in memory before reading into R. Make sure your computer has enough
memory (most modern computers should be fine).

* We will only be using data from the dates 2007-02-01 and
2007-02-02. One alternative is to read the data from just those dates
rather than reading in the entire dataset and subsetting to those
dates.

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.

* Note that in this dataset missing values are coded as `?`.


## Making Plots

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. Your task is to
reconstruct the following plots below, all of which were constructed
using the base plotting system.

First you will need to fork and clone the following GitHub repository:
[https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)


For each plot you should

* Construct the plot and save it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. Your code file **should include code for reading
the data** so that the plot can be fully reproduced. You should also
include the code that creates the PNG file.

* Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to
GitHub so that the GitHub version of your repository is up to
date. There should be four PNG files and four R code files.


The four plots that you will need to construct are shown below. 


### Plot 1


![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

