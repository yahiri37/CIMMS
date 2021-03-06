/*
   24 February 201215:59:57
   User: 
   Server: 2740-2CE13203BP
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
ALTER TABLE dbo.occupational_therapy_management
	DROP CONSTRAINT FK702D5602CABCAA06
GO
ALTER TABLE dbo.occupational_therapy_no_assessment_reason_type SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_occupational_therapy_management
	(
	id numeric(19, 0) NOT NULL IDENTITY (1, 1),
	version numeric(19, 0) NOT NULL,
	assessment_date datetime NULL,
	assessment_time int NULL,
	assessment_performed tinyint NULL,
	no_assessment_reason_type_id numeric(19, 0) NULL,
	mood_assessment_date datetime NULL,
	mood_assessment_time int NULL,
	mood_assessment_performed varchar(255) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_occupational_therapy_management SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_occupational_therapy_management ON
GO
IF EXISTS(SELECT * FROM dbo.occupational_therapy_management)
	 EXEC('INSERT INTO dbo.Tmp_occupational_therapy_management (id, version, assessment_date, assessment_time, assessment_performed, no_assessment_reason_type_id, mood_assessment_date, mood_assessment_time, mood_assessment_performed)
		SELECT id, version, assessment_date, assessment_time, assessment_performed, no_assessment_reason_type_id, mood_assessment_date, mood_assessment_time, mood_assessment_performed FROM dbo.occupational_therapy_management WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_occupational_therapy_management OFF
GO
ALTER TABLE dbo.therapy_management
	DROP CONSTRAINT FK4046B5D9E4185627
GO
DROP TABLE dbo.occupational_therapy_management
GO
EXECUTE sp_rename N'dbo.Tmp_occupational_therapy_management', N'occupational_therapy_management', 'OBJECT' 
GO
ALTER TABLE dbo.occupational_therapy_management ADD CONSTRAINT
	PK__occupati__3213E83F5EBF139D PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.occupational_therapy_management ADD CONSTRAINT
	FK702D5602CABCAA06 FOREIGN KEY
	(
	no_assessment_reason_type_id
	) REFERENCES dbo.occupational_therapy_no_assessment_reason_type
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.therapy_management ADD CONSTRAINT
	FK4046B5D9E4185627 FOREIGN KEY
	(
	occupational_therapy_management_id
	) REFERENCES dbo.occupational_therapy_management
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.therapy_management SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
