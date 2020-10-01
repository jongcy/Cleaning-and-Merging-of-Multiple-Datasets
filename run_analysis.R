#read all types of data from file
activitylabel<-read.table("C:\\Users\\user\\Desktop\\Coursera\\samsung\\UCI HAR Dataset\\activity_labels.txt",header = FALSE)
parameter<-read.table("C:\\Users\\user\\Desktop\\Coursera\\samsung\\UCI HAR Dataset\\features.txt",header = FALSE)
rawtrain<-read.table("C:\\Users\\user\\Desktop\\Coursera\\samsung\\UCI HAR Dataset\\train\\X_train.txt",header = FALSE)
rawtrainlabel<-read.table("C:\\Users\\user\\Desktop\\Coursera\\samsung\\UCI HAR Dataset\\train\\y_train.txt",header = FALSE)
rawtestlabel<-read.table("C:\\Users\\user\\Desktop\\Coursera\\samsung\\UCI HAR Dataset\\test\\y_test.txt",header = FALSE)
rawtest<-read.table("C:\\Users\\user\\Desktop\\Coursera\\samsung\\UCI HAR Dataset\\test\\X_test.txt",header = FALSE)
rawtestsubject<-read.table("C:\\Users\\user\\Desktop\\Coursera\\samsung\\UCI HAR Dataset\\test\\subject_test.txt",header = FALSE)
rawtrainsubject<-read.table("C:\\Users\\user\\Desktop\\Coursera\\samsung\\UCI HAR Dataset\\train\\subject_train.txt",header = FALSE)
#combining data
raw<-rbind(rawtest,rawtrain)
subject<-rbind(rawtestsubject,rawtrainsubject)
label<-rbind(rawtestlabel,rawtrainlabel)
#renaming columns
colnames(activitylabel)<-c("id","type")
colnames(raw)<-parameter[,2]
colnames(subject)<-"subject"
colnames(label)<-"id"
#combining all data
data<-cbind(label,subject,raw)
#identify mean and std dev columns
datams<-data[,grepl("mean|std|id|subject",colnames(data))]
#convert integer to activity type
datams<-join(datams,activitylabel,by="id",match="first")

#correcting column names
names(datams)<-gsub("^t", "time", names(datams))
names(datams)<-gsub("^f", "frequency", names(datams))
names(datams)<-gsub("Acc", "Accelerometer", names(datams))
names(datams)<-gsub("Gyro", "Gyroscope", names(datams))
names(datams)<-gsub("Mag", "Magnitude", names(datams))
names(datams)<-gsub("BodyBody", "Body", names(datams))

#tidy up data
tidydata<- ddply(datams, c("subject","id"), numcolwise(mean))
#write table

