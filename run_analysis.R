#Ingest the main data files from both training and test
features<-read.csv("rawdata/UCI_HAR_Dataset/features.txt", sep=" ", header=FALSE)

test_data <- read.table("rawdata/UCI_HAR_Dataset/test/X_test.txt", header=FALSE, col.names=features[,2])
test_data$activity <- read.csv("rawdata/UCI_HAR_Dataset/test/y_test.txt", header=FALSE)[,1]
test_data$subject <- read.csv("rawdata/UCI_HAR_Dataset/test/subject_test.txt", header=FALSE)[,1]

train_data <- read.table("rawdata/UCI_HAR_Dataset/train/X_train.txt", header=FALSE, col.names=features[,2])
train_data$activity <- read.csv("rawdata/UCI_HAR_Dataset/train/y_train.txt", header=FALSE)[,1]
train_data$subject <- read.csv("rawdata/UCI_HAR_Dataset/train/subject_train.txt", header=FALSE)[,1]

#Combine the data together
data <- rbind(train_data, test_data)
rm(train_data)
rm(test_data)

