## run_analysis.R

#check if folder exists in working directory. If not download
library(tidyverse)

local_path <- getwd()
link <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(link,file.path(local_path,"UCI dataset.zip"))
files <- unzip("UCI dataset.zip")
files #list out the files in the zip to see which ones to use. files 14-16 are
# the test data and files 26-28 are the train data 


#read in the activity data files and features
activity_labels <- read.table(files[1], col.names = c("ActivityID", "Activity"))
features <- read.table(files[2], header = FALSE, stringsAsFactors = FALSE)

#only keep the variable names
features <- features[,2]

#keep_features is the vector to subset the X_test and X_train files
keep_features <- grep(pattern = "mean|std", x = features)
features_names <- features[keep_features]

#use gsub to clean up the features names
features_names <- gsub("\\()","",features_names)
features_names <- gsub("-","_",features_names)
features_names <- gsub("mean","Mean",features_names)
features_names <- gsub("std","SD",features_names)



#read in the test data files
X_test <- read.table(files[15],header = FALSE)
X_test <- X_test[,keep_features] #filter for only the mean and sd columns
Y_test <- read.table(files[16],header = FALSE)
subject_test <- read.table(files[14],header = FALSE)

#combine all the test data files
test <- cbind(subject_test,Y_test,X_test)

#read in the train data files
X_train <- read.table(files[27],header = FALSE)
X_train <- X_train[,keep_features] #filter for only the mean and sd columns
Y_train <- read.table(files[28],header = FALSE)
subject_train <- read.table(files[26],header = FALSE)

#combine all the train data files
train <- cbind(subject_train,Y_train, X_train)

#combine the test and train data, and rename the column headings with the cleaned
#feature names
allData <- rbind(test,train)
colnames(allData) <- c("Subject", "Activity", features_names)


#add the activity names to the table using merge
allData1 <- merge(activity_labels,allData,by.x = "ActivityID", by.y = "Activity")
#remove the activityID column because we now have the activity names
allData1 <- select(allData1, -ActivityID)

#use dyplyr to summarise the mean for each column per Activity and Subject
tidy_output <- allData1 %>% group_by(Activity,Subject) %>% summarise_all(mean)

#write the results to a text file
write.table(tidy_output, file = "Mean Activity Values",row.names = FALSE)

