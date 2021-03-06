/*
   13 April 201216:07:05
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
ALTER TABLE dbo.catheter_history
	DROP CONSTRAINT FK313FE943B5532281
GO
ALTER TABLE dbo.continence_management SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.continence_management', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.continence_management', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.continence_management', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.catheter_history
	DROP CONSTRAINT FK313FE94355CDF454
GO
ALTER TABLE dbo.catheter_reason_type SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.catheter_reason_type', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.catheter_reason_type', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.catheter_reason_type', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_catheter_history
	(
	id numeric(19, 0) NOT NULL IDENTITY (1, 1),
	version numeric(19, 0) NOT NULL,
	insert_date datetime NULL,
	insert_time int NULL,
	reason_id numeric(19, 0) NOT NULL,
	reason_other varchar(255) NULL,
	removal_date datetime NULL,
	removal_time int NULL,
	continence_management_id numeric(19, 0) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_catheter_history SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_catheter_history ON
GO
IF EXISTS(SELECT * FROM dbo.catheter_history)
	 EXEC('INSERT INTO dbo.Tmp_catheter_history (id, version, insert_date, insert_time, reason_id, removal_date, removal_time, continence_management_id)
		SELECT id, version, insert_date, insert_time, reason_id, removal_date, removal_time, continence_management_id FROM dbo.catheter_history WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_catheter_history OFF
GO
DROP TABLE dbo.catheter_history
GO
EXECUTE sp_rename N'dbo.Tmp_catheter_history', N'catheter_history', 'OBJECT' 
GO
ALTER TABLE dbo.catheter_history ADD CONSTRAINT
	PK__catheter__3213E83F1A14E395 PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.catheter_history ADD CONSTRAINT
	FK313FE94355CDF454 FOREIGN KEY
	(
	reason_id
	) REFERENCES dbo.catheter_reason_type
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
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
COMMIT
select Has_Perms_By_Name(N'dbo.catheter_history', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.catheter_history', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.catheter_history', 'Object', 'CONTROL') as Contr_Per 