# Tidying_Smartphone_Data

This repository contains code that reads data from several files, cleans the data, and stores it in a single data table. 
The data is obtained from the University of California, Irvine [Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 
A description of the data set and how it was obtained is found through the link above.  
To summarize, 30 participants performed six different activies (walking, walking upstairs, walking downstairs, sitting, standing, and lying down) while wearing a smartphone (Samsung Galaxy S II) on their waists. The participants were randomly separated into two groups - a test set group and a training set group.The smart phone used its embedded accelerometer and gyroscope to make a series of measurements of the participants. In it's raw form, the data was stored in the following files: 
* activity_labels.txt (containing the names of each activity and the numerical code representing them)
* features.txt (containing the features being measured by the phone)
* subject_test.txt (containing the participants, represented by an integer, corresponding to the numeric measurements of the features in x_text.txt) 
* x_test.txt (containing the measurement of each feature recorded for each participant in subject_test.txt) 
* y_test.txt (containing the activity being performed that is measured in x_text.txt)
* subject_train.txt (containing the participants, represented by an integer, corresponding to the numeric measurements of the features in x_train.txt)
* x_train.txt (containing the measurement of each feature recorded for each participant in train_test.txt) 
* y_train.txt (containing the activity being performed that is measured in x_train.txt)  


The code reads data from these files, cleans them, and combines them into a single table. The cleaning activities include: 
* changing the names of the activities to lower case 
* using regular expressions to change activity labels from this format WALKING_UPSTAIRS, to this format walkingUpstairs 
* using regular expressions to select only features that measure a mean or standard deviation 
* removing characters such as '(', ')', and '-' from column names 
* making column names more descriptive - i.e. changing 'gyro' to 'gyroscope'  

From the newly combined/cleaned table, an additional table is created containing the average of each variable for each activity and each subject. The code writes this table to a .csv file in the users working directory. This table is found in this repository as tidyDataFrame.csv.  

For more information on each feature that was measured, view the features_info.txt downloadable from the University of California, Irvine [database](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/)

