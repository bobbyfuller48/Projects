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

# create/annotate graph
par(mfrow = c(1,1), mar = c(3, 4, 2, 2))
plot(table$date_time, table$sub_metering_1, type = 'l',
     xlab = '', ylab = 'Energy Sub Metering (Wh)', cex.lab = 0.8, 
     cex.axis = 0.8, main = 'Energy Sub Metering Usage (2007-02-01 to 2007-02-02)', 
     cex.main = 1)
lines(table$date_time, table$sub_metering_2, col = 'red')
lines(table$date_time, table$sub_metering_3, col = 'blue')
legend("topright",col=c("black","red","blue") ,
       c("sub_metering_1","sub_metering_2", "sub_metering_3"), 
       lty = 1, lwd = 1, cex = 0.6) 

# write plot to a PNG file 
dev.copy(png, file = 'ts2.png', width=470, height=342) 
dev.off()
