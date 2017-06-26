#!/bin/bash

#save my current directory
MY_CWD = $(pwd)

#Clears staging directories
rm ~/staging/excercise_1/*
rmdir ~/staging/excercise_1
rmdir ~/staging

#remove files from HDFS
hdfs dfs -rm  /user/w205/hospital_compare/hospitals.csv 
hdfs dfs -rm  /user/w205/hospital_compare/effective_care.csv
hdfs dfs -rm  /user/w205/hospital_compare/readmissions.csv
hdfs dfs -rm  /user/w205/hospital_compare/measures.csv
hdfs dfs -rm  /user/w205/hospital_compare/surveys_responses.csv

#Remove HDFS directory
hdfs dfs -rmdir  /user/w205/hospital_compare/

#Change Directory Back to Original
cd $MY_CWD

#Clean Exit
exit
