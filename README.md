# CleaningData-Project
This is the week 4 project from the Coursera course "Getting and Cleaning Data".

This analysis runs on the data obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

To run the analysis, place the file `run_analysis.R` inside the 'UCI HAR Dataset' directory and use that as a working directory.  
'UCI HAR Dataset' should contain two additional directories labeled 'test' and 'train'.  

- `run_analysis.R`: Gathers the UCI HAR Dataset and retrieves all the standard deviation and average variables.  
These variables are then grouped by Activity and Subject and reported back as averages.  The resulting tidy dataset is `tidyData.txt`.

- `CodeBook.md`: Describes the variables, data, and transformations performed on the UCI HAR Dataset.
