library(dplyr)

# Get the main column names and figure out which means are mean/std.
feature_names<-read.csv("rawdata/UCI_HAR_Dataset/features.txt", sep=" ", header=FALSE)[,2]

# Filter to only those that involve 'mean' and 'std' measurements
mean_std_cols <- grep("(mean|std)", tolower(feature_names))

# Ingest the main training and test data and filter for mean and std columns only
test_data <- read.table("rawdata/UCI_HAR_Dataset/test/X_test.txt", header=FALSE)
test_data <- test_data[,mean_std_cols]
train_data <- read.table("rawdata/UCI_HAR_Dataset/train/X_train.txt", header=FALSE)
train_data <- train_data[,mean_std_cols]

# Add activity and subject data
ACTIVITY_CODE_JOIN_COL <- "activity_code"
test_data$ACTIVITY_CODE_JOIN_COL <- read.csv("rawdata/UCI_HAR_Dataset/test/y_test.txt", header=FALSE)[,1]
test_data$subject <- read.csv("rawdata/UCI_HAR_Dataset/test/subject_test.txt", header=FALSE)[,1]
train_data$ACTIVITY_CODE_JOIN_COL <- read.csv("rawdata/UCI_HAR_Dataset/train/y_train.txt", header=FALSE)[,1]
train_data$subject <- read.csv("rawdata/UCI_HAR_Dataset/train/subject_train.txt", header=FALSE)[,1]

# Combine the training and test sets together
data <- rbind(train_data, test_data)

# Give proper names to each column
names(data) <- c(as.character(feature_names[mean_std_cols]), ACTIVITY_CODE_JOIN_COL, "subject")

# Release transient memory
rm(feature_names)
rm(mean_std_cols)
rm(train_data)
rm(test_data)

# Set the activity to descriptive words rather than code numbers
activity_labels <- read.table("rawdata/UCI_HAR_Dataset/activity_labels.txt")
colnames(activity_labels)[1] = ACTIVITY_CODE_JOIN_COL
colnames(activity_labels)[2] = "activity"
data <- inner_join(activity_labels, data, ACTIVITY_CODE_JOIN_COL)

# Release transient memory
rm(activity_labels)


