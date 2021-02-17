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

# create data frame displaying total emissions by type of emission for each year 
# in Baltimore
baltimore_em <- class_table %>% 
  filter(fips == '24510') %>% 
  group_by(type, year) %>% 
  summarize(total_emissions = sum(Emissions)) 

# create/annotate bar graph displaying total emissions by type emission for each 
# year in Baltimore
ggplot(baltimore_em, aes(y = total_emissions, x = as.factor(year), 
                         fill = type)) + 
  geom_bar(stat = 'identity', position = 'dodge', show.legend = FALSE) + 
  facet_grid(.~type) + 
  ggtitle('Total PM2.5 Emissions by Type in Baltimore') + 
  labs(x = 'Year', y = 'Emissions (tons)') + 
  scale_fill_brewer(palette = "Set1") 

# write plot to a PNG file
dev.copy(png, file = 'plot3.png')
dev.off()
