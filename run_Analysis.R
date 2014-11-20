
## data.table package is already loaded if I need to use it
##all text files are in my working directory
##Reading in all the data from UCI HAR Dataset
##test dataset
test_data <- read.table("X_test.txt")
test_labels <- read.table("y_test.txt", col.names="label")
test_subjects <- read.table("subject_test.txt", col.names="subject")
##train dataset
train_data <- read.table("X_train.txt")
train_labels <- read.table("y_train.txt", col.names="label")
train_subjects <- read.table("subject_train.txt", col.names="subject")

##bind the data together
all_data <- rbind(cbind(test_subjects, test_labels, test_data), cbind(train_subjects, train_labels, train_data))

# read the features and keep mean and standard deviation
features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
features_mean_std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]
data_mean_std <- all_data[, c(1, 2, features_mean_std$V1+2)]

# read and name the activities/labels
labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
data_mean_std$label <- labels[data_mean_std$label, 2]

# make a list of column and feature names then use that list a new column names
list_colnames <- c("subject", "label", features_mean_std$V2)
colnames(data_mean_std) <- list_colnames

#use the aggregate function to find the mean and standard deviation for all the data
tidy_data <- aggregate(data_mean_std[, 3:ncol(data_mean_std)], by=list(subject = data_mean_std$subject, label = data_mean_std$label), mean)

##write the tidy data to a text file for upload
write.table(format(tidy_data, scientific=TRUE), "tidy_data.txt", row.names=FALSE, col.names=FALSE, quote=2)




