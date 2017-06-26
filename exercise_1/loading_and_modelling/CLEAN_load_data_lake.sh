#!/bin/bash

#save my current directory
MY_CWD=$(pwd)

#Clears staging directories
rm ~/staging/excercise_1/*
rmdir ~/staging/excercise_1
rmdir ~/staging

#remove files from HDFS
hdfs dfs -rm  /user/w205/hospital_compare/hospitals/hospitals.csv 
hdfs dfs -rm  /user/w205/hospital_compare/effective_care/effective_care.csv
hdfs dfs -rm  /user/w205/hospital_compare/readmissions/readmissions.csv
hdfs dfs -rm  /user/w205/hospital_compare/measures/measures.csv
hdfs dfs -rm  /user/w205/hospital_compare/surveys_responses/surveys_responses.csv

#Remove HDFS directory
hdfs dfs -rmdir  /user/w205/hospital_compare/hospitals/
hdfs dfs -rmdir  /user/w205/hospital_compare/effective_care/
hdfs dfs -rmdir  /user/w205/hospital_compare/readmissions/
hdfs dfs -rmdir  /user/w205/hospital_compare/measures/
hdfs dfs -rmdir  /user/w205/hospital_compare/surveys_responses/
hdfs dfs -rmdir  /user/w205/hospital_compare/

#Change Directory Back to Original
cd $MY_CWD

#Clean Exit
exit
