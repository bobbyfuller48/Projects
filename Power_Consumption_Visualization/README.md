# Power_Consumption_Visualization 
Repository contains .R files that download, read, clean, and explore data from the University of California, Irvine [Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption). The dataset analyzed is the “Individual household electric power consumption Data Set”. This dataset consists of measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available. The data is provided as a .txt file containing the following variables: 
1. Date: Date in format dd/mm/yyyy 
2. Time: time in format hh:mm:ss 
3. Global_active_power: household global minute-averaged active power (in kilowatt) 
4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt) 
5. Voltage: minute-averaged voltage (in volt) 
6. Global_intensity: household global minute-averaged current intensity (in ampere) 
7. Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). 
8. Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. 
9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

Further details concerning the dataset can be found at the link provided above. Each .R file contains code that downloads, cleans, and visualizes different relationships found in the data. The data frame created from the .txt file has 2,075,259 rows and 9 columns, each .R file subsets the data from February 1, 2007 to February 2, 2007. Displayed below is the graph that each .R file generates. 

## bar.R 
![bar](https://user-images.githubusercontent.com/38505196/108241022-66568780-7119-11eb-8a10-1cfa08d4bc08.png)

## ts1.R
![ts1](https://user-images.githubusercontent.com/38505196/108241036-69517800-7119-11eb-8551-8da094e6e7bd.png)

## ts2.R
![ts2](https://user-images.githubusercontent.com/38505196/108241048-6b1b3b80-7119-11eb-89fd-57cd45eb0b87.png)

## facets.R
![facets](https://user-images.githubusercontent.com/38505196/108241055-6ce4ff00-7119-11eb-8474-761db10a3093.png)
