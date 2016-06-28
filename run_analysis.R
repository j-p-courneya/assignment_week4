#import the X_test data set
X_test <- read.table("~/Desktop/Coursera/Getting and Cleaning data/week4/UCI HAR Dataset/test/X_test.txt", 
                     quote="\"", comment.char="")
#import subject_test, Each row identifies the subject 
#who performed the activity for each window sample. Its range is from 1 to 30. 
subject_test <- read.table("~/Desktop/Coursera/Getting and Cleaning data/week4/UCI HAR Dataset/test/subject_test.txt",
                           quote="\"", comment.char="")
#import the feature variable labels
features <- read.table("~/Desktop/Coursera/Getting and Cleaning data/week4/UCI HAR Dataset/features.txt", row.names=1, quote="\"", comment.char="")
#create a vector and transpose it for the feature variables to serve as column headings
fLabel <- t(features)
#add labels to the variables of the X_test dataset that are descriptive
colnames(X_test) <- c(fLabel)
#read in the activity data
actlab <- read.table("~/Desktop/Coursera/Getting and Cleaning data/week4/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
#assign descriptive activity names to name the activities in the data set
actlab$V1 <- ordered(actlab$V1, levels = c(1,2,3,4,5,6), labels = c("Walking","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING", "STANDING", "LAYING"))
#Appropriately label the data set with descriptive variable names.
colnames(actlab) <- c("Activity")
colnames(subject_test) <- c("Subject_ID")
#combine subject_ID, activities and test results into a single dataframe named TestResults
TestResult <- cbind.data.frame(c(subject_test,actlab),X_test)
#
#
#
#
#import the X_train data set
X_train <- read.table("~/Desktop/Coursera/Getting and Cleaning data/week4/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
#import subject_train, Each row identifies the training subject 
#who performed the activity for each window sample. Its range is from 1 to 70
subject_train <- read.table("~/Desktop/Coursera/Getting and Cleaning data/week4/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
#add labels to the variables of the X_test dataset that are descriptive
colnames(X_train) <- c(fLabel)
#read in training activity data
trainActivity <- read.table("~/Desktop/Coursera/Getting and Cleaning data/week4/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
#assign descriptive activity names to name the activities in the data set
trainActivity$V1 <- ordered(trainActivity$V1, levels = c(1,2,3,4,5,6), labels = c("Walking","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING", "STANDING", "LAYING"))
#Appropriately label the data set with descriptive variable names.
colnames(trainActivity) <- c("Activity")
colnames(subject_train) <- c("Subject_ID")
#combine subject_ID, activities and test results into a single dataframe named TestResults
TrainResult <- cbind.data.frame(c(subject_train,trainActivity),X_train)
#combine the Test and Training data
combined <- rbind(TestResult,TrainResult)
#Extracts only the measurements on the mean and standard deviation for each measurement.
play <- combined[,c("Subject_ID","Activity", grep("mean|std",names(combined),value = T))]
#creates a new, independent tidy (finaltidy) data set with the average of each variable for each activity 
#and each subject.
#
#Group the Subject and Activity variables
byID <- play%>%group_by(Subject_ID,Activity)
#Create the new data set finaltidy
finaltidy <- byID%>% summarise_each(funs(mean))
