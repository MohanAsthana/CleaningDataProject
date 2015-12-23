## Course Project
## Make sure plyr and dplyr packages are loaded
## Make sure Working Directory is set correctly and contains files and folders from "UCI HAR Dataset"

## Below are the steps for the Code:

## Load features and activities are loaded into data frames from the text files. Columns Names are changes appropriately.

## Load test directory data, 
## Load y_test.txt and subject_test.txt in data frames of names y_test and subject_test respectively. Name the columns appropriately. 


## Load X_test.txt data in data frame X_test
## Append subject id and activity id columns to X_test using cbind function 

## Append "test" to the end of frame to indicate it is test data

#Now perform the above steps for train data. 

## Now we have X_train_data and X_test_data data frames 

## Remove non-alphanumeric charactes from column names and replace by "_" and put in a list X_data_col

## Replace column names of X_train_data and X_test_data by list X_data_col

## Combine test and train data in data frame X_data. Column "source" identifies if it is test or train data. 

## Create column list from X_data_col with names containing "mean" or "std" and put in a list X_data_col_ms


## Create data frame for mean and standard deviation columns only from X_data using columns from X_data_col_ms. 
## This frame is called X_data_mean_std 

## Create group columns and data columns for X_data_mean_std

## Calculate average of mean and standard deviation by activity and suject using ddply on X_data_mean_std

## Create Space separated text file in working directory

