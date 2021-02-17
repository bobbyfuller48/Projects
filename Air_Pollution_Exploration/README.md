# Air_Pollution_Exploration 

Repository contains .R files that download, read, clean, and explore data from the [Environmental Protection Agency's](https://www.epa.gov/) National Emissions Inventory (NEI) [database](http://www.epa.gov/ttn/chief/eiinformation.html). The NEI records the amount (in tons) of fine particulate matter (PM2.5) emitted each year along with the source of the emissions. The .R files use data from 1999, 2002, 2005, and 2008. Each .R file creates a graph from the data that answers a particular question. The code in each file reads two different .rds files. One .rds ('Source_Classification_Code.rds') file contains a data frame describing the following information:  
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
Below are the questions that each .R file answers along with the graph that was used to answer:

## Total emissions from PM2.5 decreased in the United States from 1999 to 2008. 
### plot1.R 
![plot1](https://user-images.githubusercontent.com/38505196/108253426-c3f1d080-7127-11eb-8e8e-ef6e8d278954.png)

## Total emissions from PM2.5 decreased in the Baltimore City from 1999 to 2008.
### plot2.R
![plot2](https://user-images.githubusercontent.com/38505196/108253432-c6542a80-7127-11eb-9d5b-ec746528ba16.png)

## In Baltimore, non-road, non-point, and on-road emissions decreased from 1999 to 2008 but point emissions increased.
### plot3.R
![plot3](https://user-images.githubusercontent.com/38505196/108253446-cbb17500-7127-11eb-9cfe-3cf9967135a5.png)

## In the USA, PM2.5 emissions have decreased from 1999 to 2008. 
### plot4.R
![plot4](https://user-images.githubusercontent.com/38505196/108253451-cd7b3880-7127-11eb-90fe-4e404afa0c39.png)

## In Baltimore, PM2.5 emissions from motor vehicles have decreased from 1999 to 2008.
### plot5.R
![plot5](https://user-images.githubusercontent.com/38505196/108253461-d0762900-7127-11eb-85d8-40cedd7ff162.png)

## Baltimore PM2.5 emissions from motor vehicles have decreased from 1999 to 2008, but PM2.5 emissions from motor vehicles in LA has gone up during the same time period.
### plot5.R
![plot6](https://user-images.githubusercontent.com/38505196/108253467-d2d88300-7127-11eb-8a31-52148ffc4c51.png)
