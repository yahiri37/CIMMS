/*
   12 September 201210:04:23
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
ALTER TABLE dbo.continence_management
	DROP CONSTRAINT FK5E30DD808D00E9B
GO
ALTER TABLE dbo.no_continence_plan_reason_type SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.no_continence_plan_reason_type', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.no_continence_plan_reason_type', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.no_continence_plan_reason_type', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_continence_management
	(
	id numeric(19, 0) NOT NULL IDENTITY (1, 1),
	version numeric(19, 0) NOT NULL,
	prior_catheter tinyint NOT NULL,
	newly_incontinent tinyint NOT NULL,
	catheterised_since_admission tinyint NOT NULL,
	inappropriate_for_continence_plan tinyint NULL,
	has_continence_plan tinyint NULL,
	continence_plan_date datetime NULL,
	continence_plan_time int NULL,
	no_continence_plan_reason_id numeric(19, 0) NULL,
	no_continence_plan_reason_other varchar(255) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_continence_management SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_continence_management ON
GO
IF EXISTS(SELECT * FROM dbo.continence_management)
	 EXEC('INSERT INTO dbo.Tmp_continence_management (id, version, prior_catheter, newly_incontinent, catheterised_since_admission, has_continence_plan, continence_plan_date, continence_plan_time, no_continence_plan_reason_id, no_continence_plan_reason_other)
		SELECT id, version, prior_catheter, newly_incontinent, catheterised_since_admission, has_continence_plan, continence_plan_date, continence_plan_time, no_continence_plan_reason_id, no_continence_plan_reason_other FROM dbo.continence_management WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_continence_management OFF
GO
ALTER TABLE dbo.catheter_history
	DROP CONSTRAINT FK313FE943B5532281
GO
ALTER TABLE dbo.care_activity
	DROP CONSTRAINT FK787D8C7DB5532281
GO
DROP TABLE dbo.continence_management
GO
EXECUTE sp_rename N'dbo.Tmp_continence_management', N'continence_management', 'OBJECT' 
GO
ALTER TABLE dbo.continence_management ADD CONSTRAINT
	PK__continen__3213E83F164452B1 PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.continence_management ADD CONSTRAINT
	FK5E30DD808D00E9B FOREIGN KEY
	(
	no_continence_plan_reason_id
	) REFERENCES dbo.no_continence_plan_reason_type
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.continence_management', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.continence_management', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.continence_management', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.care_activity ADD CONSTRAINT
	FK787D8C7DB5532281 FOREIGN KEY
	(
	continence_management_id
	) REFERENCES dbo.continence_management
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.care_activity SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.care_activity', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.care_activity', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.care_activity', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.catheter_history ADD CONSTRAINT
	FK313FE943B5532281 FOREIGN KEY
	(
	continence_management_id
	) REFERENCES dbo.continence_management
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.catheter_history SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.catheter_history', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.catheter_history', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.catheter_history', 'Object', 'CONTROL') as Contr_Per 