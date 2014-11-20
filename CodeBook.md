Code Book


The data for the project was downloaded and un-zipped from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The following variables were used to read in the text files:

test_data
test_labels
test_subjects
train_data
train_labels 
train_subjects 

all_data is what I used to bind the above six variables into one dataset

features was another text file from the zip files.  
I use features to pull out the mean and standard deviation from the data
and stored the mean & standard deviation in data_mean_std

I used the variable labels to read in the activity_labels text file

list_colnames was used to concatinate all the column names and assign then to the new data set

tidy_data was the last variable, which holds all my "tidy" data for the project that I then wrote to a text file.  
