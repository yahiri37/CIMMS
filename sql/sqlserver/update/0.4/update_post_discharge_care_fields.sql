/*
   10 September 201209:45:07
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
CREATE TABLE dbo.Tmp_post_discharge_care
	(
	id numeric(19, 0) NOT NULL IDENTITY (1, 1),
	version numeric(19, 0) NOT NULL,
	esd_referral tinyint NULL,
	esd_referral_date datetime NULL,
	esd_referral_date_unknown tinyint NULL,
	documented_evidence varchar(50) NULL,
	documentation_post_discharge tinyint NULL,
	help_adl tinyint NULL,
	visit_unknown tinyint NULL,
	visit tinyint NULL,
	discharge_location_different tinyint NULL,
	discharged_chome_with varchar(50) NULL,
	discharged_home varchar(50) NULL,
	esd_referral_discharge tinyint NULL,
	esd_referral_date_discharge datetime NULL,
	esd_referral_date_discharge_unknown tinyint NULL,
	discharged_to varchar(50) NULL,
	stroke_specialist tinyint NULL,
	alone_post_discharge tinyint NULL,
	sheltered_accommodation tinyint NULL,
	patient_previously_resident tinyint NULL,
	temporary_or_permanent tinyint NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_post_discharge_care SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_post_discharge_care ON
GO
IF EXISTS(SELECT * FROM dbo.post_discharge_care)
	 EXEC('INSERT INTO dbo.Tmp_post_discharge_care (id, version, esd_referral, esd_referral_date, esd_referral_date_unknown, documented_evidence, documentation_post_discharge, help_adl, visit_unknown, visit, discharge_location_different, discharged_chome_with, discharged_home, esd_referral_discharge, esd_referral_date_discharge, esd_referral_date_discharge_unknown, discharged_to, stroke_specialist, patient_previously_resident, temporary_or_permanent)
		SELECT id, version, esd_referral, esd_referral_date, esd_referral_date_unknown, documented_evidence, documentation_post_discharge, help_adl, visit_unknown, visit, discharge_location_different, discharged_chome_with, discharged_home, esd_referral_discharge, esd_referral_date_discharge, esd_referral_date_discharge_unknown, discharged_to, stroke_specialist, patient_previously_resident, CONVERT(tinyint, temporary_or_perm) FROM dbo.post_discharge_care WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_post_discharge_care OFF
GO
ALTER TABLE dbo.post_discharge_support
	DROP CONSTRAINT FK43536373D4B0C4DE
GO
ALTER TABLE dbo.post_discharge_therapy
	DROP CONSTRAINT FK6170500DD4B0C4DE
GO
ALTER TABLE dbo.care_activity
	DROP CONSTRAINT FK_care_activity_post_discharge_care
GO
ALTER TABLE dbo.care_activity
	DROP CONSTRAINT FK787D8C7DD4B0C4DE
GO
DROP TABLE dbo.post_discharge_care
GO
EXECUTE sp_rename N'dbo.Tmp_post_discharge_care', N'post_discharge_care', 'OBJECT' 
GO
ALTER TABLE dbo.post_discharge_care ADD CONSTRAINT
	PK__patient___3213346536B948 PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.post_discharge_care', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.post_discharge_care', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.post_discharge_care', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
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
ALTER TABLE dbo.care_activity ADD CONSTRAINT
	FK787D8C7DD4B0C4DE FOREIGN KEY
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
select Has_Perms_By_Name(N'dbo.care_activity', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.care_activity', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.care_activity', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.post_discharge_therapy ADD CONSTRAINT
	FK6170500DD4B0C4DE FOREIGN KEY
	(
	post_discharge_care_id
	) REFERENCES dbo.post_discharge_care
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.post_discharge_therapy SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.post_discharge_therapy', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.post_discharge_therapy', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.post_discharge_therapy', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.post_discharge_support ADD CONSTRAINT
	FK43536373D4B0C4DE FOREIGN KEY
	(
	post_discharge_care_id
	) REFERENCES dbo.post_discharge_care
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.post_discharge_support SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.post_discharge_support', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.post_discharge_support', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.post_discharge_support', 'Object', 'CONTROL') as Contr_Per 