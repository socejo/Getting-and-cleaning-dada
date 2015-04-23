# Getting and cleaning dada

This is my repo with information related to the Getting and Cleaning Data Course project.
 
Please refer to the codebook.md which explains what is included in the tidy data set included on this repo.

## Work preformed

l. The most demanding part of this assignment was to first of all understand what was requested and also undertand how the data for the project was structured. 

l. After that, some time was spent "playing around" with the provided data, reading it inside R and obtaining some basic numbers:
					obs	var	  range	      size
  train/subject_train.txt 	7352	  1	 1 to 30	    30,080
  train/x_train.txt		7352	561	-1 to 1 	33,054,688
  train/y_train.txt 		7352	  1 	 1 to 6	    30,080
  test/subject_test.txt 	2947	  1 	 2 to 24	    12,464
  test/x_test.txt		2947	561	-1 to 1	13,285,048
  test/y_test.txt 		2947	  1	 1 to 6	    12,464
  activity_labels.txt		   6 	  2	 factor 	     1,592
  features.txt			 561	  2 	 factor 	    43,936

1. Having understood how the data is structured, I started the creating of the requested script testing each single step separatelly.

## Script definition 

The script creates two functions:

*ReadDatSet(dataset="train", dataset.dir)* 

* The first parameter can have the values "train" or "test" depending if you want to process the train or test data sets
* The second parameter is the path where your data sets are located

That path should point to a directory containing the following:
	train subdirectory
		subject_train.txt
		x_train.txt
		y_train.txt
	test subdirectory 
		subject_train.txt
		x_train.txt
		y_train.txt
	activity_labels.txt
	features.txt

Other files could be on the directory and subdirectories, but they will not be touched in any way.

The result form the function is a tidyed train or test data set, depending which was requested.

*PerformAnalysis()*

This function actually performs the analysis requested by the assignment. It calls the ReadDataSet function twice, one for the training data and a second for the test data and then does the column selection and averaging requested. 

You are *encouraged* to run the script, following this sequence:
	setwd("path of the directory where you downloaded the script" 
	source ("run_analysis.R")
	dataset.dir <- "full path for your data directory"
	PerformAnalysis()

At the end of the execution, the following variables will be available on your R Workspace, please feel free to analyse and review them at your leisure:

*TidyTrain* contains the train data tidyed according to what is explained on the codebook.md file  

*TidyTest* contains the test data tidyed according to what is explained on the codebook.md file  

*TidyAverage* contains the data as requested on step 5 of the assignment instructions