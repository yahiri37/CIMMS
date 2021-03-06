/*
   24 September 201209:15:03
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
ALTER TABLE dbo.clinical_summary ADD
	end_of_life_pathway varchar(255) NULL,
	palliative_care varchar(255) NULL,
	palliative_care_date datetime NULL
GO
ALTER TABLE dbo.clinical_summary SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.clinical_summary', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.clinical_summary', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.clinical_summary', 'Object', 'CONTROL') as Contr_Per 