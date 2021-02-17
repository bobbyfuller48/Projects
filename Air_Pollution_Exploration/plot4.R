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
summ_class_table <- summ_table %>% 
  inner_join(class_table) 

# select only observations of coal combustion sources
coal_comb_table <- summ_class_table %>% 
  filter(str_detect(EI.Sector, c('[Cc]oal')))  %>% 
  group_by(year) %>% 
  summarize(total_emissions = sum(Emissions)) 

# create/annotate graph displaying emissions from coal combustion
ggplot(coal_comb_table, aes(x = factor(year), y = total_emissions/100)) + 
  geom_bar(stat = 'identity') + 
  scale_fill_grey(start = 0.75, end = 0.25) +
  labs(title = 'PM2.5 Emissions from Coal Combustion',x = 'Year', 
       y = 'Emissions (Tons * 100)')

# write plot to a PNG file
dev.copy(png, file = 'plot4.png')
dev.off() 
