library(dplyr)

# Read in data
train_x <- read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt")
train_subject <- read.table("train/subject_train.txt")
test_x <- read.table("test/X_test.txt")
test_y <- read.table("test/y_test.txt")
test_subject <- read.table("test/subject_test.txt")
features <- read.table("features.txt")
activity_lbl <- read.table("activity_labels.txt")

# Rename columns
colnames(train_x) <- features[[2]]
colnames(test_x) <- features[[2]]
test_y <- rename(test_y, Activity = V1)
test_subject <- rename(test_subject, Subject = V1)
train_y <- rename(train_y, Activity = V1)
train_subject <- rename(train_subject, Subject = V1)

# Merge activity labels with data
test <- cbind(test_x, test_y, test_subject)
train <- cbind(train_x, train_y, train_subject)

# Select columns associated with mean and st.dev
test <- test[grep("mean()|std()|Activity|Subject", x = colnames(test))]
train <- train[grep("mean()|std()|Activity|Subject", x = colnames(train))]

# Create variable for where the data came from before merging
test <- mutate(test, dataType = "Test")
train <- mutate(train, dataType = "Train")

# Combine test and training data
ds <- rbind(test, train)

# Use descriptive activity names
ds$Activity <- factor(ds$Activity, levels = activity_lbl[[1]], labels = activity_lbl[[2]])

# Create tidy dataset with the average of each variable for each activity and each subject
ds <- group_by(ds, Activity, Subject)
tidy.ds <- summarise_all(ds, mean)

print(tidy.ds)