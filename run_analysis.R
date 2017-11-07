#1 Downloading file and unzip

if (!file.exists("./clndata")){dir.create("./clndata")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./clndata/Dataset.zip")

unzip (zipfile="./clndata/Dataset.zip",exdir="./clndata")

#2 Merges the training and the test sets to create one data set

X_train<- read.table("./clndata/UCI HAR Dataset/train/X_train.txt")
Y_train<- read.table("./clndata/UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("./clndata/UCI HAR Dataset/train/Subject_train.txt")

X_test<-read.table("./clndata/UCI HAR Dataset/test/X_test.txt")
Y_test<-read.table("./clndata/UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("./clndata/UCI HAR Dataset/test/subject_test.txt")

features<- read.table("./clndata/UCI HAR Dataset/features.txt")

activitylabels <-read.table("./clndata/UCI HAR Dataset/activity_labels.txt")

colnames(X_train) <- features[,2]
colnames(Y_train) <- "activityId"
colnames(subject_train) <-"subjectId"

colnames(X_test) <-features[,2]
colnames(Y_test) <-"activityId"
colnames(subject_test) <-"subjectId"

colnames(activitylabels) <-c('activityId','activityType')

merg_train <-cbind(Y_train,subject_train,X_train)
merg_test <-cbind(Y_test,subject_test,X_test)
merg_all <-rbind(merg_train,merg_test)

col<-colnames(merg_all)

# 3 Extracting only the measurements on the mean and standard deviation for each measurement

mean_std <- (grepl("activityId",col)|
               grepl("subjectId",col)|
               grepl("mean..",col)|
               grepl("std..",col)
)

subset_mean_std<-merg_all[, mean_std == TRUE]

# 4 Uses descriptive activity names to name the activities in the data set

descriptivename<-merge(subset_mean_std,activitylabels,by='activityId',all.x=TRUE)

# 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

secondtdyset <-aggregate(. ~subjectId + activityId,descriptivename,mean)
secondtdyset <-secondtdyset[order(secondtdyset$subjectId,secondtdyset$activityId), ]


write.table(secondtdyset,"newtidydata.txt",row.names=TRUE)