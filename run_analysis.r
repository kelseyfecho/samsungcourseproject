#####Set working directory to the "UCI HAR Dataset" folder


#####Read files into R
train_labels <- read.table("./train/y_train.txt") 		##Loads the single-column train labels
test_labels <- read.table("./test/y_test.txt") 			##Loads the single-column test labels
train_set <- read.table("./train/x_train.txt")			##Loads a 561-column train set data
test_set <- read.table("./test/x_test.txt") 			##Loads a 561-column test set data
subject_train <- read.table("./train/subject_train.txt") 	##Loads a single-column training subject identifier set
subject_test <- read.table("./test/subject_test.txt") 	##Loads a single-column testing subject identifier set
features <- read.table("features.txt") 				##Loads a two-column list of all the features
activity_labels <- read.table("activity_labels.txt")		##Loads a 2 x 6 table linking the activity name with the activity number


#####Merge train_set and test_set to create 1 data set
data_set <- rbind(train_set, test_set) 				##Merges the 2 sets
dim(data_set)								##Confirm dimensions are 10299 x 561
colnames(data_set) = (features[, 2])				##Use features to name columns


#####Extract the mean and standard deviation for each measurement in the data set
##Subset the data
data2 <- data_set[, c(1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 81, 82, 83, 84, 85, 86, 121, 122, 123, 124, 125, 126, 161, 162, 163, 164, 165, 166, 201, 202, 215, 216, 227, 228, 240, 241, 253, 254, 266, 267, 268, 269, 270, 271, 345, 346, 347, 348, 349, 350, 424, 425, 426, 427, 428, 429, 503, 504, 516, 517, 529, 530, 542, 543)]
dim(data2)									##Confirm dimensions are 10299 x 66


#####Use descriptive activity names to name the activities in the data set
subjects <- rbind(subject_train, subject_test)			##Merges subject data
labels <- rbind(train_labels, test_labels)			##Merges labels
dim(labels)									##Confirm dimensions are 10299 x 1				
labelled_data <- cbind(labels, subjects, data2)			##Merges the labels, subjects, and the data set so the activity labels correspond with the measurements
dim(labelled_data)							##Confirm dimensions are 10299 x 68


#####Appropriately label the data set with the activity names
names <- c("Activity", "Subject", "Mean_Body_Acceleration_Time_X", "Mean_Body_Acceleration_Time_Y", "Mean_Body_Acceleration_Time_Z", "Std_Dev_Body_Acceleration_Time_X", "Std_Dev_Body_Acceleration_Time_Y", "Std_Dev_Body_Acceleration_Time_Z", "Mean_Gravity_Acceleration_Time_X", "Mean_Gravity_Acceleration_Time_Y", "Mean_Gravity_Acceleration_Time_Z", "Std_Dev_Gravity_Acceleration_Time_X", "Std_Dev_Gravity_Acceleration_Time_Y", "Std_Dev_Gravity_Acceleration_Time_Z", "Mean_Body_Jerk_Acceleration_Time_X", "Mean_Body_Jerk_Acceleration_Time_Y", "Mean_Body_Jerk_Acceleration_Time_Z", "Std_Dev_Body_Jerk_Acceleration_Time_X", "Std_Dev_Body_Jerk_Acceleration_Time_Y", "Std_Dev_Body_Jerk_Acceleration_Time_Z", "Mean_Body_Gyro_Time_X", "Mean_Body_Gyro_Time_Y", "Mean_Body_Gyro_Time_Z", "Std_Dev_Body_Gyro_Time_X", "Std_Dev_Body_Gyro_Time_Y", "Std_Dev_Body_Gyro_Time_Z", "Mean_Body_Gyro_Jerk_Time_X", "Mean_Body_Gyro_Jerk_Time_Y", "Mean_Body_Gyro_Jerk_Time_Z", "Std_Dev_Body_Gyro_Jerk_Time_X", "Std_Dev_Body_Gyro_Jerk_Time_Y", "Std_Dev_Body_Gyro_Jerk_Time_Z", "Mean_Body_Acceleration_Mag_Time", "Std_Dev_Body_Acceleration_Mag_Time", "Mean_Gravity_Acceleration_Mag_Time", "Std_Dev_Gravity_Acceleration_Mag_Time", "Mean_Body_Acceleration_Jerk_Mag_Time", "Std_Dev_Body_Acceleration_Jerk_Mag_Time", "Mean_Body_Gyro_Mag_Time", "Std_Dev_Body_Gyro_Mag_Time", "Mean_Body_Gyro_Jerk_Mag_Time", "Std_Dev_Body_Gyro_Jerk_Mag_Time", "Mean_Body_Acceleration_Freq_X", "Mean_Body_Acceleration_Freq_Y", "Mean_Body_Accleration_Freq_Z", "Std_Dev_Body_Acceleration_Freq_X", "Std_Dev_Body_Acceleration_Freq_Y", "Std_Dev_Body_Acceleration_Freq_Z", "Mean_Body_Acceleration_Jerk_Freq_X", "Mean_Body_Acceleration_Jerk_Freq_Y", "Mean_Body_Acceleration_Jerk_Freq_Z", "Std_Dev_Body_Acceleration_Jerk_Freq_X", "Std_Dev_Body_Acceleration_Jerk_Freq_Y", "Std_Dev_Body_Acceleration_Jerk_Freq_Z", "Mean_Body_Gyro_Freq_X", "Mean_Body_Gyro_Freq_Y", "Mean_Body_Gyro_Freq_Z", "Std_Dev_Body_Gyro_Freq_X", "Std_Dev_Body_Gyro_Freq_Y", "Std_Dev_Body_Gyro_Freq_Z", "Mean_Body_Acceleration_Mag_Freq", "Std_Dev_Body_Acceleration_Mag_Freq", "Mean_Body_Acceleration_Jerk_Mag_Freq", "Std_Dev_Body_Acceleration_Jerk_Mag_Freq", "Mean_Body_Gyro_Mag_Freq", "Std_Dev_Body_Gyro_Mag_Freq", "Mean_Body_Gryo_Jerk_Mag_Freq", "Std_Dev_Body_Gyro_Jerk_Mag_Freq")
colnames(labelled_data) = names

##Aggregate the data to get the mean for each variable, based on unique Activity and Subject combinations
mean_data <- aggregate(labelled_data[, -c(1:2)], by = list(labelled_data$Activity, labelled_data$Subject), mean, na.rm = TRUE)

##Rename columns again, to restore original names to columns 1 and 2 (Activity and Subject)
new_names <- c("Activity", "Subject", "Mean_Body_Acceleration_Time_X", "Mean_Body_Acceleration_Time_Y", "Mean_Body_Acceleration_Time_Z", "Std_Dev_Body_Acceleration_Time_X", "Std_Dev_Body_Acceleration_Time_Y", "Std_Dev_Body_Acceleration_Time_Z", "Mean_Gravity_Acceleration_Time_X", "Mean_Gravity_Acceleration_Time_Y", "Mean_Gravity_Acceleration_Time_Z", "Std_Dev_Gravity_Acceleration_Time_X", "Std_Dev_Gravity_Acceleration_Time_Y", "Std_Dev_Gravity_Acceleration_Time_Z", "Mean_Body_Jerk_Acceleration_Time_X", "Mean_Body_Jerk_Acceleration_Time_Y", "Mean_Body_Jerk_Acceleration_Time_Z", "Std_Dev_Body_Jerk_Acceleration_Time_X", "Std_Dev_Body_Jerk_Acceleration_Time_Y", "Std_Dev_Body_Jerk_Acceleration_Time_Z", "Mean_Body_Gyro_Time_X", "Mean_Body_Gyro_Time_Y", "Mean_Body_Gyro_Time_Z", "Std_Dev_Body_Gyro_Time_X", "Std_Dev_Body_Gyro_Time_Y", "Std_Dev_Body_Gyro_Time_Z", "Mean_Body_Gyro_Jerk_Time_X", "Mean_Body_Gyro_Jerk_Time_Y", "Mean_Body_Gyro_Jerk_Time_Z", "Std_Dev_Body_Gyro_Jerk_Time_X", "Std_Dev_Body_Gyro_Jerk_Time_Y", "Std_Dev_Body_Gyro_Jerk_Time_Z", "Mean_Body_Acceleration_Mag_Time", "Std_Dev_Body_Acceleration_Mag_Time", "Mean_Gravity_Acceleration_Mag_Time", "Std_Dev_Gravity_Acceleration_Mag_Time", "Mean_Body_Acceleration_Jerk_Mag_Time", "Std_Dev_Body_Acceleration_Jerk_Mag_Time", "Mean_Body_Gyro_Mag_Time", "Std_Dev_Body_Gyro_Mag_Time", "Mean_Body_Gyro_Jerk_Mag_Time", "Std_Dev_Body_Gyro_Jerk_Mag_Time", "Mean_Body_Acceleration_Freq_X", "Mean_Body_Acceleration_Freq_Y", "Mean_Body_Accleration_Freq_Z", "Std_Dev_Body_Acceleration_Freq_X", "Std_Dev_Body_Acceleration_Freq_Y", "Std_Dev_Body_Acceleration_Freq_Z", "Mean_Body_Acceleration_Jerk_Freq_X", "Mean_Body_Acceleration_Jerk_Freq_Y", "Mean_Body_Acceleration_Jerk_Freq_Z", "Std_Dev_Body_Acceleration_Jerk_Freq_X", "Std_Dev_Body_Acceleration_Jerk_Freq_Y", "Std_Dev_Body_Acceleration_Jerk_Freq_Z", "Mean_Body_Gyro_Freq_X", "Mean_Body_Gyro_Freq_Y", "Mean_Body_Gyro_Freq_Z", "Std_Dev_Body_Gyro_Freq_X", "Std_Dev_Body_Gyro_Freq_Y", "Std_Dev_Body_Gyro_Freq_Z", "Mean_Body_Acceleration_Mag_Freq", "Std_Dev_Body_Acceleration_Mag_Freq", "Mean_Body_Acceleration_Jerk_Mag_Freq", "Std_Dev_Body_Acceleration_Jerk_Mag_Freq", "Mean_Body_Gyro_Mag_Freq", "Std_Dev_Body_Gyro_Mag_Freq", "Mean_Body_Gryo_Jerk_Mag_Freq", "Std_Dev_Body_Gyro_Jerk_Mag_Freq")
colnames(labelled_data) = new_names

#####Final tidy data set
tidy_data <- mean_data
tidy_data

##Double check findings
dim(tidy_data)								##Should be 180 x 68, meaning there are 180 unique combinations of acitivity and subject, for which there were 66 variables measured.

#####Export data set to txt file
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
