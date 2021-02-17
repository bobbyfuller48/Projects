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

# join data frames together so as to link the quantity of emissions to the 
# source of emissions 
# select only observations of emissions from vehicles in Baltimore
baltimore_motor_table <- summ_table %>% 
  inner_join(class_table) %>% 
  filter(fips == '24510' & 
           str_detect(EI.Sector, c('Vehicles'))) %>% 
  group_by(year) %>% 
  summarize(total_emissions = sum(Emissions)) 

# create/annotate graph displaying emissions from vehicle sources in Baltimore
ggplot(baltimore_motor_table, aes(x = factor(year), y = total_emissions, 
                                  fill = factor(total_emissions))) + 
  geom_bar(stat = 'identity', show.legend = FALSE) + 
  scale_fill_grey(start = 0.75, end = 0.25) +
  labs(title = 'Motor Vehicle PM2.5 Emissions',x = 'Year', 
       y = 'Emissions (Tons)') 

# write plot to a PNG file
dev.copy(png, file = 'plot5.png')
dev.off()
