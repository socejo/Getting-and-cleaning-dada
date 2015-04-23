# Codebook for the Getting and cleaning dada course assignment

Data for this assignment was created as result of the  
**Human Activity Recognition Using Smartphones Data Set** project by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto and Xavier Parra and available at [this site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Detailed information is provided on the file README.txt and feature_info.txt files downloaded from the UCI Machine Learning repository. 

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
    - **subject_test.txt** - file containing one record for each observation with a single column identifying the subject 
    - **x_test.txt - file containing one record for each set of 561 measurements corresponding to one observation
    - y_test.txt - file containing one record for each observation with a single column identifying the activity performed by the subject 
  - activity_labels.txt - file with one record for each of the siz activities which were measured 
  - features.txt - file with the names of the 561 measurements recorded for each observation. Detail on them can be find on the file features_info.txt
  - features_info.txt - file with the description oft the 561 meassurements 
  - README.txt - ifnromation abiut the project 

The files of interest for this assignment are subject_xxxx.txt, x_xxxx.txt and y_xxxx.txt, where xxx could be test or train.

## Transformations

Having the different párts of each observation split on 3 fiels makes difficult the kind of analysis we are requested to perform. Same happens to having data without headings. 

The following step where taken por each of the test and train data sets:
- load observation data (x_xxxx.txt)
- add subject information (subject_xxxx.txt) as an additonal column "subject"
- add activity information (y_xxxx.txt) as an additional column
- convert the activity column to he descriptive name of the activity "activty"
- transform the activity column to the descriptive names provided at activity_labels.txt
 
 
It should be noted that the number at the begining of each feature is the features.txt file is an integral part of the name and thus should not be "separated" in a different column. If it is separated, then duplicate values get generated, i.e.: several variables have the same "descriptive" name. The way to avoid separating them is to use as the separator caharact one that for shure is not included in teh names, in this cas I used a question mark. 

### How tidy is tidy data?

Unless you have a very good understanbding of the original project, it is hard to decide if some of the provided columns could be excluded from the tidy data table. 

For example, you could exclude columns which are the result of some simple calculation on other columns of the same observation...

Also, should you include a column to be able to later sepparate the origin (test/train) of the observation? Due to the type of analysis to perform on this assignment, I decided it was not needed.

  		 
