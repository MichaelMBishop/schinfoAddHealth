##################################################################
# schinfoAddHealth.R
# Michael Metcalf Bishop, michaelbish@gmail.com

# Data Source: schinfo.xpt, Longitudinal Study of Adolescent Health
# Purpose: Some variables are given more meaningful recoding
#         
# Note: I've tried to make everything as transparent as possible, but please see
#       the codebook to be certain you understand the data
#       
# Acknowledgements: Please submit/push suggestions for improvements and I'll add your name here.
##################################################################


library(car)
library(Hmisc)
library(ggplot2)
source("J:/R/util/util.R")
attach(util)

schinfo <- sasxport.get("J:/DataAll/Schinfo.xpt") # In School Survey, Wave I, provided by Add Health

names(schinfo)

label(schinfo$grades) <- "Grade span of school"
schinfo$grades2 <- factor(schinfo$grades, labels = c("K-12", "7-8", "9-12", "7-9", "10-12", "7-12",
                                                     "grades special", "6-8", "8-12", "K-8", "6-13+",
                                                     "7-13+", "5-8", "6-9", "K-13+", "5-7"))
label(schinfo$grades2) <- "Grade span of school"

schinfo$surveydate <- as.Date(with(schinfo, paste(paste("19", schyear, sep = ""), schmonth, schday, sep = "-")))
label(schinfo$surveydate) <- "Date of inschool survey Wave 1"

schinfo$size <- factor(schinfo$size, labels = c("<125", "125-350", "351-775", "776+")) 
                # missing = duplicate schools in strata, not part of main study
label(schinfo$size) <- "High School Stratification Size"


###########################################################
### Full variable descriptions from documentation SCHINFO.PDF

# scid: School Identification Number
# inhome: Stuents from this school participated in the In-Home Interview
#           in the IN-Home Interview
# twinonly: Twin pairs only were selected from this school to participate
#           in the IN-Home Interview
# schadmw1: School completed a School Administrator Questionnaire - Wave 1
# inschool: Students from this school completed the In-School Questionnaire
# schadmw2: School completed a School Administrator Questionnaire - Wave 2
# n.roster: The number of students on the school roster
# n.inschl: Number of students who completed an In-School Questionnaire
# grades: Grade span of school
# sat.schl: All students at this school were selected for the In-Home Interview (Saturated School)
# comments: Additional information about the school
# schmonth: Month of In-School Questionnaire Administration 
# schday: Day of In-School Questionnaire Administration 
# schyear: Year of In-School Questionnaire Administration 

### Stratification variables refer to characteristics of the high school, 
###   feeder school characteristics may not be the same

# strata: High School Stratification Category
# size: High School Stratification Size, ()
# schtype: High School Stratification Type
#         (note: missing = duplicate schools in strata, not part of main study,
#                1 = public, 2 = Catholic, 3 = private)
# qpwht: High School Stratification Quartile Percentage White
# region: High School Stratification Region, 1=West, 2=Midwest, 3=South, 4=Northeast, missing = duplicate in strata

