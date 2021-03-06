/*
   18 April 201212:23:14
   User: 
   Server: D630-G2SLT3J
   Database: stroke
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.post_discharge_care SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.care_activity
	DROP CONSTRAINT FK_care_activity_patient_life_style
GO
ALTER TABLE dbo.patient_life_style SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.care_activity
	DROP CONSTRAINT FK_care_activity_care_activity2
GO
ALTER TABLE dbo.care_activity
	DROP CONSTRAINT FK_care_activity_care_activity1
GO
ALTER TABLE dbo.care_activity ADD CONSTRAINT
	FK_care_activity_post_discharge_care FOREIGN KEY
	(
	post_discharge_care_id
	) REFERENCES dbo.post_discharge_care
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.care_activity SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
