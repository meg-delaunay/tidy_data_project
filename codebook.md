
## Codebook

### This doc contains instructions on creating and using the final outputted dataset.

The dataset, `output.txt`, is created by running `run_analysis.R` against the data in the UCI HAR Dataset (included!). 

To create, run `runAnalysis.R`, ensuring the following packages are installed:
 - `dplyr`
 - `crayon`

### Processing Code Overview

The code itself is well documented, but at a high level, the processing following these steps:

1. Read in Origin Data
2. Add verbosity to the feature names of the original data, such that a layman can ..almost figure out what they mean
3. Join the test and train data, along with feature names and activity labels, such that one cohesive dataset is produced
4. Use GREP to find columns that are mean and std measurements
5. Group the data by subject and activity, and take the average of all corresponding measurements
6. Dump into output.txt

### Output Data
The outputted file contains 82 variables, listed in full in the appendix.

The important fields are defined below:

subject_number - represents the id the participant in the study
activity_name - represents the activity during which the other variables were measured
activity_number - a unique id for each activity

the rest of the variables each represent the `AVERAGE` of some measurement for each `activity/subject pair`.

so, `average time-based_body_acceleration AVERAGE()-Y for activity/subject pair` is the average measurement of all `time-based_body_acceleration AVERAGE()-Y` measurements taken for each pair of subject and activity


### Appendix
subject_number
activity_name
activity_number
average time-based_body_acceleration AVERAGE()-X for activity/subject pair
average time-based_body_acceleration AVERAGE()-Y for activity/subject pair
average time-based_body_acceleration AVERAGE()-Z for activity/subject pair
average time-based_gravity_acceleration AVERAGE()-X for activity/subject pair
average time-based_gravity_acceleration AVERAGE()-Y for activity/subject pair
average time-based_gravity_acceleration AVERAGE()-Z for activity/subject pair
average derived_jerk_body_acceleration-AVERAGE()-X for activity/subject pair
average derived_jerk_body_acceleration-AVERAGE()-Y for activity/subject pair
average derived_jerk_body_acceleration-AVERAGE()-Z for activity/subject pair
average time-based_body_gyroscope-AVERAGE()-X for activity/subject pair
average time-based_body_gyroscope-AVERAGE()-Y for activity/subject pair
average time-based_body_gyroscope-AVERAGE()-Z for activity/subject pair
average time-based_body_gyroscopeJerk-AVERAGE()-X for activity/subject pair
average time-based_body_gyroscopeJerk-AVERAGE()-Y for activity/subject pair
average time-based_body_gyroscopeJerk-AVERAGE()-Z for activity/subject pair
average derived_body_acceleration_magnitude-AVERAGE() for activity/subject pair
average derived_gravity_acceleration_magnitude-AVERAGE() for activity/subject pair
average derived_jerk_body_accelerationMag-AVERAGE() for activity/subject pair
average time-based_body_gyroscopeMag-AVERAGE() for activity/subject pair
average time-based_body_gyroscopeJerkMag-AVERAGE() for activity/subject pair
average frequency-based_body_acceleration-AVERAGE()-X for activity/subject pair
average frequency-based_body_acceleration-AVERAGE()-Y for activity/subject pair
average frequency-based_body_acceleration-AVERAGE()-Z for activity/subject pair
average frequency-based_body_acceleration-AVERAGEFreq()-X for activity/subject pair
average frequency-based_body_acceleration-AVERAGEFreq()-Y for activity/subject pair
average frequency-based_body_acceleration-AVERAGEFreq()-Z for activity/subject pair
average frequency-based_body_accelerationJerk-AVERAGE()-X for activity/subject pair
average frequency-based_body_accelerationJerk-AVERAGE()-Y for activity/subject pair
average frequency-based_body_accelerationJerk-AVERAGE()-Z for activity/subject pair
average frequency-based_body_accelerationJerk-AVERAGEFreq()-X for activity/subject pair
average frequency-based_body_accelerationJerk-AVERAGEFreq()-Y for activity/subject pair
average frequency-based_body_accelerationJerk-AVERAGEFreq()-Z for activity/subject pair
average frequency-based_gyroscope-AVERAGE()-X for activity/subject pair
average frequency-based_gyroscope-AVERAGE()-Y for activity/subject pair
average frequency-based_gyroscope-AVERAGE()-Z for activity/subject pair
average frequency-based_gyroscope-AVERAGEFreq()-X for activity/subject pair
average frequency-based_gyroscope-AVERAGEFreq()-Y for activity/subject pair
average frequency-based_gyroscope-AVERAGEFreq()-Z for activity/subject pair
average frequency-based_body_accelerationMag-AVERAGE() for activity/subject pair
average frequency-based_body_accelerationMag-AVERAGEFreq() for activity/subject pair
average fBodyBodyAccJerkMag-AVERAGE() for activity/subject pair
average fBodyBodyAccJerkMag-AVERAGEFreq() for activity/subject pair
average fBodyBodyGyroMag-AVERAGE() for activity/subject pair
average fBodyBodyGyroMag-AVERAGEFreq() for activity/subject pair
average fBodyBodyGyroJerkMag-AVERAGE() for activity/subject pair
average fBodyBodyGyroJerkMag-AVERAGEFreq() for activity/subject pair
average time-based_body_acceleration STANDARD_DEV()-X for activity/subject pair
average time-based_body_acceleration STANDARD_DEV()-Y for activity/subject pair
average time-based_body_acceleration STANDARD_DEV()-Z for activity/subject pair
average time-based_gravity_acceleration STANDARD_DEV()-X for activity/subject pair
average time-based_gravity_acceleration STANDARD_DEV()-Y for activity/subject pair
average time-based_gravity_acceleration STANDARD_DEV()-Z for activity/subject pair
average derived_jerk_body_acceleration-STANDARD_DEV()-X for activity/subject pair
average derived_jerk_body_acceleration-STANDARD_DEV()-Y for activity/subject pair
average derived_jerk_body_acceleration-STANDARD_DEV()-Z for activity/subject pair
average time-based_body_gyroscope-STANDARD_DEV()-X for activity/subject pair
average time-based_body_gyroscope-STANDARD_DEV()-Y for activity/subject pair
average time-based_body_gyroscope-STANDARD_DEV()-Z for activity/subject pair
average time-based_body_gyroscopeJerk-STANDARD_DEV()-X for activity/subject pair
average time-based_body_gyroscopeJerk-STANDARD_DEV()-Y for activity/subject pair
average time-based_body_gyroscopeJerk-STANDARD_DEV()-Z for activity/subject pair
average derived_body_acceleration_magnitude-STANDARD_DEV() for activity/subject pair
average derived_gravity_acceleration_magnitude-STANDARD_DEV() for activity/subject pair
average derived_jerk_body_accelerationMag-STANDARD_DEV() for activity/subject pair
average time-based_body_gyroscopeMag-STANDARD_DEV() for activity/subject pair
average time-based_body_gyroscopeJerkMag-STANDARD_DEV() for activity/subject pair
average frequency-based_body_acceleration-STANDARD_DEV()-X for activity/subject pair
average frequency-based_body_acceleration-STANDARD_DEV()-Y for activity/subject pair
average frequency-based_body_acceleration-STANDARD_DEV()-Z for activity/subject pair
average frequency-based_body_accelerationJerk-STANDARD_DEV()-X for activity/subject pair
average frequency-based_body_accelerationJerk-STANDARD_DEV()-Y for activity/subject pair
average frequency-based_body_accelerationJerk-STANDARD_DEV()-Z for activity/subject pair
average frequency-based_gyroscope-STANDARD_DEV()-X for activity/subject pair
average frequency-based_gyroscope-STANDARD_DEV()-Y for activity/subject pair
average frequency-based_gyroscope-STANDARD_DEV()-Z for activity/subject pair
average frequency-based_body_accelerationMag-STANDARD_DEV() for activity/subject pair
average fBodyBodyAccJerkMag-STANDARD_DEV() for activity/subject pair
average fBodyBodyGyroMag-STANDARD_DEV() for activity/subject pair
average fBodyBodyGyroJerkMag-STANDARD_DEV() for activity/subject pair
