
The run_analysis.R script was used to modify the data in UCI HAR Dataset
in the following way

* The training and test sets were merged to create one data set.
* Only the measurements on the mean and standard deviation were extracted

* From the data set created with the steps mentioned above, a second, independent tidy data set with the average of each variable for each activity and each subject was created

* This data is presneted in the file means.txt
* The column "activity" refers to the activities carried out by the subject
* The column "subject" refers to each subject by his name
* Other columns have the same meanings as the original data set with the exception that the average of each activity and subject has been taken.