library('dplyr')
# install.packages('crayon')
library('crayon')

################################################################################################
####### 1. Merges the training and the test sets to create one data set. ######################

# Read All Relevant Files into Temp Variables
test_x   <- read.table('UCI HAR Dataset/test/X_test.txt')
test_y   <- read.table('UCI HAR Dataset/test/y_test.txt')
test_sub <- read.table('UCI HAR Dataset/test/subject_test.txt', col.names=c('subject_number'))

train_x   <- read.table('UCI HAR Dataset/train/X_train.txt')
train_y   <- read.table('UCI HAR Dataset/train/y_train.txt')
train_sub <- read.table('UCI HAR Dataset/train/subject_train.txt', col.names=c('subject_number'))

activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt')
feature_labels <- read.table('UCI HAR Dataset/features.txt')

# Step Zero, let's clean up the names of the features so that they're more understandable.
feature_labels_clean <- feature_labels$V2
feature_labels_clean <- gsub('tBodyAcc-', 'time-based_body_acceleration ', feature_labels_clean)
feature_labels_clean <- gsub('tGravityAcc-', 'time-based_gravity_acceleration ', feature_labels_clean)
feature_labels_clean <- gsub('tBodyGyro', 'time-based_body_gyroscope', feature_labels_clean)
feature_labels_clean <- gsub('fBodyAcc', 'frequency-based_body_acceleration', feature_labels_clean)
feature_labels_clean <- gsub('fBodyGyro', 'frequency-based_gyroscope', feature_labels_clean)
feature_labels_clean <- gsub('tBodyAccJerk', 'derived_jerk_body_acceleration', feature_labels_clean)
feature_labels_clean <- gsub('tBodyAccMag', 'derived_body_acceleration_magnitude', feature_labels_clean)
feature_labels_clean <- gsub('tGravityAccMag', 'derived_gravity_acceleration_magnitude', feature_labels_clean)
feature_labels_clean <- gsub('tBodyAccJerkMag', 'derived_body_jerk_acceleration_magnitude', feature_labels_clean)

feature_labels_clean <- gsub('mean()', 'AVERAGE', feature_labels_clean)
feature_labels_clean <- gsub('std()', 'STANDARD_DEV', feature_labels_clean)

# First, going to transform test_y and train_y to correspond with their activity.

test_y_with_labels = inner_join(test_y, activity_labels)
colnames(test_y_with_labels) = c('activity_number', 'activity_name')

train_y_with_labels = inner_join(train_y, activity_labels)
colnames(train_y_with_labels) = c('activity_number', 'activity_name')

# Next, going to add correct column names to train_x and test_x
names(test_x) = c(as.character(feature_labels_clean))
names(train_x) = c(as.character(feature_labels_clean))

all_test_data <- bind_cols(test_sub, test_y_with_labels, test_x)
all_train_data <- bind_cols(train_sub, train_y_with_labels, train_x)

all_data <- bind_rows(all_test_data, all_train_data)

########################################################################################################
###### 2. Extracts only the measurements on the mean and standard deviation for each measurement. ######

# First, find columns that are mean and std. (using names given earlier)
col_numbers_for_mean <- grep('AVERAGE', feature_labels_clean)
col_numbers_for_std <- grep('STANDARD_DEV', feature_labels_clean)

# Why am I doing this? Great. Earlier I got the indices within the feature list for means and stds.
# In my all_data table, all of these indices are actually increased by 3, since there are three
# columns added to the front (subject number, activity number, activity name).
# So here, I'm adding three to each calculated mean/std in order to find where it is in the table. 
positions = c(1, 2, 3, col_numbers_for_mean+3, col_numbers_for_std+3)

means_and_stds <- select(all_data, positions)

########################################################################################################
###### 3. Uses descriptive activity names to name the activities in the data set ######################
# By joining earlier on the activity labels table, each row now has the activity name originally provided. 

########################################################################################################
###### 4. Appropriately labels the data set with descriptive variable names. ##########################
# Again, by resetting the column names of X files earlier to use the features info provided, all columns
# are appropriately labeled. 

########################################################################################################
###### 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
###### each variable for each activity and each subject. ###############################################

grouped_data <- means_and_stds %>% group_by(subject_number, activity_name)
averaged_for_each_group <- summarise_all(grouped_data, mean)

new_name_list <- list()
for(name in names(averaged_for_each_group)) {
  if(name == 'subject_number' || name == 'activity_name' || name == 'activity_number') {
    new_name_list <- append(new_name_list, name)
  } else {
    newname <- 'average ' %+% name %+% ' for activity/subject pair'
    new_name_list <- append(new_name_list, newname)
  }
}

names(averaged_for_each_group) <- new_name_list

output <- write.table(averaged_for_each_group, 'output.txt', row.name=FALSE)
