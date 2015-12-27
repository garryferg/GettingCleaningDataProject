
# Readme

The files in this repository are described below.

## File: run_analysis.R

### Introduction

This script performs the steps required for the "Getting and Cleaning Data" Course Project.

### Prerequisties

The analysis script expects the data to be available in the current working directory in a file called "getdata_projectfiles_UCI HAR Dataset.zip". The file is unzipped into a folder called "unzipped".

### Detailed steps performed

The script performs the following steps:

 - Data is unzipped, loaded, and combined into dataframes (one for test, one for train)
 - Feature names are read from features.txt. Then used to name the dataframe columns (using make.names to avoid problems with illegal characters)
 - All features whose names did not originall contain "-mean()" or "-std()" are disgarded
 - Columns names are cleaned to make them more human readable (see Codebook.md for final names)
 - An activityLabel column is added, using labels from activity_labels.txt
 - Dply is used to group and summarize the data to produce the final result, averaged over subject and activity.
 - The final result is written to final.txt

## File: final.txt

The final results of run_analysis.R

## File: CodeBook.md

Contains description of the variables in final.txt
