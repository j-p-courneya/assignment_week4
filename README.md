# Instructions for running the script run_analysis.R

This script (assignment_week4/run_analysis.R) will allow you to work on a set of accelerometer data and tidy it up.

Download the following data to your working directory: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The goal is to take the test and train data sets and merge them creating one data set. Ideally you want to tidy the test and training sets independently then combine them.

First load the x_test or x_train data

Each column of these data sets corresponds to a reading found in the features file. the features are used as the variable names for the test and training data, name the data frame.

The train and test data sets have values corresponding to a specific subject ID and activity for that subject ID. The subject ID's and activities are found in other files and have to be added to the dataset being built.

The file containing the data of activities performed which were measured is found in y_test/y_train. the data is is coded and each factor corresponds to a specific activity. Using the code, convert the numbers to activity names. once done the data frame is created the variables should given a descriptive name (activities). Additionally the subject ID's can be imported from the subject_test/subject_train and given a descriptive name (Subject ID).

These two variables can be added to the feature data set and create a combined data set which has subject ID, activities, and all the measurement variables.

At this point the train and test data sets can be merged creating one combined set for train and test.

From here continue to create the second data set with only the mean and standard deviation of the combined data set.

Name the new tidy data set.
