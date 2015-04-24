# Codebook for the "Getting and cleaning data" course assignment

Data for this assignment was created as result of the  
**Human Activity Recognition Using Smartphones Data Set** project by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto and Xavier Parra and available at [this site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Detailed information is provided on the files README.txt and feature_info.txt [downloaded from the UCI Machine Learning repository.](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/)   

## Downloaded information

Information included in the downloaded file is structured as follows:

- data - main subdirectory
  - train - subdirectory for the train part of the project
    - Inertial Signals - subdirectory with several files, apparently correspondig to raw data (not used on this assignment)
    - subject_train.txt - file containing one record for each observation with a single column identifying the subject 
    - x_train.txt - file containing one record for each set of 561 measurements corresponding to one observation
    - y_train.txt - file containing one record for each observation with a single column identifying the activity performed by the subject 
  - test - subdirectory for the test part of the project
    - Inertial Signals - subdirectory with several files, apparently correspondig to raw data (not used on this assignment)
    - subject_test.txt - file containing one record for each observation with a single column identifying the subject 
    - x_test.txt - file containing one record for each set of 561 measurements corresponding to one observation
    - y_test.txt - file containing one record for each observation with a single column identifying the activity performed by the subject 
  - activity_labels.txt - file with one record for each of the siz activities which were measured 
  - features.txt - file with the names of the 561 measurements recorded for each observation. Detail on them can be find on the file features_info.txt
  - features_info.txt - file with the description oft the 561 meassurements 
  - README.txt - information about the project 

The files of interest for this assignment are subject_xxxx.txt, x_xxxx.txt and y_xxxx.txt, where xxxx could be test or train.

## Transformations

Having the different parts of each observation split on 3 files makes difficult _the kind of analysis_ we are requested to perform. Same happens to having data without headings. 

The following step where taken for each of the test and train data sets:
- load observation data (x_xxxx.txt)
- add subject information (subject_xxxx.txt) as an additonal column named "subject"
- add activity information (y_xxxx.txt) as an additional column named "activity"
- transform the activity column to the descriptive names provided at activity_labels.txt
- adds names for all the data columns, using the names given above for the new columns and the names provided on the features.txt file 

Having the two tidied data sets, they where binded together selecting only the columns containing the string "mean()" or the string "std()".

This new data set was used to calcule the mean on each variable for each activty/subject.     
 
**Notes**

1. The number at the begining of each feature in the features.txt file is an integral part of the name and thus should not be "separated" in a different column. If it is separated, then duplicate values get generated, i.e.: several variables have the same "descriptive" name. The way to avoid separating them is to use as the separator character one that for shure is not included in the names, in this case I used a question mark.

2. There are several variables which name includes the string "mean", however the original project features_info.txt file indicates that _the variables with mean() on its name have the mean value and those with std() have the Standard deviation_ (66 in total).

### How tidy is tidy data?

Unless you have a complete understanding of the original project, it is hard to decide if some of the provided columns "could" be excluded from the tidy data table. For example, you could exclude columns which are the result of some simple calculation on other columns of the same observation...

Also, should you include a column to be able to later sepparate the origin (test/train) of the observation? Due to the type of analysis to perform on this assignment, I decided it was not needed. However, someone else could have decided it was needed.

Does the problem stated on the **Note 1** above is a mistake from the designer of the original project? Is it a typo? Is it intended that way? We do not know, and deppending on the answer this could be some other thing to do to tidy the data, maybe thevariables with the same name have the same value... As this was not something requested, neider meaningful  for this assignment it was not analyzed. 

## Columns included in the tidied data set 

The tidied data set contains the following columns:
- activity - a descriptive name of the activities performed by the subjects
- subject - and identification of the subject 
- columns from the original data set, which contain the average for each activity-subject of those columns corresponding to mean or standard deviation measurements (66 in total, 33 for mean and 33 for std). All columns names have been appeded with the words "Average of " to document the fact that their value no longer represents the original value. 
  - tBodyAccMag
  - tGravityAccMag
  - tBodyAccJerkMag
  - tBodyGyroMag
  - tBodyGyroJerkMag
  - fBodyAccMag
  - fBodyBodyAccJerkMag
  - fBodyBodyGyroMag
  - fBodyBodyGyroJerkMag

-  The following columns have also an XYZ component:
  - tBodyAcc
  - tGravityAcc
  - tBodyAccJerk
  - tBodyGyro
  - tBodyGyroJerk
  - fBodyAcc
  - fBodyAccJerk
  - fBodyGyro

Considering there were six different activities performed by each of 30 subjects, as expected the resulting file has 6*30 or 180 observations of 68 variables (66 values plus "activity" and "subject").  
  		 
