## Course Project
## Make sure plyr and dplyr packages are loaded
## Make sure Working Directory is set correctly
## Load features and activities
library(plyr)
library(dplyr)

feature <- read.table("./features.txt",header=FALSE)
activity <- read.table("./activity_labels.txt",header=FALSE)
colnames(activity) <- c("id","action")
colnames(feature) <- c("id","feature_name")

## Load test directory data, append "test" to the end of frame
y_test <- read.table("./test/y_test.txt",header=FALSE)
subject_test <- read.table("./test/subject_test.txt",header=FALSE)
colnames(y_test) <- "actv_id"
colnames(subject_test) <- "subject_id"
X_test <- read.table("./test/X_test.txt",header=FALSE)
X_test_data <- cbind(X_test,subject_test$subject_id,y_test$actv_id)
X_test_data$src <- "test"

## Load train directory data, append "train" to the end of frame
y_train <- read.table("./train/y_train.txt",header=FALSE)
subject_train <- read.table("./train/subject_train.txt",header=FALSE)
colnames(y_train) <- "actv_id"
colnames(subject_train) <- "subject_id"
X_train <- read.table("./train/X_train.txt",header=FALSE)
X_train_data <- cbind(X_train,subject_train$subject_id,y_train$actv_id)
X_train_data$src <- "train"

## Remove non-alphanumeric charactes from column names and replace by "_"
X_data_col <- c(gsub("[^[:alnum:]]","_",feature$feature_name),"subject_id","actv_id","source")
colnames(X_test_data) <- X_data_col
colnames(X_train_data) <- X_data_col

## Combine test and train data. Column "source" identifies if it is test or train data
X_data <- rbind(X_train_data,X_test_data)

## Create data frame for mean and standard deviation columns only. Data for test and train is merged. 
X_data_col_ms <- c(grep("mean",X_data_col),grep("std",X_data_col),grep("subject_id",X_data_col), grep("actv_id",X_data_col))

X_data_mean_std <- X_data[,X_data_col_ms]

## Calculate average of mean and standard deviation by activity and suject 

groupColumns = c("subject_id", "actv_id")
dataColumns <- names(subset(X_data_mean_std, select=-c(subject_id, actv_id)))

X_data_mean_sd_av <- ddply(X_data_mean_std, groupColumns, function(x) colMeans(x[dataColumns]))

## Space separated text file is created below

write.table(X_data_mean_sd_av, file="./X_data_mean_sd_av.txt",row.name=FALSE,append=FALSE,quote=TRUE, sep=" ",eol="\n", na="NA", dec=".", col.names=TRUE)

