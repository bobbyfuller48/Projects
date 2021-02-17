library(tidyverse)
library(lubridate)

# download data file from UCI Machine Learning Repository
fileURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

if (!file.exists('power_data.zip')) 
{
  download.file(fileURL, destfile = 'power_data.zip', method = 'curl')
  unzip('power_data.zip')
}

# reads data, replacing '?' with NA
table <- read_delim('household_power_consumption.txt', delim = ';', 
                    na = c('?', 'NA', ''), 
                    col_types = list(col_date(format = "%d/%m/%Y"), 
                                     col_time(), 
                                     col_number(),
                                     col_number(),
                                     col_number(),
                                     col_number(),
                                     col_number(),
                                     col_number(),
                                     col_number())) 

# convert Date field to Date data type; subset records between 2007-02-01 
# and 2007-02-02; create Date_time field for time series 
table <- table %>% 
  filter(between(Date, as.Date('2007-02-01'), as.Date('2007-02-02'))) %>%
  unite(Date_time, Date, Time, sep = ' ') %>% 
  mutate(Date_time = ymd_hms(Date_time))

# make column names lower case
names(table) <- tolower(names(table))

# create/annotate graphs
# specify global graphics parameters 
par(mfrow = c(2,2), mar = c(3,4,2,2), oma = c(0, 0, 2, 0)) 

# plot 1 'Global Active Power' (Time Series)
plot(table$date_time, table$global_active_power, type = 'l', 
     xlab = '', ylab = 'Global Active Power (KW)', cex.axis = 0.8,
     cex.lab = 0.8) 

# plot 2 'Voltage' (Time Series)
plot(table$date_time, table$voltage, type = 'l', 
     ylab = 'Voltage (V)', xlab = '', cex.axis = 0.8, cex.lab = 0.8) 

# plot 3 'Energy sub metering' (Time Series)
plot(table$date_time, table$sub_metering_1, type = 'l',
     xlab = '', ylab = 'Energy Sub Metering (Wh)', cex.lab = 0.8, 
     cex.axis = 0.8)
lines(table$date_time, table$sub_metering_2, col = 'red')
lines(table$date_time, table$sub_metering_3, col = 'blue')
legend("topright",col=c("black","red","blue"),
       c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"), cex = 0.4, lty = 1) 

# plot 4 'Global_reactive_power' (Time Series)
plot(table$date_time, table$global_reactive_power, type = 'l', 
     ylab = 'Global Reactive Power (KW)', xlab = '', cex.axis = 0.8, 
     cex.lab = 0.8) 

# add title to facet
mtext("Power Usage (2007-02-01 to 2007-02-02)", side = 3, outer = TRUE, 
      cex = 1, font = 2)

# write plot to a PNG file 
dev.copy(png, file = 'facets.png', width = 500, height = 400) 
dev.off()
