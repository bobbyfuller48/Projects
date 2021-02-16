library(tidyverse) 

# download and unzip file
fileURL <- 
'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip' 

if (!(file.exists('project.zip')))
{
  download.file(fileURL, destfile = 'project.zip') 
} 

unzip('project.zip') 


# create a data frame of activity labels
activityLabels <- read_delim('./UCI HAR Dataset/activity_labels.txt', 
                           delim = ' ', col_names = c('code', 'activity'), 
                           col_types = 'ff')

activityLabels$activity <- tolower(activityLabels$activity)
activityLabels$activity <- factor(gsub(activityLabels$activity, 
                                pattern = '_(.)', replacement = '\\U\\1',
                                perl = TRUE))


# create a data frame of features 
features <- read_delim('./UCI HAR Dataset/features.txt', 
                       delim = ' ', col_names = c('code', 'feature'), 
                       col_types = 'ff')

# select mean() and std features()
featuresCode <- grep('(mean|std)\\(\\)', features$feature) 

features <- features[featuresCode,]

# create data frame of test subjects, measurements, and activity 
testMeasurements <- read_delim('./UCI HAR Dataset/test/X_test.txt', 
                                delim = ' ', 
                                col_names = FALSE, 
                                col_types = cols(.default = col_number()))[,featuresCode]

names(testMeasurements) <- features$feature 

testSubject <- read_delim('./UCI HAR Dataset/test/subject_test.txt', 
                           delim = ' ', col_names = c('subject'), 
                           col_types = 'i')

testActivity <- read_delim('./UCI HAR Dataset/test/Y_test.txt', 
                            delim = ' ', 
                            col_names = c('activityCode'), 
                            col_types = 'f')

# combine test data frames into one data frame 
testTable <- bind_cols(testSubject, testActivity, testMeasurements)

# create data frame of train subjects, measurements, and activity 
trainMeasurements <- read_delim('./UCI HAR Dataset/train/X_train.txt', 
                                 delim = ' ', 
                                 col_names = FALSE, 
                                 col_types = cols(.default = col_number()))[,featuresCode]

names(trainMeasurements) <- features$feature 

trainSubject <- read_delim('./UCI HAR Dataset/train/subject_train.txt', 
                            delim = ' ', 
                            col_names = c('subject'), 
                            col_types = 'i')
trainActivity <- read_delim('./UCI HAR Dataset/train/Y_train.txt', 
                            delim = ' ', 
                            col_names = c('activityCode'), 
                            col_types = 'f')

# combine train data frames into one data frame 
trainTable <- bind_cols(trainSubject, trainActivity, trainMeasurements)

# combine test and train data frames into one data frame
combinedTable <- bind_rows(testTable, trainTable) 

# tidy combined data frame according to following guidelines: 
# names of variables should be 
# - all lower case when possible
# - descriptive (i.e. Diagnosis versus Dx)
# - not duplicated 
# - not have underscores or dots or white space
combinedTable <- combinedTable %>% 
  rename(activity = activityCode) %>% 
  mutate(activity = activityLabels$activity[activity], 
         subject = factor(subject)) %>% 
  arrange(subject)

names(combinedTable) <- names(combinedTable) %>% 
  str_replace_all(c('^t' = 'total', '^f' = 'frequency', 'Acc' = 'Acceleration', 
                    'Mag' = 'Magnitude', 'Gyro' = 'Gyroscope', 
                    '-|\\(|\\)' = '', 'mean' = 'Mean', 
                    'std' = 'StandardDeviation', 'BodyBody' = 'Body'))  


# create independent data frame with the average of each variable 
# for each activity and each subject (using column-wise operation)
newCombinedTable <- combinedTable %>% 
  group_by(subject, activity) %>% 
  summarise(across(names(combinedTable[3:68]), mean)) %>% 
  arrange(subject, desc(activity))

# write ^ data frame as a .txt file into working directory 
if (!file.exists('tidyDataFrame'))
  write_delim(newCombinedTable, 'tidyDataFrame.txt')
  