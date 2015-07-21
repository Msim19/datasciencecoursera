#You should set working directory `UCI HAR Dataset` in your computer#

#Extracting the data for the training set#
training_set<-read.table(paste(getwd(), "/", "train/x_train.txt", sep=""))
##Now we have the data frame with 7352 rows and 561 columns.##
##Each column correspond to the feachures listed in file 'features.txt'##
features<-read.table(paste(getwd(), "/", "features.txt", sep=""))
colnames(training_set)<-features[,2]
##Each row correspond to the activity lables (see files 'y_train.txt' and 'activity_lables.txt')##
##for different subject (see file 'subject_train.txt')##
training_set$subject_ID<-read.table(paste(getwd(), "/", "train/subject_train.txt", sep=""))[,1]
training_set$activity_code<-read.table(paste(getwd(), "/", "train/y_train.txt", sep=""))[,1]

#Extracting the data for the test set in the same way as for the training set#
test_set<-read.table(paste(getwd(), "/", "test/x_test.txt", sep=""))
colnames(test_set)<-features[,2]
test_set$subject_ID<-read.table(paste(getwd(), "/", "test/subject_test.txt", sep=""))[,1]
test_set$activity_code<-read.table(paste(getwd(), "/", "test/y_test.txt", sep=""))[,1]

#Merging the training and the test sets to create one data set#
my_set<-rbind(training_set, test_set)
##Deleting the old data frames from the enviroment (optional)##
rm(test_set, training_set, features)

#Extracting only the measurements on the mean and standard deviation for each measurement#
##Finding the columns with the mean values##
##From the 'features_info.txt': names of mean values contain the regular expression "mean"##
means<-grep("mean", colnames(my_set))
##From the 'features_info.txt': names of standart deviation values contain the regular expression "std"##
stds<-grep("std", colnames(my_set))
##Merging and ordering the numbers of columns with mean and standart deviation values##
means_stds<-sort(c(means, stds))
##Extracting the data frame with the measurements on the mean and standard deviation##
##for each measurement, as well as ID of subject, and activity code##
my_set<-cbind(subject_ID=my_set$subject_ID, activity_code=my_set$activity_code, my_set[,means_stds])

#Assignment the activity names#
##Ordering the data frame by subject ID and activity code##
##We will use dplyr package for convenience##
library(dplyr)
my_set<-arrange(my_set, subject_ID, activity_code)
##Creating the character vector with the activity names##
activities<-as.character(read.table(paste(getwd(), "/", "activity_labels.txt", sep=""))[,2])
##Assignment the activity names corresponding to the code##
my_set<-rename(my_set, activity=activity_code)
my_set$activity<-factor(my_set$activity)
levels(my_set$activity)<-activities

#Creating a tidy data set with the average of each variable for each activity and each subject#
##We will use dplyr package for convenience##
tidy_set <- my_set %>% group_by(subject_ID, activity) %>% summarise_each(funs(mean))
##Writing tidy data to the text file##
write.table(tidy_set, file = "tidy_set.txt", append = FALSE, quote = TRUE, sep = " ", eol = "\n", na = "NA", dec = ".", row.names = FALSE, col.names = TRUE, qmethod = c("escape", "double"), fileEncoding = "")
