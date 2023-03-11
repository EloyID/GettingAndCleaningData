This repo includes the script `run_analysis.R` tydies the dataset from the following source https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. More information in the following link http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 
The script does the following 
1. Download and/or unzip the dataset, if not already present in the folder
2. Load the data into R, first the metadata (name of the features and types of activities) and then the test and train datasets (y and X files)
3. Uses descriptive activity names to name the activities in the data set (point 3 of the Assignment)
4. Merges the training and the test sets to create one data set. (point 1 of the Assignment)
5. Appropriately labels the data set with descriptive variable names. (point 4 of the Assignment)
6. Extracts only the measurements on the mean and standard deviation for each measurement. (point 2 of the Assignment)
7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. (point 5 of the Assignment)

The CodeBook.md explains all the variables in the script