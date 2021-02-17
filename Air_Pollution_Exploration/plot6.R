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

# create data frame displaying the emissions from vehicles in Baltimore
baltimore_motor_table <- summ_class_table %>% 
  filter(fips == '24510' & 
           str_detect(EI.Sector, c('Vehicles'))) %>% 
  group_by(year) %>% 
  summarize(total_emissions = sum(Emissions)) 

# create new field in data frame - 'city'
baltimore_motor_table$city <- 'Baltimore City'

# create data frame displaying the emissions from vehicles in LA
la_motor_table <- summ_class_table %>% 
  filter(fips == '06037' & 
           str_detect(EI.Sector, c('Vehicles'))) %>% 
  group_by(year) %>% 
  summarize(total_emissions = sum(Emissions)) 

# create new field in data frame - 'city'
la_motor_table$city <- 'Los Angeles County'

# combine data frames together and group by 'city'
motor_table <- rbind(baltimore_motor_table, la_motor_table) %>% 
  group_by(city)

# create/annotate graphs comparing the vehicle emissions from Baltimore to LA
ggplot(motor_table, aes(x = factor(year), y = total_emissions, 
                        fill = factor(city))) + 
  geom_bar(stat = 'identity', show.legend = FALSE) + 
  facet_grid(.~city) + 
  labs(x = 'Year', y = 'Emissions (Tons)', 
      title = 'Baltimore vs. LA Motor Vehicle PM2.5 Emissions') 

# write plot to a PNG file
dev.copy(png, file = 'plot6.png')
dev.off()
