/*
   03 September 201206:28:49
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
ALTER TABLE dbo.assessment_management
	DROP CONSTRAINT FKB0801F669FD5A8F5
GO
ALTER TABLE dbo.barthel SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.barthel', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.barthel', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.barthel', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.assessment_management
	DROP CONSTRAINT FKB0801F666B9E8FF2
GO
ALTER TABLE dbo.modified_rankin SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.modified_rankin', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.modified_rankin', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.modified_rankin', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_assessment_management
	(
	id numeric(19, 0) NOT NULL IDENTITY (1, 1),
	version numeric(19, 0) NOT NULL,
	pre_admission_barthel_not_known tinyint NULL,
	baseline_barthel_not_known tinyint NULL,
	discharge_barthel_not_known tinyint NULL,
	modified_rankin_id numeric(19, 0) NULL,
	modified_rankin_not_known tinyint NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_assessment_management SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_assessment_management ON
GO
IF EXISTS(SELECT * FROM dbo.assessment_management)
	 EXEC('INSERT INTO dbo.Tmp_assessment_management (id, version, baseline_barthel_not_known, modified_rankin_id, modified_rankin_not_known)
		SELECT id, version, barthel_not_known, modified_rankin_id, modified_rankin_not_known FROM dbo.assessment_management WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_assessment_management OFF
GO
ALTER TABLE dbo.therapy_management
	DROP CONSTRAINT FK4046B5D916479FC5
GO
DROP TABLE dbo.assessment_management
GO
EXECUTE sp_rename N'dbo.Tmp_assessment_management', N'assessment_management', 'OBJECT' 
GO
ALTER TABLE dbo.assessment_management ADD CONSTRAINT
	PK__baseline__3213E83F01142BA1 PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.assessment_management ADD CONSTRAINT
	FKB0801F666B9E8FF2 FOREIGN KEY
	(
	modified_rankin_id
	) REFERENCES dbo.modified_rankin
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.assessment_management', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.assessment_management', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.assessment_management', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.therapy_management ADD CONSTRAINT
	FK4046B5D916479FC5 FOREIGN KEY
	(
	baseline_assessment_management_id
	) REFERENCES dbo.assessment_management
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.therapy_management SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.therapy_management', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.therapy_management', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.therapy_management', 'Object', 'CONTROL') as Contr_Per 