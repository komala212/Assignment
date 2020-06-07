# Assignment 
This R code is used for the getting and cleaning data Assignment of Week 4
Steps
1.Download the data file into the working directory.
2.Download the R source code into the working directory.
3. Execute R source code and receive the output data file as "Tidydata.txt".

## Data
The variables in the data X are sensor signals and the variable in the data Y indicates activity type performed during recording.

## Code explaination along with the instructions given 
1. Pre-requisite: Read training and test dataset, variable names and subject index into R environment.
2. Merges the training and the test sets to create one data set. "rbind" is used to combine training and test set
3. Extracts only the measurements on the mean and standard deviation for each measurement. "grep" command to get column indexes for variable name contains "mean()" or "std()"
4. Uses descriptive activity names to name the activities in the data set. Activity labels is converted to character and added as a new column
5. Appropriately labels the data set with descriptive variable names.
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Creating tidydata.txt file using group_by and summarize_each commands
