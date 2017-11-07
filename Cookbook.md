File with R code "run_analysis.R" perform the following task:

1. Downloading the zipped file and unzip => The file were downloaded and unzipped under local R directory.
2. Merging the training and the test sets to create one data set.=> use read.table function to read both training file,testing file,features and activity labels files and loading them into separate table.
use cbind function to merge all the data into one dataset for each training and testing data. Use rbind function to merge data between test data and training data.
3. Extracting only the measurements on the mean and standard deviation for each measurement => Reading the column names by colnames function. Create a vector from it (Col). 
4. Uses descriptive activity names to name the activities in the data set
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.=> Create a new dataset (secondtdyset) and writing it in a file.

