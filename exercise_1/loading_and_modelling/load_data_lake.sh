#!/bin/bash

#Save my current directory
MY_CWD=$(pwd)

#Create Staging Directories
mkdir ~/staging
mkdir ~/staging/excercise_1

#Change to Staging Directory
cd ~/staging/excercise_1

#Get File From Data.Medicare.Gov
MY_URL="https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget "$MY_URL" -O medicare_data.zip

#Unzip Data
unzip medicare_data.zip

#Remove First Lines of File and Rename
tail -n +2 "Hospital General Information.csv" > hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv" > effective_care.csv
tail -n +2 "Readmissions and Deaths - Hospital.csv" > readmissions.csv
tail -n +2 "Measure Dates.csv" > measures.csv
tail -n +2 "hvbp_hcahps_05_28_2015.csv" > surveys_responses.csv

#Create_HDFS Directory
hdfs dfs -mkdir /user/w205/hospital_compare

#Create a directory for each file and copy Files to HDFS
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -put hospitals.csv /user/w205/hospital_compare/hospitals

hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -put effective_care.csv /user/w205/hospital_compare/effective_care

hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -put readmissions.csv /user/w205/hospital_compare/readmissions

hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -put measures.csv /user/w205/hospital_compare/measures

hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses
hdfs dfs -put surveys_responses.csv /user/w205/hospital_compare/surveys_responses


#Change Directory Back to Original
cd $MY_CWD

#Clean Exit
exit
