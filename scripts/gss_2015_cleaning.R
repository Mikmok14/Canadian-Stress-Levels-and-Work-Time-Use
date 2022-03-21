#### Preamble #####
#Purpose: The purpose of this code is to clean up the 2015 Canadian GSS data obtained
# from the University of Toronto library

### Workspace setup ###
#Load in required packages
library("tidyverse")
library("janitor")
library("dplyr")


#Set working directory
#Load in raw data
gss_2015_raw <-
  readr::read_csv("inputs/data/gss_raw.csv")

names(gss_2015_raw)

#selecting relevant categories for analysis
gss_2015 <-
  gss_2015_raw %>%
  select (
    agegr10,
    sex,
    marstat,
    phsdflg,
    cxr0014c,
    prv,
    gtu_110,
    gtu_130,
    sleepdur:uncodur, 
    srh_110,
    srh_115,
    srs_10,
    mss_130,
    mrw_05,
    whw_120c,
    ctw_140a,
    ctw_140b,
    ctw_140c,
    att_120,
    ctw_190,
    hhincg1,
    incg1,
    tut_970,
    whw_210
  )

#Renaming age group codes to more understandable labels
gss_2015$agegr10 [gss_2015$agegr10 == 1] <- "Ages 15 - 24"
gss_2015$agegr10 [gss_2015$agegr10 == 2] <- "Ages 25 - 34"
gss_2015$agegr10 [gss_2015$agegr10 == 3] <- "Ages 35 - 44"
gss_2015$agegr10 [gss_2015$agegr10 == 4] <- "Ages 45 - 54"
gss_2015$agegr10 [gss_2015$agegr10 == 5] <- "Ages 55 - 65"
gss_2015$agegr10 [gss_2015$agegr10 == 6] <- "Ages 65 - 74"
gss_2015$agegr10 [gss_2015$agegr10 == 7] <- "Ages 75+"
gss_2015$agegr10 [gss_2015$agegr10 == 96] <- "Valid Skip"
gss_2015$agegr10 [gss_2015$agegr10 == 97] <- "Age unknown"
gss_2015$agegr10 [gss_2015$agegr10 == 98] <- "Refusal to answer"
gss_2015$agegr10 [gss_2015$agegr10 == 99] <- "Age not stated"

#Renaming gender of respondent code to more understandable label
gss_2015$sex [gss_2015$sex == 1] <- "Male"
gss_2015$sex [gss_2015$sex == 2] <- "Female"
gss_2015$sex [gss_2015$sex == 6] <- "Valid Skip"
gss_2015$sex [gss_2015$sex == 7] <- "Sex unknown"
gss_2015$sex [gss_2015$sex == 8] <- "Refusal to answer"
gss_2015$sex [gss_2015$sex == 9] <- "Sex not stated"

#Renaming marital status code to more understandable labels
gss_2015$marstat [gss_2015$marstat == 1] <- "Married"
gss_2015$marstat [gss_2015$marstat == 2] <- "Common-law partners"
gss_2015$marstat [gss_2015$marstat == 3] <- "Widowed"
gss_2015$marstat [gss_2015$marstat == 4] <- "Separated"
gss_2015$marstat [gss_2015$marstat == 5] <- "Divorced"
gss_2015$marstat [gss_2015$marstat == 6] <- "Single and never married"
gss_2015$marstat [gss_2015$marstat == 96] <- "Valid skip"
gss_2015$marstat [gss_2015$marstat == 97] <- "Don't know"
gss_2015$marstat [gss_2015$marstat == 98] <- "Refusal to answer"
gss_2015$marstat [gss_2015$marstat == 99] <- "Answer not stated"

#Renaming living with spouse code to more understandable labels
gss_2015$phsdflg [gss_2015$phsdflg == 1] <- "Living with spouse"
gss_2015$phsdflg [gss_2015$phsdflg == 2] <- "Not living with spouse"
gss_2015$phsdflg [gss_2015$phsdflg == 6] <- "Valid skip"
gss_2015$phsdflg [gss_2015$phsdflg == 8] <- "Refusal to answer"
gss_2015$phsdflg [gss_2015$phsdflg == 9] <- "Answer not stated"

#Renaming Number of children 0-14 in household code to more understandable labels
gss_2015$cxr0014c [gss_2015$cxr0014c == 0] <- "No children"
gss_2015$cxr0014c [gss_2015$cxr0014c == 1] <- "One child"
gss_2015$cxr0014c [gss_2015$cxr0014c == 2] <- "Two children"
gss_2015$cxr0014c [gss_2015$cxr0014c == 3] <- "Three children"
gss_2015$cxr0014c [gss_2015$cxr0014c == 4] <- "Four or more children"
gss_2015$cxr0014c [gss_2015$cxr0014c == 6] <- "Valid skip"
gss_2015$cxr0014c [gss_2015$cxr0014c == 7] <- "Don't know"
gss_2015$cxr0014c [gss_2015$cxr0014c == 8] <- "Refusal to answer"
gss_2015$cxr0014c [gss_2015$cxr0014c == 9] <- "Answer not stated"

#Renaming province of residence code to more understandable labels
gss_2015$prv [gss_2015$prv == 10] <- "Newfoundland and Labroador"
gss_2015$prv [gss_2015$prv == 11] <- "Prince Edward Island"
gss_2015$prv [gss_2015$prv == 12] <- "Nova Scotia"
gss_2015$prv [gss_2015$prv == 13] <- "New Brunswick"
gss_2015$prv [gss_2015$prv == 24] <- "Quebec"
gss_2015$prv [gss_2015$prv == 35] <- "Ontario"
gss_2015$prv [gss_2015$prv == 46] <- "Manitoba"
gss_2015$prv [gss_2015$prv == 47] <- "Saskatchewan"
gss_2015$prv [gss_2015$prv == 48] <- "Alberta"
gss_2015$prv [gss_2015$prv == 59] <- "British Columbia"
gss_2015$prv [gss_2015$prv == 96] <- "Valid skip"
gss_2015$prv [gss_2015$prv == 97] <- "Don't know"
gss_2015$prv [gss_2015$prv == 98] <- "Refusal to answer"
gss_2015$prv [gss_2015$prv == 99] <- "Answer not stated"

#Renaming 'feeling rushed' code to more understandable labels
gss_2015$gtu_110 [gss_2015$gtu_110 == 1] <- "Every day"
gss_2015$gtu_110 [gss_2015$gtu_110 == 2] <- "A few times a week"
gss_2015$gtu_110 [gss_2015$gtu_110 == 3] <- "Once a week"
gss_2015$gtu_110 [gss_2015$gtu_110 == 4] <- "Once a month"
gss_2015$gtu_110 [gss_2015$gtu_110 == 5] <- "Less than once a month"
gss_2015$gtu_110 [gss_2015$gtu_110 == 6] <- "Never"
gss_2015$gtu_110 [gss_2015$gtu_110 == 96] <- "Valid skip"
gss_2015$gtu_110 [gss_2015$gtu_110 == 97] <- "Don't know"
gss_2015$gtu_110 [gss_2015$gtu_110 == 98] <- "Refusal to answer"
gss_2015$gtu_110 [gss_2015$gtu_110 == 99] <- "Answer not stated" 

#Renaming 'extra time' code to more understandable labels
gss_2015$gtu_130 [gss_2015$gtu_130 == 1] <- "Every day"
gss_2015$gtu_130 [gss_2015$gtu_130 == 2] <- "A few times a week"
gss_2015$gtu_130 [gss_2015$gtu_130 == 3] <- "Once a week"
gss_2015$gtu_130 [gss_2015$gtu_130 == 4] <- "Once a month"
gss_2015$gtu_130 [gss_2015$gtu_130 == 5] <- "Less than once a month"
gss_2015$gtu_130 [gss_2015$gtu_130 == 6] <- "Never"
gss_2015$gtu_130 [gss_2015$gtu_130 == 96] <- "Valid skip"
gss_2015$gtu_130 [gss_2015$gtu_130 == 97] <- "Don't know"
gss_2015$gtu_130 [gss_2015$gtu_130 == 98] <- "Refusal to answer"
gss_2015$gtu_130 [gss_2015$gtu_130 == 99] <- "Answer not stated"

#Renaming sleep duration to ______ duration code to more understandable labels
gss_2015[ , 9:32][gss_2015[ , 9:32] == 9996] <- "Valid skip"
gss_2015[ , 9:32][gss_2015[ , 9:32] == 9997] <- "Don't know"
gss_2015[ , 9:32][gss_2015[ , 9:32] == 9998] <- "Refusal to answer"
gss_2015[ , 9:32][gss_2015[ , 9:32] == 9999] <- "Answer not stated"

#Renaming self-rated health and mental health codes to more understandable labels
gss_2015$srh_110 <- as.character(gss_2015$srh_110)
gss_2015$srh_115 <- as.character(gss_2015$srh_115)
gss_2015[ , 33:34][gss_2015[ , 33:34] == 1] <- "Excellent"
gss_2015[ , 33:34][gss_2015[ , 33:34] == 2] <- "Very good"
gss_2015[ , 33:34][gss_2015[ , 33:34] == 3] <- "Good"
gss_2015[ , 33:34][gss_2015[ , 33:34] == 4] <- "Fair"
gss_2015[ , 33:34][gss_2015[ , 33:34] == 5] <- "Poor"
gss_2015[ , 33:34][gss_2015[ , 33:34] == 6] <- "Valid skip"
gss_2015[ , 33:34][gss_2015[ , 33:34] == 7] <- "Don't know"
gss_2015[ , 33:34][gss_2015[ , 33:34] == 8] <- "Refusal to answer"
gss_2015[ , 33:34][gss_2015[ , 33:34] == 9] <- "Answer not stated"

#Renaming self-rated stress codes to more understandable labels
gss_2015$srs_10 [gss_2015$srs_10 == 1] <- "Not stress at all"
gss_2015$srs_10 [gss_2015$srs_10 == 2] <- "Not very stressful"
gss_2015$srs_10 [gss_2015$srs_10 == 3] <- "A bit stressful"
gss_2015$srs_10 [gss_2015$srs_10 == 4] <- "Quite a bit stressful"
gss_2015$srs_10 [gss_2015$srs_10 == 5] <- "Extremely stressful"
gss_2015$srs_10 [gss_2015$srs_10 == 6] <- "Valid Skip"
gss_2015$srs_10 [gss_2015$srs_10 == 7] <- "Don't know"
gss_2015$srs_10 [gss_2015$srs_10 == 8] <- "Refusal to answer"
gss_2015$srs_10 [gss_2015$srs_10 == 9] <- "Answer not stated"

#Renaming source of stress codes to more understandable labels
gss_2015$mss_130 [gss_2015$mss_130 == 1] <- "Work"
gss_2015$mss_130 [gss_2015$mss_130 == 2] <- "Financial concerns"
gss_2015$mss_130 [gss_2015$mss_130 == 3] <- "Family"
gss_2015$mss_130 [gss_2015$mss_130 == 4] <- "School work"
gss_2015$mss_130 [gss_2015$mss_130 == 5] <- "Not enough time"
gss_2015$mss_130 [gss_2015$mss_130 == 6] <- "Health"
gss_2015$mss_130 [gss_2015$mss_130 == 7] <- "Other"
gss_2015$mss_130 [gss_2015$mss_130 == 96] <- "Valid skip"
gss_2015$mss_130 [gss_2015$mss_130 == 97] <- "Don't know"
gss_2015$mss_130 [gss_2015$mss_130 == 98] <- "Refusal to answer"
gss_2015$mss_130 [gss_2015$mss_130 == 99] <- "Answer not stated"

#Renaming main activity in the last 12 months codes to more understandable labels
gss_2015$mrw_05 [gss_2015$mrw_05 == 1] <- "Working at paid job or business"
gss_2015$mrw_05 [gss_2015$mrw_05 == 2] <- "Looking for paid work"
gss_2015$mrw_05 [gss_2015$mrw_05 == 3] <- "Going to school"
gss_2015$mrw_05 [gss_2015$mrw_05 == 4] <- "Caring for children"
gss_2015$mrw_05 [gss_2015$mrw_05 == 5] <- "Household work"
gss_2015$mrw_05 [gss_2015$mrw_05 == 6] <- "Retired"
gss_2015$mrw_05 [gss_2015$mrw_05 == 7] <- "Maternity/Paternity or parental leave"
gss_2015$mrw_05 [gss_2015$mrw_05 == 8] <- "Long-term illness"
gss_2015$mrw_05 [gss_2015$mrw_05 == 9] <- "Volunteering or care-giving exlcluding children"
gss_2015$mrw_05 [gss_2015$mrw_05 == 10] <- "Other"
gss_2015$mrw_05 [gss_2015$mrw_05 == 96] <- "Valid skip"
gss_2015$mrw_05 [gss_2015$mrw_05 == 97] <- "Don't know"
gss_2015$mrw_05 [gss_2015$mrw_05 == 98] <- "Refusal to answer"
gss_2015$mrw_05 [gss_2015$mrw_05 == 99] <- "Answer not stated"

#Renaming hours worked per week at job codes to more understandable labels
gss_2015$whw_120c [gss_2015$whw_120c == 100.0] <- "100 hours or more"
gss_2015$whw_120c [gss_2015$whw_120c == 999.6] <- "Valid skip"
gss_2015$whw_120c [gss_2015$whw_120c == 999.7] <- "Don't know"
gss_2015$whw_120c [gss_2015$whw_120c == 999.8] <- "Refusal to answer"
gss_2015$whw_120c [gss_2015$whw_120c == 999.9] <- "Answer not stated"

#Renaming commute to work / school - Car, truck, or van - as driver codes to more understandable labels
gss_2015$ctw_140a [gss_2015$ctw_140a == 1] <- "yes"
gss_2015$ctw_140a [gss_2015$ctw_140a == 2] <- "No"
gss_2015$ctw_140a [gss_2015$ctw_140a == 6] <- "Valid skip"
gss_2015$ctw_140a [gss_2015$ctw_140a == 7] <- "Don't know"
gss_2015$ctw_140a [gss_2015$ctw_140a == 8] <- "Refusal to answer"
gss_2015$ctw_140a [gss_2015$ctw_140a == 9] <- "Answer not stated"

#Renaming commute to work / school - Car, truck, or van - as passenger codes to more understandable labels
gss_2015$ctw_140b [gss_2015$ctw_140b == 1] <- "Yes"
gss_2015$ctw_140b [gss_2015$ctw_140b == 2] <- "No"
gss_2015$ctw_140b [gss_2015$ctw_140b == 6] <- "Valid skip"
gss_2015$ctw_140b [gss_2015$ctw_140b == 7] <- "Don't know"
gss_2015$ctw_140b [gss_2015$ctw_140b == 8] <- "Refusal to answer"
gss_2015$ctw_140b [gss_2015$ctw_140b == 9] <- "Answer not stated"

#Renaming commute to work / school - public transit - codes to more understandable labels
gss_2015$ctw_140c [gss_2015$ctw_140c == 1] <- "Yes"
gss_2015$ctw_140c [gss_2015$ctw_140c == 2] <- "No"
gss_2015$ctw_140c [gss_2015$ctw_140c == 6] <- "Valid skip"
gss_2015$ctw_140c [gss_2015$ctw_140c == 8] <- "Refusal to answer"
gss_2015$ctw_140c [gss_2015$ctw_140c == 9] <- "Answer not stated"

#Renaming access to transportation codes to more understandable labels
gss_2015$att_120 [gss_2015$att_120 == 1] <- "Always"
gss_2015$att_120 [gss_2015$att_120 == 2] <- "Sometimes"
gss_2015$att_120 [gss_2015$att_120 == 3] <- "Rarely"
gss_2015$att_120 [gss_2015$att_120 == 4] <- "Never"
gss_2015$att_120 [gss_2015$att_120 == 6] <- "Valid skip"
gss_2015$att_120 [gss_2015$att_120 == 7] <- "Don't know"
gss_2015$att_120 [gss_2015$att_120 == 8] <- "Refusal to answer"
gss_2015$att_120 [gss_2015$att_120 == 9] <- "Answer not stated"

#Renaming weekly traffic congestion on commute codes to more understandable labels
gss_2015$ctw_190 [gss_2015$ctw_190 == 1] <- "Everyday"
gss_2015$ctw_190 [gss_2015$ctw_190 == 2] <- "3 - 4 days"
gss_2015$ctw_190 [gss_2015$ctw_190 == 3] <- "1 - 2 days"
gss_2015$ctw_190 [gss_2015$ctw_190 == 4] <- "Never"
gss_2015$ctw_190 [gss_2015$ctw_190 == 6] <- "Valid skip"
gss_2015$ctw_190 [gss_2015$ctw_190 == 7] <- "Don't know"
gss_2015$ctw_190 [gss_2015$ctw_190 == 8] <- "Refusal to answer"
gss_2015$ctw_190 [gss_2015$ctw_190 == 9] <- "Answer not stated"

#Renaming household income group codes to more understandable labels
gss_2015$hhincg1 [gss_2015$hhincg1 == 1] <- "Less than $20,000"
gss_2015$hhincg1 [gss_2015$hhincg1 == 2] <- "$20,000 - $39,999"
gss_2015$hhincg1 [gss_2015$hhincg1 == 3] <- "$40,000 - $59,999"
gss_2015$hhincg1 [gss_2015$hhincg1 == 4] <- "$60,000 - $79,999"
gss_2015$hhincg1 [gss_2015$hhincg1 == 5] <- "$80,000 - $99,999"
gss_2015$hhincg1 [gss_2015$hhincg1 == 6] <- "$100,000 - $119,999"
gss_2015$hhincg1 [gss_2015$hhincg1 == 7] <- "$120,000 - $139,999"
gss_2015$hhincg1 [gss_2015$hhincg1 == 8] <- "$140,000 or more"
gss_2015$hhincg1 [gss_2015$hhincg1 == 96] <- "Valid skip"
gss_2015$hhincg1 [gss_2015$hhincg1 == 97] <- "Don't know"
gss_2015$hhincg1 [gss_2015$hhincg1 == 98] <- "Refusal to answer"
gss_2015$hhincg1 [gss_2015$hhincg1 == 99] <- "Answer not stated"

#Renaming personal income group codes to more understandable labels
gss_2015$incg1 [gss_2015$incg1 == 1] <- "Less than $20,000"
gss_2015$incg1 [gss_2015$incg1 == 2] <- "$20,000 - $39,999"
gss_2015$incg1 [gss_2015$incg1 == 3] <- "$40,000 - $59,999"
gss_2015$incg1 [gss_2015$incg1 == 4] <- "$60,000 - $79,999"
gss_2015$incg1 [gss_2015$incg1 == 5] <- "$80,000 - $99,999"
gss_2015$incg1 [gss_2015$incg1 == 6] <- "$100,000 - $119,999"
gss_2015$incg1 [gss_2015$incg1 == 7] <- "$120,000 or more"
gss_2015$incg1 [gss_2015$incg1 == 96] <- "Valid skip"
gss_2015$incg1 [gss_2015$incg1 == 97] <- "Don't know"
gss_2015$incg1 [gss_2015$incg1 == 98] <- "Refusal to answer"
gss_2015$incg1 [gss_2015$incg1 == 99] <- "Answer not stated"

#Renaming similarity of reference day to most days codes to more understandable labels
gss_2015$tut_970 [gss_2015$tut_970 == 1] <- "Yes"
gss_2015$tut_970 [gss_2015$tut_970 == 2] <- "No"
gss_2015$tut_970 [gss_2015$tut_970 == 6] <- "Valid skip"
gss_2015$tut_970 [gss_2015$tut_970 == 7] <- "Don't know"
gss_2015$tut_970 [gss_2015$tut_970 == 8] <- "Refusal to answer"
gss_2015$tut_970 [gss_2015$tut_970 == 9] <- "Answer not stated"

#Renaming number of days worked per week codes to more understandable labels
gss_2015$whw_210 [gss_2015$whw_210 == 96] <- "Valid skip"
gss_2015$whw_210 [gss_2015$whw_210 == 97] <- "Don't know"
gss_2015$whw_210 [gss_2015$whw_210 == 98] <- "Refusal to answer"
gss_2015$whw_210 [gss_2015$whw_210 == 99] <- "Answer not stated"

#Renaming column titles to more understandable labels
gss_2015 <-
  gss_2015 %>%
    rename(
      "Age group" = agegr10,
      "Sex" = sex,
      "Marital Status" = marstat,
      "Living with spouse" = phsdflg,
      "Children 0-14 in house" = cxr0014c,
      "Province of residence" = prv,
      "Feel rushed" = gtu_110,
      "Extra time" = gtu_130,
      "Time spent in bed" = sleepdur,
      "Time spent on personal activities" = persdur,
      "Time spent on paid work" = pdwkdur,
      "Time spent looking for paid work" = lkwkdur,
      "Time spent studying or learning" = schldur,
      "Time spent on chores" = hswkdur,
      "Time spent caring for children" = chlddur,
      "Time spent caring for adults" = adltdur,
      "Time spent helping other households" = ohhldur,
      "Time spent shopping for goods/services" = shopdur,
      "Time spent on civic/religious/organizational activities" = civicdur,
      "Time spent at events (sport, cinema, museum, other)" = eventdur,
      "Time spent doing sports activities" = sprtsdur,
      "Time spent on active leisure" = actldur,
      "Time spent socializing in person" = socprdur,
      "Time spent socializing digitally" = soctcdur,
      "Time spent watching tv or videos" = tvdur,
      "Time spent reading" = readdur,
      "Time spent on passive leisure" = othldur,
      "Time spent on transportation" = transdur,
      "Time spent on break or lunch" = breakdur,
      "Time spent eating or drinking" = mealsdur,
      "Time spent on other activities" = otherdur,
      "Tune spent on uncodable activity" = uncodur,
      "Self-rated health" = srh_110,
      "Self-rated mental health" = srh_115,
      "Self-rated stress level" = srs_10,
      "Main source of stress" = mss_130,
      "Main activity past 12 months" = mrw_05,
      "Hours worked/week at job" = whw_120c,
      "Drive to work/school" = ctw_140a,
      "Get driven to work/school" = ctw_140b,
      "Take public transportation to work/school" = ctw_140c,
      "Access to transportation" = att_120,
      "Traffic congestion commuting to work" = ctw_190,
      "Household income bracket" = hhincg1,
      "Respondant income bracket" = incg1,
      "Reference day different from most?" = tut_970,
      "Days worked per week" = whw_210
    )

save(gss_2015, file = "outputs/Rdata/gss_2015.rda")

#Isolating self-reported source of stress
source_stress <-
  gss_2015 %>%
  select(`Main source of stress`
         )

source_stress<-
  source_stress[source_stress$`Main source of stress` != "Valid skip",]

source_stress <- tabyl(source_stress$`Main source of stress`, sort = TRUE) 
source_stress$percent <- source_stress$percent*100

source_stress <-
  source_stress %>%
  rename("Number of answers" = `n`,
         "Percentage of answers" = `percent`,
         "Main Stress Source" = "source_stress$`Main source of stress`")

save(source_stress, file = "outputs/Rdata/source_stress.rda")


#Isolating male and female  data
male_gss <- 
  gss_2015[gss_2015$Sex == "Male",]

female_gss <-
  gss_2015[gss_2015$Sex == "Female",]

save(male_gss, file = "outputs/Rdata/male_gss.rda")
save(female_gss, file = "outputs/Rdata/female_gss.rda")

#Isolating province of residence and stress
province_stress <-
  gss_2015 %>%
  select (`Province of residence`,
          `Self-rated stress level`
          )

province_stress_percent <- data.frame("Stress level" = c("Not stressed at all",
                                                         "Not very stressful",
                                                         "A bit stressful",
                                                         "Quite a bit stressful",
                                                         "Extremely stressful", 
                                                         "Refusal to answer",
                                                         "Answer not stated", 
                                                         "Don't know"),
                                      "Ontario" = (province_stress %>%
                                                     filter(`Province of residence` == "Ontario") |>
                                                     select(`Self-rated stress level`) |>
                                                     tabyl(`Self-rated stress level`) |>
                                                     select(`percent`) |>
                                                     rename("Ontario" = `percent`)
                                                   ),
                                      "Quebec" = (province_stress %>%
                                                    filter(`Province of residence` == "Quebec") |>
                                                    select(`Self-rated stress level`) |>
                                                    tabyl(`Self-rated stress level`) |>
                                                    select(`percent`) |>
                                                    rename("Quebec" = `percent`)
                                                  ),
                                      "British Columbia" = (province_stress %>%
                                                    filter(`Province of residence` == "British Columbia") |>
                                                    select(`Self-rated stress level`) |>
                                                    tabyl(`Self-rated stress level`) |>
                                                    select(`percent`) |>
                                                    rename("British Columbia" = `percent`)
                                                  ),
                                      "Alberta" = (province_stress %>%
                                                              filter(`Province of residence` == "Alberta") |>
                                                              select(`Self-rated stress level`) |>
                                                              tabyl(`Self-rated stress level`) |>
                                                              select(`percent`) |>
                                                              rename("Alberta" = `percent`)
                                                  ),
                                      "Manitoba" = (province_stress %>%
                                                              filter(`Province of residence` == "Manitoba") |>
                                                              select(`Self-rated stress level`) |>
                                                              tabyl(`Self-rated stress level`) |>
                                                              select(`percent`) |>
                                                              rename("Manitoba" = `percent`)
                                                  ),
                                      "New Brunswick" = (province_stress %>%
                                                      filter(`Province of residence` == "New Brunswick") |>
                                                      select(`Self-rated stress level`) |>
                                                      tabyl(`Self-rated stress level`) |>
                                                      select(`percent`) |>
                                                      rename("New Brunswick" = `percent`)
                                                  ),
                                      "Newfoundland and Labroador" = (province_stress %>%
                                                           filter(`Province of residence` == "Newfoundland and Labroador") |>
                                                           select(`Self-rated stress level`) |>
                                                           tabyl(`Self-rated stress level`) |>
                                                           select(`percent`) |>
                                                             add_row()|>
                                                           rename("Newfoundland and Labroador" = `percent`)
                                                  ),
                                      "Nova Scotia" = (province_stress %>%
                                                         filter(`Province of residence` == "Nova Scotia") |>
                                                         select(`Self-rated stress level`) |>
                                                         tabyl(`Self-rated stress level`) |>
                                                         select(`percent`) |>
                                                         rename("Nova Scotia" = `percent`)
                                                  ),
                                      "Prince Edward Island" = (province_stress %>%
                                                                  filter(`Province of residence` == "Prince Edward Island") |>
                                                                  select(`Self-rated stress level`) |>
                                                                  tabyl(`Self-rated stress level`) |>
                                                                  select(`percent`) |>
                                                                  add_row() |>
                                                                  rename("Prince Edward Island" = `percent`)
                                                  ),
                                      "Saskatchewan" = (province_stress %>%
                                                          filter(`Province of residence` == "Saskatchewan") |>
                                                          select(`Self-rated stress level`) |>
                                                          tabyl(`Self-rated stress level`) |>
                                                          select(`percent`) |>
                                                          rename("Saskatchewan" = `percent`)
                                                  )
                                      )

province_stress_percent$Ontario <- province_stress_percent$Ontario*100
province_stress_percent$Quebec <- province_stress_percent$Quebec*100
province_stress_percent$British.Columbia <- province_stress_percent$British.Columbia*100
province_stress_percent$Alberta <- province_stress_percent$Alberta*100
province_stress_percent$Manitoba <- province_stress_percent$Manitoba*100
province_stress_percent$New.Brunswick <- province_stress_percent$New.Brunswick*100
province_stress_percent$Newfoundland.and.Labroador <- province_stress_percent$Newfoundland.and.Labroador*100
province_stress_percent$Nova.Scotia <- province_stress_percent$Nova.Scotia*100
province_stress_percent$Prince.Edward.Island <- province_stress_percent$Prince.Edward.Island*100
province_stress_percent$Saskatchewan <- province_stress_percent$Saskatchewan*100

province_stress_percent <-
  province_stress_percent %>%
  rename("Stress level" = Stress.level,
         "British Columbia" = British.Columbia,
         "New Brunswick" = New.Brunswick,
         "Newfoundland and Labroador" = Newfoundland.and.Labroador,
         "Nova Soctia" = Nova.Scotia,
         "PEI" = Prince.Edward.Island)

save(province_stress_percent, file = "outputs/Rdata/province_stress_percent.rda")

#Cleaning data for provincial stress level graphs
province <- c("Ontario", "Quebec", "BC", "Alberta", "Manitoba", "New Brunswick", "Newfoundland", "Nova Scotia", "PEI", "Saskatchewan")
nostress <- c(37.8, 34.3, 35.3, 38.8, 41.9, 35.1, 35.3, 37.7, 36.5, 37.4)
extremestress <- c(17.5, 22.4, 20.3, 16.6, 17.9, 24.3, 23.2, 20.6, 20.4, 18.1)

pvsg <- data.frame(province, nostress, extremestress)
save(pvsg, file = "outputs/Rdata/pvsg.rda")

#Traffic and stress levels
traffic_stress <-
  gss_2015 %>%
  select(`Self-rated stress level`,
         `Traffic congestion commuting to work`)

trafficorder <- c("Not stress at all", 
                  "Not very stressful", 
                  "A bit stressful", 
                  "Quite a bit stressful", 
                  "Extremely stressful", 
                  "Don't know")

traffic_freq0 <-
  traffic_stress %>%
  filter(`Traffic congestion commuting to work` == "Never")

traffic_freq0 <-
  tabyl(traffic_freq0$`Self-rated stress level`) |>
  rename("Self-rated stress level" = "traffic_freq0$`Self-rated stress level`",
         "Number of answers" = `n`)

traffic_freq0$percent <- traffic_freq0$percent*100
traffic_freq0["Frequency of traffic"] <- "Never"

traffic_freq0

traffic_freq0 <-
  traffic_freq0 %>%
  slice(match(trafficorder, `Self-rated stress level`))

traffic_freq1 <-
  traffic_stress %>%
  filter(`Traffic congestion commuting to work` == "1 - 2 days")

traffic_freq1 <-
  tabyl(traffic_freq1$`Self-rated stress level`) |>
  rename("Self-rated stress level" = "traffic_freq1$`Self-rated stress level`",
         "Number of answers" = `n`)

traffic_freq1$percent <- traffic_freq1$percent*100
traffic_freq1["Frequency of traffic"] <- "1 - 2 days"

traffic_freq1 <-
  traffic_freq1 %>%
  slice(match(trafficorder, `Self-rated stress level`))

traffic_freq2 <-
  traffic_stress %>%
  filter(`Traffic congestion commuting to work` == "3 - 4 days")

traffic_freq2 <-
  tabyl(traffic_freq2$`Self-rated stress level`) |>
  rename("Self-rated stress level" = "traffic_freq2$`Self-rated stress level`",
         "Number of answers" = `n`)

traffic_freq2$percent <- traffic_freq2$percent*100
traffic_freq2["Frequency of traffic"] <- "3 - 4 days"

traffic_freq2 <-
  traffic_freq2 %>%
  slice(match(trafficorder, `Self-rated stress level`))

traffic_freq3 <-
  traffic_stress %>%
  filter(`Traffic congestion commuting to work` == "Everyday")


traffic_freq3 <-
  tabyl(traffic_freq3$`Self-rated stress level`) |>
  rename("Self-rated stress level" = "traffic_freq3$`Self-rated stress level`",
         "Number of answers" = `n`)

traffic_freq3$percent <- traffic_freq3$percent*100
traffic_freq3["Frequency of traffic"] <- "Everyday"

traffic_freq3 <-
  traffic_freq3 %>%
  slice(match(trafficorder, `Self-rated stress level`))

traffic_fig <- bind_rows(traffic_freq0, traffic_freq1, traffic_freq2, traffic_freq3)

traffic_fig <- 
  traffic_fig[!(traffic_fig$`Self-rated stress level` == "Answer not stated" | 
                  traffic_fig$`Self-rated stress level` == "Don't know" | 
                  traffic_fig$`Self-rated stress level` == "Refusal to answer"),]

save(traffic_fig, file = "outputs/Rdata/traffic_fig.rda")
save(traffic_freq0, file = "outputs/Rdata/traffic_freq0.rda")
save(traffic_freq1, file = "outputs/Rdata/traffic_freq1.rda")
save(traffic_freq2, file = "outputs/Rdata/traffic_freq2.rda")
save(traffic_freq3, file = "outputs/Rdata/traffic_freq3.rda")

#Cleaning hours worked per week data


hours_worked <- 
  gss_2015 %>%
  select(`Hours worked/week at job`, `Self-rated stress level`)

hours_worked <-
  hours_worked[!grepl("Valid skip", hours_worked$`Hours worked/week at job`),]
hours_worked <-
  hours_worked[!grepl("Don't know", hours_worked$`Hours worked/week at job`),]
hours_worked <-
  hours_worked[!grepl("Answer not stated", hours_worked$`Hours worked/week at job`),]

hours_worked0 <-
  hours_worked %>%
  filter(`Self-rated stress level` == "Not stress at all")

hours_worked0[hours_worked0 == "100 hours or more"] <- "100"
hours_worked0<-
  transform(hours_worked0, `Hours worked/week at job` = as.numeric(`Hours worked/week at job`))


hours_worked1 <-
  hours_worked %>%
  filter(`Self-rated stress level` == "Not very stressful")

hours_worked1[hours_worked1 == "100 hours or more"] <- "100"
hours_worked1<-
  transform(hours_worked1, `Hours worked/week at job` = as.numeric(`Hours worked/week at job`))


hours_worked2 <-
  hours_worked %>%
  filter(`Self-rated stress level` == "A bit stressful")

hours_worked2[hours_worked2 == "100 hours or more"] <- "100"
hours_worked2<-
  transform(hours_worked2, `Hours worked/week at job` = as.numeric(`Hours worked/week at job`))


hours_worked3 <-
  hours_worked %>%
  filter(`Self-rated stress level` == "Quite a bit stressful")

hours_worked3[hours_worked3 == "100 hours or more"] <- "100"
hours_worked3<-
  transform(hours_worked3, `Hours worked/week at job` = as.numeric(`Hours worked/week at job`))


hours_worked4 <-
  hours_worked %>%
  filter(`Self-rated stress level` == "Extremely stressful")

hours_worked4[hours_worked4 == "100 hours or more"] <- "100"
hours_worked4<-
  transform(hours_worked4, `Hours worked/week at job` = as.numeric(`Hours worked/week at job`))

hours_workedper <-
  data.frame("Stress level" = c("Not stressed at all", 
                                "Not very stressful",
                                "A bit stressful",
                                "Quite a bit stressful",
                                "Extremely stressful"),
             "Average hours worked" = c(mean(hours_worked0$Hours.worked.week.at.job),
                                        mean(hours_worked1$Hours.worked.week.at.job),
                                        mean(hours_worked2$Hours.worked.week.at.job),
                                        mean(hours_worked3$Hours.worked.week.at.job),
                                        mean(hours_worked4$Hours.worked.week.at.job)
                                        )
             )
hours_workedper <- 
  hours_workedper %>%
  rename("Average hours worked" = Average.hours.worked,
         "Stress level" = Stress.level)

save(hours_workedper, file = "outputs/Rdata/hours_workedper.rda")

#Cleaning days worked per week data
days_worked <-
  gss_2015 %>%
  select(`Self-rated stress level`, `Days worked per week`)

days_worked <-
  days_worked[!grepl("Valid skip", days_worked$`Days worked per week`),]
days_worked <-
  days_worked[!grepl("Don't know", days_worked$`Days worked per week`),]
days_worked<-
  days_worked[!grepl("Answer not stated", days_worked$`Days worked per week`),]
days_worked <-
  days_worked[!grepl("Refusal to answer", days_worked$`Days worked per week`),]

days_worked <-
  transform(days_worked, `Days worked per week` = as.numeric(`Days worked per week`))

days_worked <-
  days_worked %>%
  rename("Days worked per week" = Days.worked.per.week,
         "Self-rated stress level" = Self.rated.stress.level)


days_worked0 <- 
  days_worked %>%
  filter(`Self-rated stress level` == "Not stress at all")

days_worked1 <-
  days_worked %>%
  filter(`Self-rated stress level` == "Not very stressful")

days_worked2 <-
  days_worked %>%
  filter(`Self-rated stress level` == "A bit stressful")

days_worked3 <-
  days_worked %>%
  filter(`Self-rated stress level` == "Quite a bit stressful")

days_worked4 <-
  days_worked %>%
  filter(`Self-rated stress level` == "Extremely stressful")

days_workedper <-
  data.frame("Stress level" = c("Not stressed at all",
                                "Not very stressful",
                                "A bit stressful",
                                "Quite a bit stressful",
                                "Extremely stressful"),
             "Average days worked" = c(mean(days_worked0$`Days worked per week`),
                                       mean(days_worked1$`Days worked per week`),
                                       mean(days_worked2$`Days worked per week`),
                                       mean(days_worked3$`Days worked per week`),
                                       mean(days_worked4$`Days worked per week`)
                                       )
             )
days_workedper <-
  days_workedper %>%
  rename("Stress level" = Stress.level,
         "Average days worked" = Average.days.worked)

save(days_workedper, file = "outputs/Rdata/days_workedper.rda")
save(days_worked, file = "outputs/Rdata/days_worked.rda")

#Cleaning time spent in transportation data
transport_hours <- 
  gss_2015 %>%
  select(`Self-rated stress level`, `Time spent on transportation`)

transport_hours <-
  transform(transport_hours, `Time spent on transportation` = as.numeric(`Time spent on transportation`))

transport_hours <-
  transport_hours %>%
  rename("Self-rated stress level" = Self.rated.stress.level,
         "Time spent in transportation" = Time.spent.on.transportation)


transport_hours0 <-
  transport_hours %>%
  filter(`Self-rated stress level` == "Not stress at all")


transport_hours1 <-
  transport_hours %>%
  filter(`Self-rated stress level` == "Not very stressful")

transport_hours2 <-
  transport_hours %>%
  filter(`Self-rated stress level` == "A bit stressful")

transport_hours3 <-
  transport_hours %>%
  filter(`Self-rated stress level` == "Quite a bit stressful")

transport_hours4 <-
  transport_hours %>%
  filter(`Self-rated stress level` == "Extremely stressful")


transport_hoursper <-
  data.frame("Stress level" = c("Not stressed at all",
                                "Not very stressful",
                                "A bit stressful",
                                "Quite a bit stressful",
                                "Extremely stressful"),
             "Average time in transportation" = c(mean(transport_hours0$`Time spent in transportation`),
                                                  mean(transport_hours1$`Time spent in transportation`),
                                                  mean(transport_hours2$`Time spent in transportation`),
                                                  mean(transport_hours3$`Time spent in transportation`),
                                                  mean(transport_hours4$`Time spent in transportation`)
                                                  )
  )


transport_hoursper <-
  transport_hoursper %>%
  rename("Stress level" = Stress.level,
         "Average time in transportation (mins)" = Average.time.in.transportation)

save(transport_hoursper, file = "outputs/Rdata/transport_hoursper.rda")
save(transport_hours, file = "outputs/Rdata/transport_hours.rda")



