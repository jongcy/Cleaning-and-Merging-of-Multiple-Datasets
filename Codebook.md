#Course Project

**All data table are loaded in R Environment with read.table()**

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

**Train and Test Data are appended using cbind**

different sets are respectively combined with the variable names of raw, subject and label respectively

**Renaming Columns**

The readings data are renamed by feature list

while the rest of data are renamed with intelligent name i.e. "subject","id" etc

**combining data**

all readings are combined into one table called "data"

**extracting mean and standard deviation**

using grepl() function, the column with mean and standard deviation are extracted

in order to preserve the id and subject, both of them are included in grepl() wrapping

data are saved into variable datams

**correcting column names**

The name of columns are editted with gsub function to give intelligent names

**tidy data**

The data are categorize and presented in terms of both subject and activity.

The data are saved into variable tidydata and saved as tidydata.txt
