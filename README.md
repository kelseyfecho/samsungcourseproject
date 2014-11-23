The following is a codebook to use for interpreting the final course project in the Getting and Cleaning Data course through Coursera and the John Hopkins Unviersity. This book should be used in conjunction with the accompanying script for the most complete understanding.

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- ‘tidy_data.txt’: A tidy data set incorporate information from the other files listed above.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals Acceleration_Time_XYZ and Gyro_Time_XYZ. These time domain signals (suffix 'Time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (Body_Acceleration_Time_XYZ and Gravity_Acceleration_Time_XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Body_Acceleration_Jerk_Time_XYZ and Body_Gyro_Jerk_Time_XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (Body_Acceleration_Mag_Body_Time, Gravity_Acceleration_Mag_Time, Body_Acceleration_Jerk_Mag_Time, Body_Gyro_Mag_Time, Body_Gyro_Jerk_Mag_Time). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing Body_Acceleration_Freq_XYZ, Body_Acceleration_Jerk_Body_Freq_XYZ, Body_Gyro_Freq_XYZ, Body_Acceleration_Mag_Freq, Body_Acceleration_Jerk_Mag_Body_Freq, Body_Gyro_Mag_Freq, Body_Gyro_Jerk_Mag_Freq. (Note the 'Freq' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Body_Acceleration_Time_XYZ
Gravity_Acceleration_Time_XYZ
Body_Acceleration_Jerk_Time_XYZ
Body_Gyro_Time_XYZ
Body_Gyro_Jerk_Time_XYZ
Body_Acceleration_Mag_Time
Gravity_Acceleration_Mag_Time
Body_Acceleration_Jerk_Mag_Time
Body_Gyro_Mag_Body_Time
Body_Gyro_Jerk_Mag_Time
Body_Acceleration_Freq_XYZ
Body_Acceleration_Jerk_Body_Freq_XYZ
Body_Gyro_Freq_XYZ
Body_Acceleration_Mag_Freq
Body_Acceleration_Jerk_Mag_Body_Freq
Body_Gyro_Mag_Freq
Body_Gyro_Jerk_Mag_Freq

The set of variables that were estimated from these signals are: 

Mean: Mean value
Std_Dev: Standard deviation

To identify column functions, please note that variable type is used as a suffix to signal name.
	Ex: Mean_Body_Acceleration_Time_X

Feature information was sorted by Activity and Subject combinations. Columns containing this information are as follows:

- Group.1 : Activity information. Range of information includes: LAYING, SITTING, STANDING, WALKING, WALKING_UPSTAIRS, AND WALKING_DOWNSTAIRS.

- Group.2 : Subject information. Range of information includes numerical values from 1 to 30.

The complete list of variables of each feature vector is available in 'features.txt'





The following transformations were performed to create a tidy data set:
1.	Using the rbind() function, the train_set.txt and test_set.txt files were merged into one data set, data2.
2.	Using the colnames() function, column names were assigned using the second column of the features.txt file.
3.	The resulting data set was subsetting to include only columns containing mean and standard deviation variables.
4.	Using the rbind() function, the subject_train.txt and subject_test.txt files were merged into one data set of all subject data, subjects.
a.	Note: it is important that any “train” files precede “test” files in any merging function, so the data is clipped properly.
5.	Using the rbind() function, the train_labels.txt and test_labels.txt files were merged into one data set containing all label information, labels.
6.	Using the cbind() function, the labels, subjects, and data2 datasets were merged into one data set, called labelled_data.
7.	Columns were renamed using the character vector “names” to ensure readability.
8.	The data was aggregated to get a mean for each variable, based on unique activity and subject combinations.
9.	The resulting data set was put into an independent data set, named tidy_data, which was exported to a .txt file, “tidy_data.txt”, using the write.table() function.


	
