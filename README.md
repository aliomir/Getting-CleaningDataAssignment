##Getting and Cleaning Data Project
run_analysis.R

##The cleanup script (run_analysis.R) does the following:

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Running the script

To run the script, source run_analysis.R & enter cleanup(), following files will be created:
Output1	for part1 of the assignment
Output2	for part2 of the assignment
Output3	for part3 of the assignment
For part 4 of the assignment - all the output already contains the descreptive header

Fiannly the scritp will produce an output by the name of q5.txt in UCI HAR Dataset folder


The resulting clean dataset is in this repository at: /q5.txt. It contains one row for each subject/activity pair and columns for subject, activity, and each feature that was a mean or standard deviation from the original dataset.

