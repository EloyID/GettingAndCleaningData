if (!file.exists("./dataset.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./dataset.zip")
}
if (!file.exists("./data_zipped/UCI HAR Dataset/README.txt")) {
  unzip ("dataset.zip", exdir = "./data_zipped")
}

library(stringr)

## Pre work 

# Prepare activity labels

activity_column_name <- "activity"

activity_labels  <- read.fwf(
  file="./data_zipped/UCI HAR Dataset/activity_labels.txt",
  header = FALSE,
  widths=c(1,20)
)
activity_labels <- lapply(activity_labels, str_trim)

# Prepare features labels

features <- read.fwf(
  file="./data_zipped/UCI HAR Dataset/features.txt",
  header = FALSE,
  widths=1000
)

features_list <- separate(features, V1, into= c("index", "feature"), sep=" ")$feature

# Load test data

X_test <- read.fwf(
  file="./data_zipped/UCI HAR Dataset/test/X_test.txt",
  header = FALSE,
  widths=rep(16, each=561)
)

y_test  <- read.fwf(
  file="./data_zipped/UCI HAR Dataset/test/y_test.txt",
  header = FALSE,
  widths=1
)


# Load train data

X_train <- read.fwf(
  file="./data_zipped/UCI HAR Dataset/train/X_train.txt",
  header = FALSE,
  widths=rep(16, each=561)
)


y_train  <- read.fwf(
  file="./data_zipped/UCI HAR Dataset/train/y_train.txt",
  header = FALSE,
  widths=1
)

## 3. Uses descriptive activity names to name the activities in the data set

translated_y_train <- lapply(y_train, function(x){activity_labels$V2[x]})
translated_y_test <- lapply(y_test, function(x){activity_labels$V2[x]})

## 1. Merges the training and the test sets to create one data set.

test <- cbind(translated_y_test,X_test)
train <- cbind(translated_y_train,X_train)

full_set <- rbind(test,train)

## 4. Appropriately labels the data set with descriptive variable names. 

names(full_set) <- c(activity_column_name,features_list)

## 2. Extracts only the measurements on the mean and standard deviation for each 
## measurement. 

selected_set <- select(full_set, "activity" | contains("-mean(") | contains("-std("))

## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

summarized_mean_set <- selected_set %>% 
  group_by(activity) %>% 
  summarise_all("mean")
