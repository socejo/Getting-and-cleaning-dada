## load required libraries
library(dplyr)
library(tidyr)

## this is the directory where I have the assignment data on my PC
## the directory structure from the downloaded data has been preserved 
data.dir <- "c:/users/salvador/r/g&cd/data/"

## this function does the actual tidying of the assignement data
## it has to be called twice, one for the train data and 
## another for the test data
ReadDataSet <- function (dataset,data.dir)
{
    ## save current directory so it can be restored later
    olddir <- getwd()
    
    ## set up complete path
    data.dir <- paste(data.dir,dataset,sep="")
    setwd(data.dir)
    
    ## read file which identifies subjects 
    subjects.file <- paste("subject_",dataset,".txt",sep="")
    subjects <- read.table(subjects.file)
        
    ## read file which identifies activities performed by each subject 
    ## additionally read activities data labels (which are in the higher 
    ## level directory)
    ## and finally join activities with their descriptive labels
    activities.file <- paste("y_",dataset,".txt",sep="")
    activities <- read.table(activities.file)
    actdatalabels <- read.table("../activity_labels.txt")
    activities <- full_join(activities, actdatalabels,by="V1")
            
    ## read processed observations
    ## unprocessed observations seems to be available on 
    ## the Inertial Signals subdirectory
    data.file <- paste("x_",dataset,".txt",sep="")
    data <- read.delim(data.file,header=FALSE, sep="")
    
    ## combine all columns in a single table
    ## first the column that identifies the subjects 
    ## second the column that identifies the activites
    ## then all the other columns
    data <- bind_cols(subjects,
                      as.data.frame(activities[,2]),
                      data
                      )    

    ## read feature labels (which are in the higher level directory)
    ## the number at the begining of each feature is an integral part of 
    ## the name and thus should not be "separated" in a different column
    ## if it is separated, then duplicate values get generated
    ## sep="?" (a character not on the names) makes the trick 
    featureslabels <- read.table("../features.txt",sep="?")
    
    ## name the data columns according to the feature labels 
    ## remember that two columns have been added in a previuos step 
    names(data) <- c("subject", "activity", as.character(featureslabels[,1]))
    
    ## reset the working directory to what it was before this function was executed
    setwd(olddir)
    
    # return tidy dataset  
    data
    
}

## this function performs the assignment requested analysis
PerformAnalysis <- function ()
{
    ## because the files are large and processing could take some time,
    ## a message is printed to the console after each main step 

    ## save current directory so it can be restored later
    olddir <- getwd()
    
    ## load and clean information for the train data set
    TidyTrain <- ReadDataSet("train",data.dir)
    TidyTrain <- tbl_df(TidyTrain)
    print("train data set has been processed")
    
    ## load and clean information for the test data set
    TidyTest <- ReadDataSet("test",data.dir)
    TidyTest <- tbl_df(TidyTest) 
    print("test data set has been processed")
    
    ## set up a single table with all observations  
    TidyMeanStd <- rbind(TidyTrain,TidyTest) %>% 
        tbl_df() %>% 
        select(subject, activity, contains("mean()"), contains("std()"))        
    TidyAverage<- TidyMeanStd %>% 
        group_by(activity,subject) %>% 
        summarise_each(funs(mean))
    print("final tidyed data set has been processed")
    
    ## save the tidyed average file to the data directory  
    write.table(TidyAverage, paste(data.dir,"TidyAverage.txt",sep=""),row.name=FALSE)
    print("final tidyed data set has been saved to disk as TidyAverage.txt")
    
    ## reset the working directory to what it was before this function was executed
    setwd(olddir)
    
}