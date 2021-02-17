library(tidyverse)
fileURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip' 

# download file from EPA National Emissions Inventory website
if (!file.exists('data_files.zip')) 
{
  download.file(fileURL, destfile = 'data_files.zip', method = 'curl')
  unzip(zipfile = 'data_files.zip') 
} 

# read files into data frames
summ_table <- readRDS('Source_Classification_Code.rds') 
class_table <- readRDS('summarySCC_PM25.rds') 

# create data frame displaying total emissions by year
em_by_year <- class_table %>% 
  group_by(year) %>% 
  summarize(total_emissions = sum(Emissions)) 

# create/annotate bar graph displaying total emissions by year
par(mfrow = c(1,1), mar = c(5, 4, 4, 2))

bar <- barplot(height = em_by_year$total_emissions/100, name = em_by_year$year, 
               col = 'seashell4', main = 'Total PM2.5 Emissions', 
               xlab = 'Year', ylab = 'Emissions (tons * 100)')

# write plot to a PNG file
dev.copy(png, file = 'plot1.png')
dev.off()
