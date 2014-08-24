# read all related files.
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

# firstly merge train and test set for x/y/subject.
xTrainAndTest <- rbind(xTrain, xTest)
yTrainAndTest <- rbind(yTrain, yTest)
subjectTrainAndTest <- rbind(subjectTrain, subjectTest)

# get variable names ready.
features <- read.table("UCI HAR Dataset/features.txt")
featureNames <- sapply(features[2], as.character)

# get column filter ready - only mean and standard deviation could be available.
col_mean_and_standard <- featureNames[grepl("mean()|std()", featureNames)]

# refactor the labels to be real activity names.
yTrainAndTest <- factor(yTrainAndTest[,1])
levels(yTrainAndTest) <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

# merge all data together. Made two data set.
# 1. dataset: the whole data.
# 2. filteredDataSet: whole data but with filtered variables.
dataset <- cbind(xTrainAndTest, subjectTrainAndTest, yTrainAndTest)
colnames(dataset) <- c(featureNames, "volunteer", "activity")
filteredDataset <- dataset[, c(col_mean_and_standard, "volunteer", "activity")]

# reshape the data frame to display average of each variable for each activity and each volunteer.
library(reshape2)
filteredMelt <- melt(filteredDataset,id.vars=c("volunteer","activity"))
filteredaverages <- dcast(filteredMelt, volunteer + activity ~ variable, mean)
allMelt <- melt(dataset,id.vars=c("volunteer","activity"))
allAverages <- dcast(allMelt, volunteer + activity ~ variable, mean)

# write files to local
write.table(filteredaverages,"Mean_and_Std_Per_Subject_and_Activity.txt",row.names=FALSE)
write.table(allAverages,"Per_Subject_and_Activity.txt",row.names=FALSE)
