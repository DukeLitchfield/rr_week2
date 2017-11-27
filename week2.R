library(plyr)
library(lubridate)
# 1.)
#download data and save
setwd("C:/Users/T470/Desktop/Coursera/Data Science/Reproducible Research/week2")
#download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip","dl.zip")

if(!file.exists("data")) {
  dir.create("data")
}
#unzip("dl.zip", exdir = "data")

setwd("data")

am <- read.csv("activity.csv")
#sum steps by day
am1 <- with(am,tapply(steps,date,sum,na.rm=T))
am2 <- data.frame(date=row.names(am1),steps=as.integer(am1))

# 2.)
#plot histogram of steps/day
hist(am2$steps, main = "Histogram of Steps/Day",xlab="Steps/Day",ylab="Frequency", col="hotpink2")

# 3.)
#calc mean and med of steps per day
am2_mean <- mean(am2$steps)
am2_med <- median(am2$steps)

# 4.)
#time series plot of avg steps taken per time interval
am3 <- with(am,tapply(steps,interval,mean,na.rm=T))
am4 <- data.frame(interval=row.names(am3),steps=as.integer(am3))
am4$interval <- as.character(am4$interval)
plot(am4$interval,am4$steps,type="l",col="slateblue3",
     xlab="Interval",ylab="Mean Steps Taken", 
     lwd=3, main="Mean Steps by 5 Min Interval")

#5.) 
am4_max <- am4[am4$steps==max(am4$steps),1]



