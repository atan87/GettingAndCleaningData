## Getting and Cleaning Data Project

Adrian Tan

Repo for Getting and Cleaning Data - Course Project

### Overview
This project serves to demonstrate the collection and cleaning of a tidy data set that can be used for subsequent
analysis. A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


### Code Summary

This repo contains the file r_analysis.R which parses and transforms the UCI HAR Dataset and creates a tidy output file which summarises the average of each variable for each type of activity for each subject. The overall process of the script is outlined below:

1. Downloads the "UCI HAR Dataset.zip" zipfile from the UCI Machine Learning Reposity.
2. It extracts all the files in the zip.
3. Only mean and standard deviation features are selected and parsed
4. The train and test files for each activity and subject are merged into one dataset and the activity ID is replaced by the name of the activity to create a tidy data set
5. Dplyr is then used to create an output summary dataset from the tidy dataset in step 4 which is the mean for each feature per activity and subject.


### Additional Information
You can find additional information about the variables, data and transformations in the CodeBook.MD file.