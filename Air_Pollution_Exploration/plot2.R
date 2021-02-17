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

# create data frame displaying total emissions by year for Baltimore
baltimore_em <- class_table %>%
  filter(fips == '24510') %>% 
  group_by(year) %>% 
  summarize(total_emissions = sum(Emissions)) 

# create/annotate bar graph displaying total emissions by year for Baltimore
par(mfrow = c(1,1), mar = c(5, 4, 4, 2))

barplot(height = baltimore_em$total_emissions, 
        name = baltimore_em$year, col = 'seashell4', 
        main = 'Total PM2.5 Emissions in Baltimore', xlab = 'Year', 
        ylab = 'Emissions (tons)') 

# write plot to a PNG file
dev.copy(png, file = 'plot2.png')
dev.off()
