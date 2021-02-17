library(tidyverse)

# download data file from UCI Machine Learning Repository
fileURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

if (!file.exists('power_data.zip')) 
{
  download.file(fileURL, destfile = 'power_data.zip', method = 'curl')
  unzip('power_data.zip')
}

# read data, replacing '?' with NA
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
# and 2007-02-02
table <- table %>% 
  filter(between(Date, as.Date('2007-02-01'), as.Date('2007-02-02')))

# make column names lower case
names(table) <- tolower(names(table))

# create/annotate graph
par(mfrow = c(1,1))

hist(table$global_active_power, col = 'red', 
     main = 'Global Active Power Usage (2007-02-01 to 2007-02-02)', cex.main = 1, 
     xlab = 'Global Active Power (kilowatts)', cex.axis = 0.8, 
     cex.lab = 0.8) 

# write plot to a PNG file 
dev.copy(png, file = 'bar.png') 
dev.off()
