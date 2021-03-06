# Air_Pollution_Exploration 

Repository contains .R files that download, read, clean, and explore data from the [Environmental Protection Agency's](https://www.epa.gov/) National Emissions Inventory (NEI) [database](http://www.epa.gov/ttn/chief/eiinformation.html). The NEI records the amount (in tons) of fine particulate matter (PM2.5) emitted each year along with the source of the emissions. Each .R file found in this repository contains data from 1999, 2002, 2005, and 2008. Each file creates a graph from the data that can be used to make observations concerning PM2.5 emissions. The code in each file reads two different .rds files. One .rds file ('Source_Classification_Code.rds') contains a data frame describing the following information:  
1. fips: A five-digit number (represented as a string) indicating the U.S. county 
2. SCC: The name of the source as indicated by a digit string (see source code classification table) 
3. Pollutant: A string indicating the pollutant 
4. Emissions: Amount of PM2.5 emitted, in tons 
5. type: The type of source (point, non-point, on-road, or non-road) 
6. year: The year of emissions recorded  

The other .rds file ('summarySCC_PM25.rds') contains information such as:
* SCC: The name of the source as indicated by a digit string                
* Data.Category: The type of emission (Biogenic, Event, Nonpoint, Nonroad, Onroad, Point)         
* EI.Sector: The source of the emission (i.e. motor vehicle or coal combustion) 

In several of the .R files, the two different dataframes are combined into one table.   
Below are the observations that each .R file explicates along with the graph visualizing the observation:

## Total emissions from PM2.5 decreased in the United States from 1999 to 2008. 
### plot1.R 
![plot1](https://user-images.githubusercontent.com/38505196/108421641-76e32c80-7203-11eb-9a71-d025b7d9ef2d.png) 

## Total emissions from PM2.5 decreased in Baltimore from 1999 to 2008.
### plot2.R
![plot2](https://user-images.githubusercontent.com/38505196/108421655-7ba7e080-7203-11eb-88ce-feb65634c644.png)

## In Baltimore, non-road, non-point, and on-road emissions decreased from 1999 to 2008, but point emissions increased.
### plot3.R
![plot3](https://user-images.githubusercontent.com/38505196/108421665-7fd3fe00-7203-11eb-8e91-07335cd64b5e.png)

## In the USA, PM2.5 emissions from coal combustion have decreased from 1999 to 2008. 
### plot4.R
![plot4](https://user-images.githubusercontent.com/38505196/108421675-82365800-7203-11eb-816b-47527359d3c9.png)

## In Baltimore, PM2.5 emissions from motor vehicles have decreased from 1999 to 2008.
### plot5.R
![plot5](https://user-images.githubusercontent.com/38505196/108421685-85314880-7203-11eb-8529-4fb7cf768479.png)

## PM2.5 emissions from motor vehicles in Baltimore have decreased from 1999 to 2008, but PM2.5 emissions from motor vehicles in LA County have increased during the same time period.
### plot6.R
![plot6](https://user-images.githubusercontent.com/38505196/108421695-8793a280-7203-11eb-8c88-bfdd96aae617.png) 
