# Getting and cleaning dada

This is a repo with information related to the Getting and Cleaning Data Course project.
 
Please refer to the codebook.md, which explains what is in the tidy data set included on this repo.

## Work preformed

1. A demanding part of this assignment was to understand what was requested and how the data for the project was structured and related. 

2. After that, some time was spent "playing around" with the provided data, reading it inside R and obtaining some basic numbers. See table below.

3. Having understood how the data is structured and related, I started the creation of the requested script, testing and refining each single step separately.

| file | obs | var | range | size|
|:-----|----:|----:|:------:|----:|
| train/subject_train.txt | 7,352 | 1 | 1 to 30 | 30,080 |
| train/x_train.txt | 7,352 | 561 | -1 to 1 | 33,054,688 |
| train/y_train.txt | 7,352 | 1 | 1 to 6 | 30,080 |
| test/subject_test.txt | 2,947 | 1 | 2 to 24 | 12,464 |
| test/x_test.txt | 2,947 | 561 | -1 to 1 | 13,285,048 |
| test/y_test.txt | 2,947 | 1 | 1 to 6 | 12,464 |
| activity_labels.txt | 6 | 2 | factor | 1,592 |
| features.txt | 561 | 2 | factor | 43,936|

**Note:** Ifound that the number at the beginning of each feature is an integral part of its name and thus should not be "separated" in a different column, if it is separated, then duplicate values get generated. The R script on this repo does a "trick" to avoid this situation.  

Data was validated for the existence of missing values finding there is none, that is,  

    sum(complete.cases(x_train.txt))
    sum(complete.cases(x_test.txt))

give the same number of rows as the original files.

## Script definition 

The script creates two functions:

**ReadDatSet(dataset, data.dir)** 

* _dataset_ can have the values "train" or "test" depending if you want to process the train or test data sets
* _data.dir_ is the path where your data sets are located

That path should point to a directory containing the following:
- train _(subdirectory)_
  - subject_train.txt
  - x_train.txt
  - y_train.txt
- test _(subdirectory)_ 
  - subject_train.txt
  - x_train.txt
  - y_train.txt
- activity_labels.txt
- features.txt

There could be other files on the directory and subdirectories, but they will not be touched in any way.


There could be other files on the directory and subdirectories, none of which will be touched in any way.

The result from the function is a tidied train or test data set, depending which was requested.

**PerformAnalysis()**

This function actually performs the analysis requested by the assignment. It calls the ReadDataSet function twice, first for the training data and second for the test data. After that:

1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set _(already done by ReadDataSet_)
4. Appropriately labels the data set with descriptive variable names _(already done by ReadDataSet)_ 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

**Note:** I am fully aware that the sequence I followed is different from the sequence stated above, however the result is exactly the same, and for me it was easier to define a function for tidying "any" dataset and call it twice.
 
You are encouraged to run the script, following this sequence:

    setwd("directory path where you downloaded the script" 
    source ("run_analysis.R")
    data.dir <- "full path for your data directory"
    PerformAnalysis()

At the end of the execution, the following variables will be available on your R Workspace.
You can remove them with:

    rm(TidyMeanStd)
    rm(TidyAverage)

нннннн__TidyMeanStd__ contains the data as requested on step 2 of the assignment instructions (10,299 observations of 68 variables) 

__TidyAverage__ contains the data set requested on step 4 of the assignment instructions (180 observations of 68 variables)

Additionally a file named "TidyAverage.txt" will be available on your "data" directory. Please note this file has headings, so it should be read with:

    read.table("TidyAverage.txt", header=TRUE)