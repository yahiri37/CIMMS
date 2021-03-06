/****** Script for SelectTopNRows command from SSMS  ******/
UPDATE nutrition_management
SET must_score=0 
WHERE id in (
	SELECT
	nutrition_management.id
	  FROM patient_proxy
	  JOIN care_activity on (care_activity.patient_id=patient_proxy.id)
	  join nutrition_management ON (care_activity.nutrition_management_id = nutrition_management.id)
	  where date_screened IS NOT NULL)
  