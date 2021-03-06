
Update  care_activity 
set start_date =  convert(datetime,CONVERT(VARCHAR(10),start_date,111) + ' 00:00:00',111)
WHERE datepart(hh,start_date) > 0

Update  care_activity 
set end_date =  convert(datetime,CONVERT(VARCHAR(10),end_date,111) + ' 00:00:00',111)
WHERE datepart(hh,end_date) > 0

Update clinical_assessment
set swallow_screen_date =  convert(datetime,CONVERT(VARCHAR(10),swallow_screen_date,111) + ' 00:00:00',111)
WHERE datepart(hh,swallow_screen_date) > 0

Update continence_management
set continence_plan_date =  convert(datetime,CONVERT(VARCHAR(10),continence_plan_date,111) + ' 00:00:00',111)
WHERE datepart(hh,continence_plan_date) > 0



Update catheter_history
set insert_date =  convert(datetime,CONVERT(VARCHAR(10),insert_date,111) + ' 00:00:00',111)
WHERE datepart(hh,insert_date) > 0

Update catheter_history
set removal_date =  convert(datetime,CONVERT(VARCHAR(10),removal_date,111) + ' 00:00:00',111)
WHERE datepart(hh,removal_date) > 0


Update  nutrition_management 
set date_screened =  convert(datetime,CONVERT(VARCHAR(10),date_screened,111) + ' 00:00:00',111)
WHERE datepart(hh,date_screened) > 0


Update  nutrition_management 
set dietitian_referral_date =  convert(datetime,CONVERT(VARCHAR(10),dietitian_referral_date,111) + ' 00:00:00',111)
WHERE datepart(hh,dietitian_referral_date) > 0



Update  evaluation 
set date_evaluated =  convert(datetime,CONVERT(VARCHAR(10),date_evaluated,111) + ' 00:00:00',111)
WHERE datepart(hh,date_evaluated) > 0


Update  glasgow_coma_score 
set date_assessed =  convert(datetime,CONVERT(VARCHAR(10),date_assessed,111) + ' 00:00:00',111)
WHERE datepart(hh,date_assessed) > 0

Update  medical_history 
set onset_date =  convert(datetime,CONVERT(VARCHAR(10),onset_date,111) + ' 00:00:00',111)
WHERE datepart(hh,onset_date) > 0

Update observation
set date_made =  convert(datetime,CONVERT(VARCHAR(10),date_made,111) + ' 00:00:00',111)
WHERE datepart(hh,date_made) > 0

Update occupational_therapy_management
set assessment_date =  convert(datetime,CONVERT(VARCHAR(10),assessment_date,111) + ' 00:00:00',111)
WHERE datepart(hh,assessment_date) > 0

Update occupational_therapy_management
set mood_assessment_date =  convert(datetime,CONVERT(VARCHAR(10),mood_assessment_date,111) + ' 00:00:00',111)
WHERE datepart(hh,mood_assessment_date) > 0


Update physiotherapy_management
set assessment_date =  convert(datetime,CONVERT(VARCHAR(10),assessment_date,111) + ' 00:00:00',111)
WHERE datepart(hh,assessment_date) > 0

Update scan
set request_date =  convert(datetime,CONVERT(VARCHAR(10),request_date,111) + ' 00:00:00',111)
WHERE datepart(hh,request_date) > 0


Update scan
set taken_date =  convert(datetime,CONVERT(VARCHAR(10),taken_date,111) + ' 00:00:00',111)
WHERE datepart(hh,taken_date) > 0

Update speech_and_language_therapy_management
set  communication_assessment_date =  convert(datetime,CONVERT(VARCHAR(10),communication_assessment_date,111) + ' 00:00:00',111)
WHERE datepart(hh,communication_assessment_date) > 0


Update speech_and_language_therapy_management
set  swallowing_assessment_date =  convert(datetime,CONVERT(VARCHAR(10),swallowing_assessment_date,111) + ' 00:00:00',111)
WHERE datepart(hh,swallowing_assessment_date) > 0


Update therapy_management
set  cognitive_status_assessment_date =  convert(datetime,CONVERT(VARCHAR(10),cognitive_status_assessment_date,111) + ' 00:00:00',111)
WHERE datepart(hh,cognitive_status_assessment_date) > 0


Update therapy_management
set  rehab_goals_set_date =  convert(datetime,CONVERT(VARCHAR(10),rehab_goals_set_date,111) + ' 00:00:00',111)
WHERE datepart(hh,rehab_goals_set_date) > 0


Update thrombolysis
set  thrombolysis_date =  convert(datetime,CONVERT(VARCHAR(10),thrombolysis_date,111) + ' 00:00:00',111)
WHERE datepart(hh,thrombolysis_date) > 0

Update thrombolysis
set  follow_up_scan_date =  convert(datetime,CONVERT(VARCHAR(10),follow_up_scan_date,111) + ' 00:00:00',111)
WHERE datepart(hh,follow_up_scan_date) > 0

Update treatment
set  start_date =  convert(datetime,CONVERT(VARCHAR(10),start_date,111) + ' 00:00:00',111)
WHERE datepart(hh,start_date) > 0

Update treatment
set  end_date =  convert(datetime,CONVERT(VARCHAR(10),end_date,111) + ' 00:00:00',111)
WHERE datepart(hh,end_date) > 0


