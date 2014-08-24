data source:
----------------------------------------------------------------------------------------------
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



steps to clean
----------------------------------------------------------------------------------------------
1. read all related files.
2. firstly merge train and test set for x/y/subject.
3. get variable names ready.
4. get column filter ready - only mean and standard deviation could be available.
5. refactor the labels to be real activity names.
6. merge all data together. Made two data set.
    dataset: the whole data.
    filteredDataSet: whole data but with filtered variables.
7. reshape the data frame to display average of each variable for each activity and each volunteer.
8. write files to local.



key variables
----------------------------------------------------------------------------------------------
1. xTrainAndTest: variables for both train and test set.
2. yTrainAndTest: labels for both train and test set.
3. subjectTrainAndTest: volunteers for both train and test set.
4. featureNames: all variable/feature names.
5. col_mean_and_standard: filtered feature names.
6. dataset: whole data set containing all data.
7. filteredDataset: whole data set but with filtered variables.
8. averages: reshaped clean data set.
