# Code Book: Human Activity Recognition Smartphones Means and Standard Deviations 

## Source Raw Data
Source raw data is obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, unzipped, and saved inside the rawdata folder. Spaces in subfolder names have been replaced by underscores to avoid excessive escaping in path expressions.

## Script
Run the *run_analysis.R* script from its directory to read raw data from the rawdata folder, perform data transformations and generate the two main output tidy data frames.

## Transformations
Measurement data is obtained from the train and test subfolders' *X_train.txt* and *X_test.txt* files respectively. Their column names are derived from the *features.txt* file. The activity column is derived from their respective *y_XXX.txt* files, and the subject column is derived from their respective *subject_XXX.txt* files. 

Activity codes have been replaced by human readable labels as defined in the *activity_labels.txt* file.

Original column names for the measurements from the raw data have been preserved. See *rawdata/UCI_HAR_Dataset/features_info.txt* for details.

## Output: means_and_stds data frame
Contains the combined training and test data for all observed subjects, activites, and their mean and standard deviation measurements. The **subject** column gives the code for each subject, and the **activity** column gives the descriptive name for the corresponding activity.

## Output: mean_summary_by_subject_activity
Contains a summary of the mean of each measurement by subject and activity. The column names for the measurements have been preserved, and as with the means_and_stds data frame, the **subject** and **activity** columns give their corresponding code and descriptive labels respectively.








