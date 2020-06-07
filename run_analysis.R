#install.packages("dplyr")
library(dplyr)
#setwd("C:/Users/DELL/Documents/Study Material/Coursera/coursera - R")
# read training dataset
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# read test dataset
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# read the features and activity label
variables <- read.table("./UCI HAR Dataset/features.txt")
labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#1. Merges the training and the test sets to create one data set.
X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
sub_total <- rbind(sub_train, sub_test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
var_subset <- variables[grep("mean\\(\\)|std\\(\\)",variables[,2]),]
X_total <- X_total[,var_subset[,1]]

#3. Uses descriptive activity names to name the activities in the data set
colnames(Y_total) <- "activity"
Y_total$activitylabel <- factor(Y_total$activity, labels = as.character(labels[,2]))
activitylabel <- Y_total[,2]

# 4. Appropriately labels the data set with descriptive variable names.
colnames(X_total) <- variables[var_subset[,1],2]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each
# variable for each activity and each subject.
colnames(sub_total) <- "subject"
total <- cbind(X_total, activitylabel, sub_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "./UCI HAR Dataset/Tidydata.txt", row.names = FALSE, col.names = TRUE)