USE [stroke]
GO
/****** Object:  User [stroke_app]    Script Date: 07/22/2013 16:35:03 ******/
CREATE USER [stroke_app] FOR LOGIN [stroke_app] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[propertyParser]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[propertyParser](@properties varchar(max), @propName varchar(32))
RETURNS VARCHAR(1)
AS
BEGIN
	DECLARE @start INT, @end INT, @length INT, @propValue varchar(255), @propPat varchar(34)
	SET @propPat = '%' + @propName + '%'
	SET @propValue = ''
	SET @start = PATINDEX(@propPat, @properties)
	IF @start > 0
	BEGIN
		SET @end = @start + LEN(@propName)
		SET @start = @end +1 
	    SET @propValue = SUBSTRING(@properties,@start,4)
	END
	RETURN 
		CASE 
			WHEN @propValue = 'true' THEN '1'
			ELSE '0'
		END
END
GO
/****** Object:  Table [dbo].[post_discharge_therapy_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[post_discharge_therapy_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[observation_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[observation_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ethnicity_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ethnicity_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[post_discharge_support_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[post_discharge_support_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[post_discharge_care]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[post_discharge_care](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[esd_referral] [tinyint] NULL,
	[esd_referral_date] [datetime] NULL,
	[esd_referral_date_unknown] [tinyint] NULL,
	[documented_evidence] [varchar](50) NULL,
	[documentation_post_discharge] [tinyint] NULL,
	[number_of_social_service_visits_unknown] [tinyint] NULL,
	[number_of_social_service_visits] [tinyint] NULL,
	[discharged_to] [varchar](50) NULL,
	[stroke_specialist] [tinyint] NULL,
	[alone_post_discharge] [tinyint] NULL,
	[sheltered_accommodation] [tinyint] NULL,
	[patient_previously_resident] [tinyint] NULL,
	[temporary_or_permanent] [varchar](50) NULL,
	[alone_post_discharge_unknown] [tinyint] NULL,
	[support_on_discharge_needed] [varchar](255) NULL,
	[ssnap_participation_consent] [varchar](16) NULL,
	[new_care_team] [varchar](8) NULL,
	[end_of_life_pathway] [varchar](255) NULL,
	[palliative_care] [varchar](255) NULL,
	[palliative_care_date] [datetime] NULL,
 CONSTRAINT [PK__patient___3213346536B948] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[physiotherapy_no_assessment_reason_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[physiotherapy_no_assessment_reason_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[medication_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[medication_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[no_swallow_screen_performed_reason_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[no_swallow_screen_performed_reason_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[no_scan_reason_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[no_scan_reason_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[no_continence_plan_reason_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[no_continence_plan_reason_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[patient_proxy]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[patient_proxy](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[nhs_number] [varchar](255) NULL,
	[hospital_number] [varchar](255) NULL,
	[district_number] [varchar](255) NULL,
	[surname] [varchar](255) NULL,
	[forename] [varchar](255) NULL,
	[gender] [varchar](255) NULL,
	[ethnicity] [varchar](255) NULL,
	[date_of_birth] [datetime] NULL,
	[date_of_death] [datetime] NULL,
	[postcode] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[patient_life_style]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[patient_life_style](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[lived_alone_pre_admission] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pathway_stage]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pathway_stage](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pathological_event_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pathological_event_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAS]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAS](
	[spell_id] [varchar](255) NOT NULL,
	[S1NHSNumber] [varchar](10) NULL,
	[S1NoNHSNumber] [varchar](1) NULL,
	[S1Surname] [varchar](30) NULL,
	[S1Forename] [varchar](30) NULL,
	[S1BirthDate] [date] NULL,
	[S1AgeOnArrival] [tinyint] NULL,
	[S1Gender] [varchar](1) NULL,
	[S1PostcodeOut] [varchar](4) NULL,
	[S1PostcodeIn] [varchar](3) NULL,
	[S1Ethnicity] [varchar](2) NULL,
	[S1OnsetInHospital] [varchar](1) NULL,
	[S1ArriveByAmbulance] [varchar](1) NULL,
	[S1AmbulanceTrust] [varchar](4) NULL,
	[S1CadNumber] [varchar](255) NULL,
	[S1CadNumberNK] [varchar](1) NULL,
	[S1FirstArrivalDateTime] [datetime] NULL,
	[S1FirstArrivalTimeNotEntered] [varchar](1) NULL,
	[S1FirstWard] [varchar](4) NULL,
	[S1FirstStrokeUnitArrivalDateTime] [datetime] NULL,
	[S1FirstStrokeUnitArrivalTimeNotEntered] [varchar](1) NULL,
	[S1FirstStrokeUnitArrivalNA] [varchar](1) NULL,
	[S2NihssArrival] [varchar](2) NULL,
	[S4ArrivalDateTime] [datetime] NULL,
	[S4ArrivalTimeNotEntered] [varchar](1) NULL,
	[S4FirstWard] [varchar](4) NULL,
	[S4StrokeUnitArrivalDateTime] [datetime] NULL,
	[S4StrokeUnitArrivalTimeNotEntered] [varchar](1) NULL,
	[S4StrokeUnitArrivalNA] [varchar](255) NULL,
	[S7DeathDate] [date] NULL,
	[S7StrokeUnitDeath] [varchar](1) NULL,
	[S7TransferHospitalCode] [varchar](40) NULL,
	[S7TransferTeamCode] [varchar](40) NULL,
	[S7StrokeUnitDischargeDateTime] [datetime] NULL,
	[S7StrokeUnitDischargeTimeNotEntered] [varchar](1) NULL,
	[S7HospitalDischargeDateTime] [datetime] NULL,
	[S7HospitalDischargeTimeNotEntered] [varchar](1) NULL,
	[S8FollowUp] [varchar](2) NULL,
	[S8FollowUpDate] [date] NULL,
	[S8FollowUpType] [varchar](2) NULL,
	[S8FollowUpBy] [varchar](2) NULL,
	[S8FollowUpByOther] [varchar](30) NULL,
	[S8FollowUpPIConsent] [varchar](2) NULL,
	[S8MoodBehaviourCognitiveScreened] [varchar](2) NULL,
	[S8MoodBehaviourCognitiveSupportNeeded] [varchar](1) NULL,
	[S8MoodBehaviourCognitivePsychologicalSupport] [varchar](2) NULL,
	[S8Living] [varchar](2) NULL,
	[S8LivingOther] [varchar](30) NULL,
	[S8Rankin6Month] [varchar](1) NULL,
	[S8PersistentAtrialFibrillation] [varchar](1) NULL,
	[S8TakingAntiplateletDrug] [varchar](1) NULL,
	[S8TakingAnticoagulent] [varchar](1) NULL,
	[S8TakingLipidLowering] [varchar](1) NULL,
	[S8TakingAntihypertensive] [varchar](1) NULL,
	[S8SinceStrokeAnotherStroke] [varchar](1) NULL,
	[S8SinceStrokeMyocardialInfarction] [varchar](1) NULL,
	[S8SinceStrokeOtherHospitalisationIllness] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[spell_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[occupational_therapy_no_assessment_reason_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[occupational_therapy_no_assessment_reason_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[swallowing_no_assessment_reason_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[swallowing_no_assessment_reason_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[staff_role]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[staff_role](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[admission_point]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admission_point](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[treatment_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[treatment_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[compulsory] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[thrombolysis]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[thrombolysis](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[thrombolysis_date] [datetime] NOT NULL,
	[complications] [tinyint] NOT NULL,
	[thrombolysis_time] [int] NOT NULL,
	[complication_type] [varchar](255) NULL,
	[complication_type_other_text] [varchar](255) NULL,
	[complication_type_bleed] [tinyint] NULL,
	[complication_type_haemorrhage] [tinyint] NULL,
	[complication_type_oedema] [tinyint] NULL,
	[complication_type_other] [tinyint] NULL,
	[decision_maker_grade] [varchar](255) NULL,
	[decision_maker_location] [varchar](255) NULL,
	[decision_maker_speciality] [varchar](255) NULL,
	[decision_maker_speciality_other] [varchar](255) NULL,
	[follow_up_scan] [tinyint] NOT NULL,
	[follow_up_scan_date] [datetime] NULL,
	[follow_up_scan_time] [int] NULL,
	[door_to_needle_time] [int] NULL,
	[nihss_score_at24hours] [int] NULL,
	[nihss_score_at24hours_unknown] [tinyint] NULL,
 CONSTRAINT [PK__thrombol__3213E83F0C85DE4D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[zeroOrOne]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[zeroOrOne](@value1 varchar(255))
RETURNS VARCHAR(1)
AS
BEGIN
	RETURN 
	CASE 
		WHEN ISNULL(@value1,'false') = 'false' THEN '0'
		ELSE '1'
	END
END
GO
/****** Object:  UserDefinedFunction [dbo].[yesOrNo]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[yesOrNo](@value1 varchar(255), @value2 varchar(255))
RETURNS VARCHAR(1)
AS
BEGIN
	RETURN 
	CASE 
		WHEN @value1 = @value2 THEN 'Y'
		ELSE 'N'
	END
END
GO
/****** Object:  UserDefinedFunction [dbo].[withinHours]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[withinHours](@startDate DATETIME,@startTime INT, @endDate DATETIME,@endTime INT, @timeWindow INT )
RETURNS INT
AS
BEGIN
	DECLARE @begin DATETIME
	DECLARE @end DATETIME
	DECLARE @duration DATETIME
	DECLARE @timeWindowMinutes INT
	
	SET	@begin = DATEADD(minute, @startTime, @startDate)
	SET @end = DATEADD(minute, @endTime, @endDate)
	SET @timeWindowMinutes = @timeWindow * 60
	
	RETURN 
		CASE 
			WHEN DATEDIFF(minute, @begin, @end) > @timeWindowMinutes THEN 0	
			ELSE 1
		END
END
GO
/****** Object:  UserDefinedFunction [dbo].[withinDays]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[withinDays](@theDate1 DATETIME,@theTime1 INT,@theDate2 DATETIME,@theTime2 INT,  @numberOfDays INT)
RETURNS TINYINT
AS
BEGIN
	RETURN 
		CASE 
			WHEN DATEADD (day, @numberOfDays, DATEADD(minute, @theTime2, ISNULL(@theDate2,0)))  > DATEADD(minute, @theTime1, ISNULL(@theDate1,0))
			THEN 1
			ELSE 0
		END
END
GO
/****** Object:  Table [dbo].[site]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[site](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[site_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SchemaVersion]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SchemaVersion](
	[versionNumber] [varchar](10) NOT NULL,
	[comment] [varchar](255) NULL,
	[dateCreated] [datetime] NULL,
	[isCurrent] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[versionNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ssnap_report]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ssnap_report](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[creation_date] [datetime] NOT NULL,
	[sent_to_ssnap] [tinyint] NOT NULL,
	[ssnap_upload_status] [tinyint] NOT NULL,
	[ssnap_upload_time] [datetime] NULL,
	[report_type] [varchar](10) NOT NULL,
	[allow_overwrite] [tinyint] NOT NULL,
	[report_name] [varchar](64) NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rehab_goals_not_set_reason_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rehab_goals_not_set_reason_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[risk_factor_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[risk_factor_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[residence_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[residence_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[care_activity_care_activity_properties]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[care_activity_care_activity_properties](
	[care_activity_properties] [numeric](19, 0) NULL,
	[care_activity_properties_idx] [varchar](255) NULL,
	[care_activity_properties_elt] [varchar](max) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[communication_no_assessment_reason_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[communication_no_assessment_reason_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cognitive_status_no_assessment_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cognitive_status_no_assessment_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cimss_user_role]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cimss_user_role](
	[role_id] [numeric](19, 0) NOT NULL,
	[user_id] [numeric](19, 0) NOT NULL,
 CONSTRAINT [PK_CMURL_160613] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cimss_user]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cimss_user](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[account_expired] [tinyint] NOT NULL,
	[account_locked] [tinyint] NOT NULL,
	[enabled] [tinyint] NOT NULL,
	[password] [varchar](255) NOT NULL,
	[password_expired] [tinyint] NOT NULL,
	[username] [varchar](255) NOT NULL,
	[first_name] [varchar](64) NULL,
	[surname] [varchar](64) NULL,
 CONSTRAINT [PK_CMU_120613] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cimss_role]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cimss_role](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[authority] [varchar](255) NOT NULL,
 CONSTRAINT [PK__CRO_120613] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[catheter_reason_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[catheter_reason_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clinical_classification_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clinical_classification_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ambulance_trust_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ambulance_trust_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](64) NOT NULL,
	[code] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[audit_record_log]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[audit_record_log](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[actor] [varchar](255) NULL,
	[date_created] [datetime] NOT NULL,
	[entity_name] [varchar](255) NULL,
	[event_name] [varchar](255) NULL,
	[field_values] [text] NULL,
	[last_updated] [datetime] NOT NULL,
	[persisted_object_id] [varchar](255) NULL,
	[persisted_object_version] [numeric](19, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[audit_field_log]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[audit_field_log](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[actor] [varchar](255) NULL,
	[date_created] [datetime] NOT NULL,
	[entity_name] [varchar](255) NULL,
	[event_name] [varchar](255) NULL,
	[last_updated] [datetime] NOT NULL,
	[new_value] [text] NULL,
	[old_value] [text] NULL,
	[persisted_object_id] [varchar](255) NULL,
	[persisted_object_version] [numeric](19, 0) NULL,
	[property_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[assessment_management]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assessment_management](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[pre_admission_barthel_not_known] [tinyint] NULL,
	[baseline_barthel_not_known] [tinyint] NULL,
	[discharge_barthel_not_known] [tinyint] NULL,
	[pre_admission_modified_rankin_not_known] [tinyint] NULL,
	[baseline_modified_rankin_not_known] [tinyint] NULL,
	[discharge_modified_rankin_not_known] [tinyint] NULL,
 CONSTRAINT [PK__baseline__3213E83F01142BA1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[makeDateTime]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[makeDateTime](@theDate DATETIME,@theTime INT )
RETURNS VARCHAR(16)
AS
BEGIN
	RETURN
		CONVERT (CHAR(10), @theDate, 103)
		+ ' ' +
		CONVERT(CHAR(5), DATEADD(minute, ISNULL(@theTime,0), ISNULL(@theDate,0)), 114)
END
GO
/****** Object:  Table [dbo].[level_of_consciousness]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[level_of_consciousness](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[isBefore]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[isBefore](@theDate1 DATETIME,@theTime1 INT,@theDate2 DATETIME,@theTime2 INT)
RETURNS TINYINT
AS
BEGIN
	RETURN 
		CASE 
			WHEN DATEADD(minute, @theTime1, ISNULL(@theDate1,0)) < DATEADD(minute, @theTime2, ISNULL(@theDate2,0))
			THEN 1
			ELSE 0
		END
END
GO
/****** Object:  Table [dbo].[investigation_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[investigation_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[intervention]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[intervention](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inadequate_nutrition_reason_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[inadequate_nutrition_reason_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[inadequate_fluid_reason_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[inadequate_fluid_reason_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[image_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[image_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[identifier_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[identifier_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[icd10code]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[icd10code](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[code] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[glasgow_coma_score]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[glasgow_coma_score](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[date_assessed] [datetime] NULL,
	[time_assessed] [int] NULL,
	[eye_score] [int] NULL,
	[motor_score] [int] NULL,
	[verbal_score] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[getNoSwallowScreenCode]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getNoSwallowScreenCode](@cimms_noswallow_desc varchar(255) )
RETURNS VARCHAR(2)
AS
BEGIN
	
	RETURN 
		CASE 
			WHEN @cimms_noswallow_desc = 'impaired' THEN ''
			WHEN @cimms_noswallow_desc = 'unknown' THEN 'NK'
			WHEN @cimms_noswallow_desc = 'palliative' THEN ''
			WHEN @cimms_noswallow_desc = 'refused' THEN 'PR'
			WHEN @cimms_noswallow_desc = 'unwell' THEN 'PU'
			WHEN @cimms_noswallow_desc = 'noproblem' THEN ''
			WHEN @cimms_noswallow_desc = 'organisational' THEN 'OR'
			ELSE ''
		END
END
GO
/****** Object:  Table [dbo].[general_practitioner]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[general_practitioner](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[address] [varchar](255) NULL,
	[name] [varchar](255) NOT NULL,
	[postcode] [varchar](255) NULL,
	[practice] [varchar](255) NULL,
	[surname] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[general_medical_practitioner]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[general_medical_practitioner](
	[code] [varchar](255) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[practiceCode] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[general_medical_practice]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[general_medical_practice](
	[code] [varchar](255) NOT NULL,
	[addressLine1] [varchar](255) NOT NULL,
	[addressLine2] [varchar](255) NOT NULL,
	[addressLine3] [varchar](255) NOT NULL,
	[addressLine4] [varchar](255) NOT NULL,
	[addressLine5] [varchar](255) NOT NULL,
	[postcode] [varchar](255) NOT NULL,
	[practiceName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[gender_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[gender_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[comorbidity_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comorbidity_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[diagnosis_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[diagnosis_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[diagnosis_category_type]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[diagnosis_category_type](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[user_role]    Script Date: 07/22/2013 16:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[user_role]
AS
SELECT     *
FROM         users.dbo.user_role
GO
/****** Object:  Table [dbo].[continence_management]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[continence_management](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[prior_catheter] [tinyint] NOT NULL,
	[newly_incontinent] [tinyint] NOT NULL,
	[catheterised_since_admission] [tinyint] NOT NULL,
	[inappropriate_for_continence_plan] [tinyint] NULL,
	[has_continence_plan] [tinyint] NULL,
	[continence_plan_date] [datetime] NULL,
	[continence_plan_time] [int] NULL,
	[no_continence_plan_reason_id] [numeric](19, 0) NULL,
	[no_continence_plan_reason_other] [varchar](255) NULL,
 CONSTRAINT [PK__continen__3213E83F164452B1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[fluid_management]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[fluid_management](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[litre_plus_at24] [varchar](255) NULL,
	[inadequate_at24fluid_reason_type_id] [numeric](19, 0) NULL,
	[inadequate_at24reason_other] [varchar](255) NULL,
	[litre_plus_at48] [varchar](255) NULL,
	[inadequate_at48fluid_reason_type_id] [numeric](19, 0) NULL,
	[inadequate_at48reason_other] [varchar](255) NULL,
	[litre_plus_at72] [varchar](255) NULL,
	[inadequate_at72fluid_reason_type_id] [numeric](19, 0) NULL,
	[inadequate_at72reason_other] [varchar](255) NULL,
 CONSTRAINT [PK__fluid_ma__3213E83F571DF1D5] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clinical_summary]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clinical_summary](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[new_pneumonia] [varchar](255) NULL,
	[urinary_tract_infection] [varchar](255) NULL,
	[worst_level_of_consciousness_id] [numeric](19, 0) NULL,
	[end_of_life_pathway] [varchar](255) NULL,
	[palliative_care] [varchar](255) NULL,
	[palliative_care_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[care_activity_property_randomised_trial]    Script Date: 07/22/2013 16:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
This view is used because the data for the field - 'has the patient been enrolled into a randomised stroke trial'
can be yes, no, or nothing / null.
Using a view leads to using a join to allow null values to be returned to account for
when value is neither yes or no for inRandomisedTrial.

When you use a normal join using care_activity_care_activity_properties table, the 'where' clause at the end leads to 
filtering no data because there is no data for Randomised Stroke Trial, so use above method instead
*/

create view [dbo].[care_activity_property_randomised_trial] as

select care_activity_properties, care_activity_properties_elt
from care_activity_care_activity_properties
where care_activity_properties_idx = 'inRandomisedTrial'
GO
/****** Object:  Table [dbo].[identifier]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[identifier](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[reference] [varchar](255) NOT NULL,
	[type_id] [numeric](19, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[arrival]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arrival](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[ambulance_trust_id] [numeric](19, 0) NULL,
	[arrive_by_ambulance] [tinyint] NULL,
	[cad_number] [numeric](19, 0) NULL,
	[cad_number_unknown] [tinyint] NULL,
	[outcome_questionnair_opt_out] [tinyint] NULL,
	[transferred_from_another_hospital] [tinyint] NULL,
	[this_hospital_arrival_date] [datetime] NULL,
	[this_hospital_arrival_time] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[barthel]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[barthel](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[bathing] [int] NULL,
	[bladder] [int] NULL,
	[bowels] [int] NULL,
	[dressing] [int] NULL,
	[feeding] [int] NULL,
	[grooming] [int] NULL,
	[manual_total] [int] NULL,
	[mobility] [int] NULL,
	[stairs] [int] NULL,
	[toilet] [int] NULL,
	[transfer] [int] NULL,
	[assessment_management_id] [numeric](19, 0) NULL,
	[barthel_assessments_idx] [int] NULL,
	[pathway_stage_id] [numeric](19, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[app_user]    Script Date: 07/22/2013 16:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[app_user]
AS
SELECT     *
FROM         users.dbo.app_user
GO
/****** Object:  Table [dbo].[clinical_assessment]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clinical_assessment](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[facial_weakness] [tinyint] NULL,
	[facial_palsy] [varchar](50) NULL,
	[face_sensory_loss] [varchar](50) NULL,
	[left_face_affected] [tinyint] NULL,
	[right_face_affected] [tinyint] NULL,
	[neither_face_affected] [tinyint] NULL,
	[arm_mrc_scale] [int] NULL,
	[left_arm_mrc_scale] [int] NULL,
	[right_arm_mrc_scale] [int] NULL,
	[arm_sensory_loss] [varchar](255) NULL,
	[left_arm_affected] [tinyint] NULL,
	[right_arm_affected] [tinyint] NULL,
	[neither_arm_affected] [tinyint] NULL,
	[dominant_hand] [varchar](50) NULL,
	[leg_mrc_scale] [int] NULL,
	[left_leg_mrc_scale] [int] NULL,
	[right_leg_mrc_scale] [int] NULL,
	[leg_sensory_loss] [varchar](255) NULL,
	[left_leg_affected] [tinyint] NULL,
	[right_leg_affected] [tinyint] NULL,
	[neither_leg_affected] [tinyint] NULL,
	[left_side_affected] [tinyint] NULL,
	[right_side_affected] [tinyint] NULL,
	[neither_side_affected] [tinyint] NULL,
	[sensory_loss] [varchar](255) NULL,
	[dysarthria] [varchar](255) NULL,
	[aphasia] [varchar](255) NULL,
	[hemianopia] [varchar](255) NULL,
	[inattention] [varchar](255) NULL,
	[other] [varchar](255) NULL,
	[other_text] [varchar](255) NULL,
	[limb_ataxia] [varchar](255) NULL,
	[independent] [varchar](255) NULL,
	[walk_at_presentation] [tinyint] NULL,
	[mobile_pre_stroke] [tinyint] NULL,
	[swallow_screen_performed] [tinyint] NULL,
	[swallow_screen_date] [datetime] NULL,
	[swallow_screen_time] [int] NULL,
	[no_swallow_screen_performed_reason_id] [numeric](19, 0) NULL,
	[classification_id] [numeric](19, 0) NULL,
	[glasgow_coma_score_id] [numeric](19, 0) NULL,
	[best_gaze] [varchar](255) NULL,
	[loc_questions] [varchar](255) NULL,
	[loc_stimulation] [varchar](255) NULL,
	[loc_tasks] [varchar](255) NULL,
	[no_swallow_screen_performed_reason_at4hours_id] [numeric](19, 0) NULL,
 CONSTRAINT [PK__clinical__3213E83F07020F21] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[request_map]    Script Date: 07/22/2013 16:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[request_map]
AS
SELECT     *
FROM         users.dbo.request_map
GO
/****** Object:  View [dbo].[role]    Script Date: 07/22/2013 16:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[role]
AS
SELECT     *
FROM         users.dbo.role
GO
/****** Object:  Table [dbo].[speech_and_language_therapy_management]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[speech_and_language_therapy_management](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[communication_assessment_date] [datetime] NULL,
	[communication_assessment_time] [int] NULL,
	[communication_assessment_performed] [tinyint] NULL,
	[no_communication_assessment_reason_type_id] [numeric](19, 0) NULL,
	[swallowing_assessment_date] [datetime] NULL,
	[swallowing_assessment_time] [int] NULL,
	[swallowing_assessment_performed] [tinyint] NULL,
	[no_swallowing_assessment_reason_type_id] [numeric](19, 0) NULL,
	[days_of_therapy] [int] NULL,
	[minutes_of_therapy] [int] NULL,
	[therapy_required] [tinyint] NULL,
	[communication_assessment_performed_in72hrs] [tinyint] NULL,
	[no72hr_communication_assessment_reason_type_id] [numeric](19, 0) NULL,
	[no72hr_swallowing_assessment_reason_type_id] [numeric](19, 0) NULL,
	[swallowing_assessment_performed_in72hrs] [tinyint] NULL,
 CONSTRAINT [PK__speech_a__3213E83F66603565] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scan]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[scan](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[request_date] [datetime] NULL,
	[request_time] [int] NULL,
	[taken_date] [datetime] NULL,
	[taken_time] [int] NULL,
	[diagnosis_type_id] [numeric](19, 0) NULL,
	[diagnosis_type_other] [varchar](255) NULL,
	[image_type_id] [numeric](19, 0) NULL,
	[taken_override] [tinyint] NULL,
	[diagnosis_category_id] [numeric](19, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ssnap_upload_transaction]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ssnap_upload_transaction](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[report_id] [numeric](19, 0) NOT NULL,
	[tx_date] [datetime] NOT NULL,
	[tx_type] [tinyint] NOT NULL,
	[succeeded] [tinyint] NOT NULL,
	[diagnostic_mesg] [varchar](180) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ssnap_report_record]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ssnap_report_record](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[report_id] [numeric](19, 0) NOT NULL,
	[hospital_stay_id] [varchar](255) NOT NULL,
	[hsi_version] [numeric](19, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ward]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ward](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[site_id] [numeric](19, 0) NOT NULL,
	[ward_name] [varchar](255) NOT NULL,
	[ward_number] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ssnap_report_admin_tx]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ssnap_report_admin_tx](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[report_id] [numeric](19, 0) NOT NULL,
	[report_version] [numeric](19, 0) NOT NULL,
	[action] [varchar](32) NOT NULL,
	[administrator] [numeric](19, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[occupational_therapy_management]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[occupational_therapy_management](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[assessment_date] [datetime] NULL,
	[assessment_time] [int] NULL,
	[assessment_performed] [tinyint] NULL,
	[no_assessment_reason_type_id] [numeric](19, 0) NULL,
	[mood_assessment_date] [datetime] NULL,
	[mood_assessment_time] [int] NULL,
	[mood_assessment_performed] [varchar](255) NULL,
	[days_of_therapy] [int] NULL,
	[minutes_of_therapy] [int] NULL,
	[therapy_required] [tinyint] NULL,
	[no_mood_assessment_reason_type_id] [numeric](19, 0) NULL,
	[assessment_performed_in72hrs] [tinyint] NULL,
	[no72hr_assessment_reason_type_id] [numeric](19, 0) NULL,
 CONSTRAINT [PK__occupati__3213E83F5EBF139D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[modified_rankin]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modified_rankin](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[modified_rankin_score] [int] NOT NULL,
	[assessment_management_id] [numeric](19, 0) NULL,
	[modified_rankin_assessments_idx] [int] NULL,
	[pathway_stage_id] [numeric](19, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nutrition_management]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nutrition_management](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[date_screened] [datetime] NULL,
	[time_screened] [int] NULL,
	[must_score] [int] NULL,
	[dietitian_referral_date] [datetime] NULL,
	[dietitian_referral_time] [int] NULL,
	[unable_to_screen] [tinyint] NULL,
	[adequate_at24] [varchar](255) NULL,
	[inadequate_at24nutrition_reason_type_id] [numeric](19, 0) NULL,
	[inadequate_at24reason_other] [varchar](255) NULL,
	[adequate_at48] [varchar](255) NULL,
	[inadequate_at48nutrition_reason_type_id] [numeric](19, 0) NULL,
	[inadequate_at48reason_other] [varchar](255) NULL,
	[adequate_at72] [varchar](255) NULL,
	[inadequate_at72nutrition_reason_type_id] [numeric](19, 0) NULL,
	[inadequate_at72reason_other] [varchar](255) NULL,
	[dietitian_not_seen] [tinyint] NULL,
 CONSTRAINT [PK__nutritio__3213E83F534D60F1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[physiotherapy_management]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[physiotherapy_management](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[assessment_date] [datetime] NULL,
	[assessment_time] [int] NULL,
	[assessment_performed] [tinyint] NULL,
	[no_assessment_reason_type_id] [numeric](19, 0) NULL,
	[days_of_therapy] [int] NULL,
	[minutes_of_therapy] [int] NULL,
	[therapy_required] [tinyint] NULL,
	[assessment_performed_in72hrs] [tinyint] NULL,
	[no72hr_assessment_reason_type_id] [numeric](19, 0) NULL,
 CONSTRAINT [PK__physioth__3213E83F75A278F5] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post_discharge_support]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post_discharge_support](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[post_discharge_care_id] [numeric](19, 0) NOT NULL,
	[type_id] [numeric](19, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post_discharge_therapy]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post_discharge_therapy](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[post_discharge_care_id] [numeric](19, 0) NOT NULL,
	[type_id] [numeric](19, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[postDchgThrpy]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[postDchgThrpy]()
RETURNS @postDchgThrpyTab TABLE(
	post_discharge_care_id numeric(19,0),
	ICT varchar(1), 
	ESD varchar(1),
	Residential_Rehab_Facility varchar(1),
	Generic_Comm_Care varchar(1),
	None varchar(1),
	Intermediate_Care varchar(1),
	Home varchar(1),
	Care_Home varchar(1),
	Other varchar(1)	
)
AS
BEGIN	
	INSERT INTO @postDchgThrpyTab
		SELECT 
			post_discharge_care_id	
		,   CASE WHEN [1] = 1 THEN 'Y' ELSE 'N' END AS	ICT
		,	CASE WHEN [2] = 1 THEN 'Y' ELSE 'N' END AS	ESD
		,	CASE WHEN [3] = 1 THEN 'Y' ELSE 'N' END AS	Residential_Rehab_Facility
		,	CASE WHEN [4] = 1 THEN 'Y' ELSE 'N' END AS	Generic_Comm_Care
		,	CASE WHEN [5] = 1 THEN 'Y' ELSE 'N' END AS	None
		,	CASE WHEN [6] = 1 THEN 'Y' ELSE 'N' END AS	Intermediate_Care
		,	CASE WHEN [7] = 1 THEN 'Y' ELSE 'N' END AS	Home
		,	CASE WHEN [8] = 1 THEN 'Y' ELSE 'N' END AS	Care_Home
		,	CASE WHEN [9] = 1 THEN 'Y' ELSE 'N' END AS	Other
		  FROM 
		  ( SELECT post_discharge_care_id, TYPE_ID FROM [stroke].[dbo].[post_discharge_therapy])  AS P
		  PIVOT ( COUNT(type_id) 
				  FOR type_id IN ([1],[2],[3],[4],[5],[6],[7],[8],[9])) AS PVT ORDER BY post_discharge_care_id
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[postDchgSupport]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[postDchgSupport]()
RETURNS @postDchgSupportTab TABLE(
	post_discharge_care_id numeric(19,0),
	Social_Services varchar(1),
	Informal_Carers varchar(1),
	Homecare_package  varchar(1),
	Family varchar(1),
	Palliative_Care varchar(1),
	None varchar(1),
	Social_Services_Unavailable varchar(1),
	Patient_Refused varchar(1),
	Stroke_neurology_specific_ESD varchar(1),
	Non_specialist_ESD varchar(1),
	Stroke_neurology_specific_community_rehabilitation_team varchar(1),
	Non_specialist_community_rehabilitation_team varchar(1),
	No_therapy_given varchar(1),
	No_rehabilitation varchar(1),
	No_ESD varchar(1)
)
AS
BEGIN
	INSERT INTO @postDchgSupportTab
		SELECT
		post_discharge_care_id	
		,   CASE WHEN [1] = 1 THEN 'Y' ELSE 'N' END AS Social_Services
		,   CASE WHEN [2] = 1 THEN 'Y' ELSE 'N' END AS Informal_Carers
		,   CASE WHEN [3] = 1 THEN 'Y' ELSE 'N' END AS Homecare_package
		,   CASE WHEN [4] = 1 THEN 'Y' ELSE 'N' END AS Family
		,   CASE WHEN [5] = 1 THEN 'Y' ELSE 'N' END AS Palliative_Care
		,   CASE WHEN [6] = 1 THEN 'Y' ELSE 'N' END AS None
		,   CASE WHEN [7] = 1 THEN 'Y' ELSE 'N' END AS Social_Services_Unavailable
		,   CASE WHEN [8] = 1 THEN 'Y' ELSE 'N' END AS Patient_Refused
		,   CASE WHEN [9] = 1 THEN 'Y' ELSE 'N' END AS Stroke_neurology_specific_ESD
		,   CASE WHEN [10] = 1 THEN 'Y' ELSE 'N' END AS Non_specialist_ESD
		,   CASE WHEN [11] = 1 THEN 'Y' ELSE 'N' END AS Stroke_neurology_specific_community_rehabilitation_team
		,   CASE WHEN [12] = 1 THEN 'Y' ELSE 'N' END AS Non_specialist_community_rehabilitation_team
		,   CASE WHEN [13] = 1 THEN 'Y' ELSE 'N' END AS No_therapy_given
		,   CASE WHEN [14] = 1 THEN 'Y' ELSE 'N' END AS No_rehabilitation
		,   CASE WHEN [15] = 1 THEN 'Y' ELSE 'N' END AS No_ESD
		FROM 
		  ( SELECT post_discharge_care_id, TYPE_ID FROM [stroke].[dbo].[post_discharge_support])  AS P
		  PIVOT ( COUNT(type_id) 
				  FOR type_id IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15])) AS PVT ORDER BY post_discharge_care_id
	RETURN	
END
GO
/****** Object:  View [dbo].[esd_discharge]    Script Date: 07/22/2013 16:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[esd_discharge]
as
select post_discharge_care_id
		, description as ESD
 from post_discharge_therapy 
 join post_discharge_therapy_type on post_discharge_therapy.type_id = post_discharge_therapy_type.id
 
where type_id =2
GO
/****** Object:  Table [dbo].[therapy_management]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[therapy_management](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[cognitive_status_assessed] [tinyint] NULL,
	[cognitive_status_assessment_date] [datetime] NULL,
	[cognitive_status_assessment_time] [int] NULL,
	[cognitive_status_no_assessment_type_id] [numeric](19, 0) NULL,
	[rehab_goals_set] [tinyint] NULL,
	[rehab_goals_set_date] [datetime] NULL,
	[rehab_goals_set_time] [int] NULL,
	[rehab_goals_not_set_reason_type_id] [numeric](19, 0) NULL,
	[assessment_management_id] [numeric](19, 0) NULL,
	[physiotherapy_management_id] [numeric](19, 0) NULL,
	[occupational_therapy_management_id] [numeric](19, 0) NULL,
	[speech_and_language_therapy_management_id] [numeric](19, 0) NULL,
	[nurse_led_therapy_days_of_therapy] [int] NULL,
	[nurse_led_therapy_minutes_of_therapy] [int] NULL,
	[nurse_led_therapy_required] [tinyint] NULL,
	[pyschology_days_of_therapy] [int] NULL,
	[pyschology_minutes_of_therapy] [int] NULL,
	[pyschology_therapy_required] [tinyint] NULL,
 CONSTRAINT [PK__therapy___3213E83F5AEE82B9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ssnap_report_field]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ssnap_report_field](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[record_id] [numeric](19, 0) NOT NULL,
	[field_name] [varchar](64) NOT NULL,
	[field_number] [varchar](64) NULL,
	[field_value] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[catheter_history]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[catheter_history](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[insert_date] [datetime] NULL,
	[insert_time] [int] NULL,
	[reason_id] [numeric](19, 0) NOT NULL,
	[reason_other] [varchar](255) NULL,
	[removal_date] [datetime] NULL,
	[removal_time] [int] NULL,
	[continence_management_id] [numeric](19, 0) NOT NULL,
 CONSTRAINT [PK__catheter__3213E83F1A14E395] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[medical_history]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[medical_history](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[onset_date] [datetime] NULL,
	[onset_date_unknown] [tinyint] NOT NULL,
	[onset_time] [int] NULL,
	[onset_time_unknown] [tinyint] NOT NULL,
	[previous_stroke] [varchar](50) NULL,
	[previous_tia] [varchar](50) NULL,
	[onset_date_estimated] [tinyint] NULL,
	[onset_time_estimated] [tinyint] NULL,
	[during_sleep] [tinyint] NULL,
	[assessed_in_vascular_clinic] [tinyint] NULL,
	[arrival_id] [numeric](19, 0) NULL,
	[inpatient_at_onset] [tinyint] NULL,
	[hospital_admission_date] [datetime] NULL,
	[hospital_admission_time] [numeric](19, 0) NULL,
	[hospital_discharge_date] [datetime] NULL,
	[hospital_discharge_time] [numeric](19, 0) NULL,
	[admission_ward] [varchar](255) NULL,
	[stroke_ward_admission_date] [datetime] NULL,
	[stroke_ward_admission_time] [numeric](19, 0) NULL,
	[stroke_ward_discharge_date] [datetime] NULL,
	[stroke_ward_discharge_time] [numeric](19, 0) NULL,
	[stroke_unit_death] [tinyint] NULL,
	[did_not_stay_in_stroke_ward] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[imaging]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[imaging](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[scan_post_stroke] [varchar](255) NOT NULL,
	[scan_id] [numeric](19, 0) NULL,
	[no_scan_reason_id] [numeric](19, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ict_discharge]    Script Date: 07/22/2013 16:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ict_discharge]
as
select post_discharge_care_id
		, description as ICT
 from post_discharge_therapy 
 join post_discharge_therapy_type on post_discharge_therapy.type_id = post_discharge_therapy_type.id
 
where type_id =1
GO
/****** Object:  Table [dbo].[comorbidity]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comorbidity](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[type_id] [numeric](19, 0) NULL,
	[value] [varchar](250) NULL,
	[medical_history_id] [numeric](19, 0) NOT NULL,
 CONSTRAINT [PK__comorbid__3213E83F4BAC3F29] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[care_activity]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[care_activity](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[hospital_stay_id] [varchar](255) NOT NULL,
	[start_date] [datetime] NULL,
	[start_time] [int] NULL,
	[final_diagnosis] [varchar](255) NULL,
	[fit_for_discharge_date] [datetime] NULL,
	[fit_for_discharge_time] [int] NULL,
	[fit_for_discharge_date_unknown] [tinyint] NULL,
	[social_worker_referral] [varchar](50) NULL,
	[social_worker_referral_date] [datetime] NULL,
	[social_worker_referral_unknown] [tinyint] NULL,
	[social_worker_assessment] [varchar](50) NULL,
	[social_worker_assessment_date] [datetime] NULL,
	[social_worker_assessment_unknown] [tinyint] NULL,
	[in_af_on_discharge] [varchar](50) NULL,
	[on_anticoagulant_at_discharge] [varchar](50) NULL,
	[end_date] [datetime] NULL,
	[end_time] [int] NULL,
	[care_activities_idx] [int] NULL,
	[clinical_assessment_id] [numeric](19, 0) NULL,
	[patient_life_style_id] [numeric](19, 0) NULL,
	[continence_management_id] [numeric](19, 0) NULL,
	[imaging_id] [numeric](19, 0) NULL,
	[medical_history_id] [numeric](19, 0) NULL,
	[nutrition_management_id] [numeric](19, 0) NULL,
	[fluid_management_id] [numeric](19, 0) NULL,
	[therapy_management_id] [numeric](19, 0) NULL,
	[thrombolysis_id] [numeric](19, 0) NULL,
	[post_discharge_care_id] [numeric](19, 0) NULL,
	[clinical_summary_id] [numeric](19, 0) NULL,
	[patient_id] [numeric](19, 0) NOT NULL,
 CONSTRAINT [PK__care_act__3213E83F03317E3D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UNQ__care_activity__hospital_stay_id] UNIQUE NONCLUSTERED 
(
	[hospital_stay_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[risk_factor]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[risk_factor](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[medical_history_id] [numeric](19, 0) NOT NULL,
	[type_id] [numeric](19, 0) NOT NULL,
	[value] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[medication]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[medication](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[type_id] [numeric](19, 0) NULL,
	[value] [varchar](250) NULL,
	[medical_history_id] [numeric](19, 0) NOT NULL,
 CONSTRAINT [PK__medicati__3213E83F3C69FB99] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[medical_history_rec]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[medical_history_rec]()
RETURNS @medicalHistoryTab TABLE(
	medical_history_id numeric(19,0),
	previous_tia VARCHAR(2),
	assessed_in_vascular_clinic VARCHAR(1)
)
AS
BEGIN	
	INSERT INTO @medicalHistoryTab
	SELECT 
		s.id AS medical_history_id,
		
		CASE
			WHEN s.previous_tia IS NULL THEN 'NK'
			WHEN s.previous_tia = 'yesWithinMonth' THEN 'Y'
			ELSE 'N'
		END AS previous_tia,
								
		CASE
			WHEN s.previous_tia <> 'yesWithinMonth' THEN  ''
			WHEN s.assessed_in_vascular_clinic = 1 THEN 'Y'
			ELSE 'N' 
		END 
		AS assessed_in_vascular_clinic

	FROM 
		medical_history AS s
	RETURN
END
GO
/****** Object:  View [dbo].[patient_data]    Script Date: 07/22/2013 16:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[patient_data]
AS
	SELECT DISTINCT
    p.[id]
      ,[nhs_number] AS [S1NHSNumber]
      , CASE 
			WHEN [nhs_number] IS NULL THEN '1' 
			ELSE '0'
		END AS [S1NoNHSNumber]
      ,[hospital_number] 
      ,[district_number]
      ,[surname] AS [S1Surname]
      ,[forename] AS [S1Forename]
      ,[gender] AS [S1Gender]
      ,[ethnicity] AS [S1Ethnicity]
      ,RTRIM(LEFT([postcode], 4)) AS [S1PostcodeOut]
      ,RIGHT([postcode],3) AS [S1PostcodeIn]
      ,CASE 
			WHEN ISNULL(m.stroke_unit_death,0) = 1 THEN 'Y'
			ELSE 'N'
		END AS S7StrokeUnitDeath
      ,CONVERT(varchar(10), [date_of_birth], 103)  AS [S1BirthDate]
      ,CASE 
			WHEN ISNULL(m.stroke_unit_death,0) = 1 THEN CONVERT(varchar(10), [date_of_death], 103)
			ELSE ''
		END AS [S7DeathDate]
      ,dbo.makeDateTime(m.[hospital_admission_date],ISNULL(m.[hospital_admission_time],0)) AS S1FirstArrivalDateTime
      ,CASE 
	      WHEN ISNULL(a.transferred_from_another_hospital,0) = 1 THEN dbo.makeDateTime(a.[this_hospital_arrival_date], a.[this_hospital_arrival_time])
	      ELSE dbo.makeDateTime(m.[hospital_admission_date],m.[hospital_admission_time])  -- Same as 1st arrival because no transfer indicated
	   END AS S4ArrivalDateTime 
	  ,m.hospital_admission_date
	  ,m.hospital_admission_time
      ,CASE 
			WHEN m.[hospital_admission_time] IS NULL THEN '1'
			ELSE '0'
		END AS [S1FirstArrivalTimeNotEntered]
	  ,CASE 
			WHEN ISNULL(a.transferred_from_another_hospital,0) = 1 AND a.[this_hospital_arrival_time] IS NULL THEN '1'
			WHEN ISNULL(a.transferred_from_another_hospital,0) = 0 AND m.[hospital_admission_time] IS NULL THEN '1'
			ELSE '0'
		END AS S4ArrivalTimeNotEntered
	   ,m.[did_not_stay_in_stroke_ward] AS S4StrokeUnitArrivalNA
	  ,CASE
	        WHEN m.[stroke_ward_admission_date] IS NULL THEN '1'
	        ELSE '0'
		END AS S1FirstStrokeUnitArrivalNA	
      ,dbo.makeDateTime(m.[hospital_discharge_date],m.[hospital_discharge_time]) AS [S7HospitalDischargeDateTime]
      ,CASE 
			WHEN m.[hospital_discharge_time] IS NULL THEN '1'
			ELSE '0'
		END AS [S7HospitalDischargeTimeNotEntered]      
      ,m.[admission_ward] AS S1FirstWard
      ,m.[admission_ward] AS S4FirstWard
      ,dbo.makeDateTime(m.[stroke_ward_admission_date],m.[stroke_ward_admission_time]) AS S1FirstStrokeUnitArrivalDateTime
      ,CASE 
			WHEN m.[stroke_ward_admission_time] IS NULL THEN '1'
			ELSE '0'
		END AS S1FirstStrokeUnitArrivalTimeNotEntered    
      , CASE 
			WHEN m.stroke_ward_discharge_date IS NOT NULL AND m.stroke_ward_discharge_time IS NOT NULL THEN dbo.makeDateTime(m.[stroke_ward_discharge_date],m.[stroke_ward_discharge_time]) 
			ELSE ''
		END AS S7StrokeUnitDischargeDateTime
	  ,m.stroke_ward_discharge_date
	  ,m.stroke_ward_discharge_time
      ,CASE 
			WHEN m.stroke_ward_admission_date IS NULL THEN ''
			WHEN m.[stroke_ward_discharge_time] IS NULL THEN '1'
			ELSE '0'
		END AS S7StrokeUnitDischargeTimeNotEntered
	  ,dbo.makeDateTime(m.stroke_ward_admission_date, m.stroke_ward_admission_time) AS S4StrokeUnitArrivalDateTime
	  ,CASE 
			WHEN m.[stroke_ward_admission_time] IS NULL THEN '1'
			ELSE '0'
		END AS S4StrokeUnitArrivalTimeNotEntered	  
    FROM dbo.care_activity c 
    JOIN dbo.patient_proxy p ON c.patient_id = p.id 
    JOIN dbo.medical_history m ON m.id = c.medical_history_id
    JOIN dbo.arrival a ON a.id = m.arrival_id
GO
/****** Object:  UserDefinedFunction [dbo].[occThrpy]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[occThrpy]()
RETURNS @occThrpyTab TABLE(
	care_activity_id numeric(19,0),
	medical_history_id numeric(19,0),
	hospital_stay_id varchar(255),
	occTherapist72HrsDateTime varchar(16),  
	occTherapist72HrsTimeNotEntered char(1),
	occTherapist72HrsNotAssessed char(1),
	occTherapist72HrsNotAssessedReason char(2),
	therapyRequired VARCHAR(1),
	therapyDays VARCHAR(40),
	therapyMinutes VARCHAR(60),
	occTherapistByDischargeDateTime varchar(16),
	occTherapistByDischargeTimeNotEntered varchar(1),
	occTherapistByDischargeNotAssessed varchar(1),
	occTherapistByDischargeNotAssessedReason varchar(2),
	moodScreeningDate varchar(10),
	moodScreeningNoScreening varchar(1),
	moodScreeningnoScreeningReaaon varchar(2),
	cognitionScreeningDate varchar(10),
	cognitionScreeningNoScreening varchar(1),
	cognitionScreeningNoScreeningReason varchar(2),
	firstRehabGoalsDate VARCHAR(1)
)
AS
BEGIN	
	/*
	-- POPULATE Reasons for non-performance
	--
	*/

	--pw commented out for SQL 2005
	--DECLARE @MoodScreenNotPerformedReason AS [dbo].[ReasonTableType];
	--INSERT 
	--	INTO @MoodScreenNotPerformedReason 
	--	VALUES 
	--		('organisational', 'OR'),
	--		('unknown', 'NK'),
	--		('unwell',  'MU'),
	--		('refused', 'PR'),
	--		('notRequired',NULL),
	--		('notFit',	NULL),
	--		('palliative',	NULL),
	--		('noproblem',	NULL);


	--DECLARE @CognitiveAssessmentNotPerformedReason AS [dbo].[ReasonTableType];
	--INSERT 
	--	INTO @CognitiveAssessmentNotPerformedReason 
	--	VALUES 
	--		('organisational', 'OR'),
	--		('unknown', 'NK'),
	--		('unwell',  'MU'),
	--		('refused', 'PR'),
	--		('died',	NULL),
	--		('unconcious',	NULL),
	--		('palliative',	NULL),
	--		('none',	NULL);
		
	INSERT INTO @occThrpyTab
	SELECT
		c.id AS care_activity_id, 
		c.medical_history_id AS medical_history_id,
		c.hospital_stay_id AS hospital_stay_id,
		
		CASE
			WHEN ISNULL(o.assessment_performed_in72hrs,0) = 0  THEN ''
			WHEN o.assessment_date IS NULL THEN  ''
			ELSE dbo.makeDateTime( o.assessment_date, o.assessment_time) 
		END AS occTherapist72HrsDateTime,
		
		CASE
			WHEN o.assessment_time IS NULL THEN '1'
			ELSE '0'
		END
		AS occTherapist72HrsTimeNotEntered,
		
		CASE
			WHEN ISNULL(o.assessment_performed_in72hrs,0) = 0 THEN '1'
			ELSE '0'
		END 
		AS occTherapist72HrsNotAssessed,
		
		CASE
			WHEN ISNULL(o.assessment_performed_in72hrs,0) = 1 THEN ''
			WHEN r2.description IS NULL THEN ''
			WHEN r2.description = 'organisational' THEN 'OR'
			WHEN r2.description = 'refused' THEN 'PR'
			WHEN r2.description = 'unwell' THEN 'PU'
			WHEN r2.description = 'noproblem' THEN 'ND'
			ELSE 'NK'
		END
		AS occTherapist72HrsNotAssessedReason,
		CASE 
			WHEN ISNULL(o.therapy_required,0) = 0 THEN 'N' 
			ELSE  'Y'
		END AS therapyRequired,
		
		CASE 
			WHEN ISNULL(o.therapy_required,0) = 1 THEN CAST( ISNULL(o.days_of_therapy,0) AS VARCHAR(40))
			ELSE ''			
		END AS therapyDays,
		
		CASE 
			WHEN ISNULL(o.therapy_required,0) = 1 THEN CAST(ISNULL(o.minutes_of_therapy,0) AS VARCHAR(60))
			ELSE ''
		END AS therapyMinutes,
		
		CASE
			WHEN o.assessment_performed <> 1 THEN ''
			WHEN o.assessment_date IS NULL THEN  ''
			WHEN ISNULL(o.assessment_performed_in72hrs,0) = 1 THEN ''
			ELSE dbo.makeDateTime( o.assessment_date, o.assessment_time) 
		END AS occTherapistByDischargeDateTime,
		
		CASE
			WHEN o.assessment_time IS NULL THEN '1'
			WHEN ISNULL(o.assessment_performed_in72hrs,0) = 1 THEN '1'
			ELSE '0'
		END
		AS occTherapistByDischargeTimeNotEntered,
		
		CASE
			WHEN ISNULL(o.assessment_performed_in72hrs,0) = 1 THEN ''
			WHEN o.assessment_performed <> 1 THEN '1'
			ELSE ''
		END 
		AS occTherapistByDischargeNotAssessed,
		
		CASE
			WHEN ISNULL(o.assessment_performed_in72hrs,0) = 1 THEN ''
			WHEN o.assessment_performed <> 1 THEN ''
			WHEN o.assessment_date IS NOT NULL THEN ''
			WHEN r.description IS NULL THEN ''
			WHEN r.description = 'organisational' THEN 'OR'
			WHEN r.description = 'refused' THEN 'PR'
			WHEN r.description = 'unwell' THEN 'PU'
			WHEN r.description = 'noproblem' THEN 'ND'
			ELSE 'NK'
		END
		AS occTherapistByDischargeNotAssessedReason,
		

		--pw commented out for SQL 2005
		--moodAsmtPerf.perfDate AS moodScreeningDate,
		--moodAsmtPerf.notPerformed AS moodScreeningNoScreening,
		--moodAsmtPerf.codedReason AS moodScreeningnoScreeningReaaon,

		--pw commented out for SQL 2005
		--cognAsmtPerf.perfDate AS cognitionScreeningDate,
		--cognAsmtPerf.notPerformed AS cognitionScreeningNoScreening,
		--cognAsmtPerf.codedReason AS cognitionScreeningNoScreeningReason,

		--pw added for SQL 2005
		CASE ISNULL(o.mood_assessment_performed, 'false')
			WHEN 'true' THEN CONVERT(CHAR(10), o.mood_assessment_date, 103)
			WHEN '1' THEN CONVERT(CHAR(10), o.mood_assessment_date, 103)
			ELSE ''
		END
		AS moodScreeningDate,
		CASE ISNULL(o.mood_assessment_performed, 'false')
			WHEN 'true' THEN '0'
			WHEN '1' THEN '0'
			ELSE '1'
		END
		AS moodScreeningNoScreening,
		CASE ISNULL(o.mood_assessment_performed, 'false')
			WHEN 'true' THEN ''
			WHEN '1' THEN ''
			ELSE CASE mr.[description]
				WHEN 'organisational' THEN 'OR'
				WHEN 'unknown' THEN 'NK'
				WHEN 'unwell' THEN 'MU'
				WHEN 'refused' THEN 'PR'
				WHEN 'notRequired' THEN '' 
				WHEN 'notFit' THEN ''
				WHEN 'palliative' THEN '' 
				WHEN 'noproblem' THEN ''
				ELSE ''
				
			END
		END
		AS moodScreeningnoScreeningReason,--NB corrected spelling of Reason

		--pw added for SQL 2005
		CASE ISNULL(t.cognitive_status_assessed, 0)
			WHEN 1 THEN CONVERT(CHAR(10), t.cognitive_status_assessment_date, 103)
			ELSE ''
		END
		AS cognitionScreeningDate,
		CASE ISNULL(t.cognitive_status_assessed, 0)
			WHEN 1 THEN '0'
			ELSE '1'
		END
		AS cognitionScreeningNoScreening,
		CASE ISNULL(t.cognitive_status_assessed, 0)
			WHEN 1 THEN ''
			ELSE CASE cr.[description]
				WHEN 'organisational' THEN 'OR'
				WHEN 'unknown' THEN 'NK'
				WHEN 'unwell' THEN 'MU'
				WHEN 'refused' THEN 'PR'
				WHEN 'died' THEN ''
				WHEN 'unconcious' THEN '' 
				WHEN 'palliative' THEN ''
				WHEN 'none' THEN ''
				ELSE ''
				
			END
		END
		AS cognitionScreeningNoScreeningReason,

		'' AS firstRehabGoalsDate
	FROM 
		dbo.care_activity AS c
	LEFT OUTER JOIN
		dbo.therapy_management t
		ON c.therapy_management_id = t.id
	LEFT OUTER JOIN
		dbo.occupational_therapy_management AS o
		ON t.occupational_therapy_management_id = o.id
	LEFT OUTER JOIN
		dbo.occupational_therapy_no_assessment_reason_type AS r	
		ON o.no_assessment_reason_type_id = r.id
	LEFT OUTER JOIN
		dbo.occupational_therapy_no_assessment_reason_type AS r2	
		ON o.[no72hr_assessment_reason_type_id] = r2.id
	LEFT OUTER JOIN
		dbo.occupational_therapy_no_assessment_reason_type AS mr	
		ON o.no_mood_assessment_reason_type_id = mr.id
	LEFT OUTER JOIN
		dbo.occupational_therapy_no_assessment_reason_type AS cr	
		ON t.cognitive_status_no_assessment_type_id = cr.id
	--pw commented out for SQL 2005
	--CROSS APPLY
	--	dbo.performanceRecord2(
	--		o.mood_assessment_date,
	--		o.mood_assessment_time,
	--		o.mood_assessment_performed, 
	--		mr.description, 
	--		@MoodScreenNotPerformedReason) AS moodAsmtPerf
	--CROSS APPLY
	--	dbo.performanceRecord(
	--		t.cognitive_status_assessment_date,
	--		t.cognitive_status_assessment_time,
	--		t.cognitive_status_assessed, 
	--		cr.description, 
	--		@CognitiveAssessmentNotPerformedReason) AS cognAsmtPerf	 
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[meds]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[meds]() 
RETURNS @medsTab TABLE 
	( 
		medical_history_id numeric(19,0),
		warfarin varchar(1),
		antiplatelet varchar(1),
		lipid_lowering varchar(1)
     )
AS
BEGIN 
	INSERT INTO @medsTab
	SELECT 
		medical_history_id,
		CASE WHEN [1] = 1 THEN 'Y' ELSE 'N' END	AS	warfarin,
		CASE WHEN [2] = 1 THEN 'Y' ELSE 'N' END	AS	antiplatelet,
		CASE WHEN [3] = 1 THEN 'Y' ELSE 'N' END	AS	lipid_lowering
	FROM (SELECT m.type_id, m.value, m.medical_history_id  
	  FROM [stroke].[dbo].[medication] m WHERE value = 'true') P
	PIVOT (
		COUNT( value )
		FOR type_id in ([1],[2],[3]) ) AS pvt order by medical_history_id
	RETURN
END
GO
/****** Object:  Table [dbo].[observation]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[observation](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[date_made] [datetime] NOT NULL,
	[time_made] [int] NULL,
	[type_id] [numeric](19, 0) NOT NULL,
	[value] [varchar](255) NOT NULL,
	[care_activity_id] [numeric](19, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[thpyMgMt]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[thpyMgMt]()
RETURNS @spchThpyTab TABLE(
	care_activity_id numeric(19,0),
	medical_history_id numeric(19,0),
	hospital_stay_id varchar(255),
	thpy_id numeric(19,0),	
	psychoRequired VARCHAR(1),
	psychoDays VARCHAR(40),
	psychoMinutes VARCHAR(60),
	rehabGoalsDate varchar(16),
	rehabGoalsNone varchar(1),
	rehabGoalsNoneReason varchar(3)
)
AS
BEGIN	
	INSERT INTO @spchThpyTab
	SELECT	
		c.id AS care_activity_id, 		
		c.medical_history_id AS medical_history_id,		
		c.hospital_stay_id AS hospital_stay_id,
		t.id,		

		CASE 
			WHEN ISNULL(t.[pyschology_therapy_required],0) = 0 THEN 'N' 
			ELSE  'Y'
		END AS psychoRequired,
		
		CASE 
			WHEN ISNULL(t.[pyschology_therapy_required],0) = 1 THEN CAST(ISNULL(t.[pyschology_days_of_therapy],0) AS VARCHAR(40))
			ELSE ''
		END AS psychoDays,
		
		CASE 
			WHEN ISNULL(t.[pyschology_therapy_required],0) = 1 THEN CAST(ISNULL(t.[pyschology_minutes_of_therapy],0)  AS VARCHAR(60))
			ELSE ''
		END AS psychoMinutes,
		
		CASE
			WHEN ISNULL(t.rehab_goals_set, 0) = 0 THEN '' 
			WHEN t.rehab_goals_set_date IS NULL THEN ''			
			ELSE CONVERT (CHAR(10), rehab_goals_set_date, 103)
		END AS rehabGoalsDate,
		CASE 
			WHEN ISNULL(t.rehab_goals_set, 0) = 0 THEN '1'
			ELSE '0'
		END AS rehabGoalsNone,
		
		CASE
			WHEN ISNULL(t.rehab_goals_set, 0) = 1 THEN '' 
			WHEN r.description = 'refused' THEN 'PR'
			WHEN r.description = 'organisational' THEN 'OR'
			WHEN r.description = 'unwell' THEN 'MU'
			WHEN r.description = 'noproblem' THEN 'NI'
			WHEN r.description = 'nopotential' THEN 'NRP'
			WHEN r.description = 'unknown' THEN 'NK'
			ELSE ''
		END AS rehabGoalsNoneReason 
		
	FROM 
		dbo.care_activity AS c
	LEFT OUTER JOIN
		dbo.therapy_management t
		ON c.therapy_management_id = t.id
	LEFT OUTER JOIN
		dbo.rehab_goals_not_set_reason_type	AS r	
		ON t.rehab_goals_not_set_reason_type_id = r.id
		
	RETURN
	
END
GO
/****** Object:  Table [dbo].[treatment]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[treatment](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[start_date] [datetime] NULL,
	[start_time] [int] NULL,
	[type_id] [numeric](19, 0) NOT NULL,
	[end_date] [datetime] NULL,
	[end_time] [int] NULL,
	[care_activity_id] [numeric](19, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[rankinScore]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[rankinScore]() 
RETURNS @RankinTab TABLE (
   medical_history_id numeric(19,0),
   hospital_stay_id varchar(255),
   pre_admission_rankin VARCHAR(3),
   baseline_rankin VARCHAR(3),
   discharge_rankin VARCHAR(3)
   )
AS
BEGIN
	INSERT INTO @RankinTab

		SELECT 
			mhi,
			hsi,
			ISNULL(CONVERT(VARCHAR(3), [1]), '') AS PreAdmission, 
			ISNULL(CONVERT(VARCHAR(3), [2]), '') as Baseline, 
			ISNULL(CONVERT(VARCHAR(3), [3]), '') as Discharge
		FROM
			(SELECT
			 [modified_rankin_score]           
			  , [pathway_stage_id]  
			  , care.hospital_stay_id AS hsi
			  , care.medical_history_id AS mhi
			FROM		 
				dbo.care_activity AS care
				LEFT OUTER JOIN 
					dbo.therapy_management AS trpy 
					ON care.therapy_management_id = trpy.id		
				LEFT OUTER JOIN 
					dbo.modified_rankin AS rnk 
					ON rnk.assessment_management_id = trpy.assessment_management_id		
				) P
		  PIVOT ( SUM(modified_rankin_score) 
				  FOR pathway_stage_id IN ( [1], [2], [3] )) AS pvt 
				  GROUP BY pvt.mhi, pvt.hsi, pvt.[1], pvt.[2], pvt.[3]
				  ORDER BY pvt.mhi	
	
	RETURN
END
GO
/****** Object:  View [dbo].[report_start]    Script Date: 07/22/2013 16:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[report_start]
as

select care_activity.id,
			hospital_stay_id,
			start_date,
			start_time,
			end_date,
			end_time, hospital_number
			
 from care_activity

 -- This join is to select the hospital no for the patient
 join patient_proxy on patient_proxy.id = care_activity.patient_id
GO
/****** Object:  UserDefinedFunction [dbo].[clSmry]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[clSmry]()
RETURNS @smryTab TABLE(
	medical_history_id numeric(19,0),
	hospital_stay_id varchar(255),
	palliativeCare varchar(1),
	palliativeCareDecisionDate varchar(10),
	endOfLifePathway varchar(1),
	locWorst7Days TINYINT,
	urinaryTractInfection7Days  varchar(2),
	pneumoniaAntibiotics7Days  varchar(2),
	palliativeCareByDischarge VARCHAR(1),
	palliativeCareByDischargeDate VARCHAR(10),
	endOfLifePathwayByDischarge VARCHAR(1)
)
AS
BEGIN	
	INSERT INTO @smryTab
	SELECT 
		c.medical_history_id AS medical_history_id,
		c.hospital_stay_id AS hospital_stay_id,
		CASE
			WHEN ISNULL(s.palliative_care,'no') = 'no' THEN 'N'
			WHEN dbo.withinHours(c.start_date, c.start_time, s.palliative_care_date, 0, 72) = 1 THEN 'Y'
			ELSE 'N'
		END
		AS palliativeCare,
		CASE
			WHEN ISNULL(s.palliative_care,'no') = 'no' THEN ''
			WHEN s.palliative_care_date IS NULL THEN ''
			WHEN dbo.withinHours(c.start_date, c.start_time, s.palliative_care_date, 0, 72) = 1 THEN CONVERT( varchar(10), s.palliative_care_date, 103 )
		END
		AS palliativeCareDecisionDate,
		CASE
			WHEN ISNULL(s.palliative_care,'no') = 'no' THEN ''
			WHEN s.end_of_life_pathway = 'yes' THEN 'Y'
			ELSE 'N'
		END
		AS endOfLifePathway,
		CASE
			WHEN arrival.[transferred_from_another_hospital] = 1 AND dbo.withinDays(arrival.this_hospital_arrival_date, arrival.this_hospital_arrival_time, m.hospital_admission_date, m.hospital_admission_time, 7) = 1 THEN ''
		    WHEN loc.description IS NULL THEN ''
			WHEN loc.description = 'fully' THEN 0
			WHEN loc.description = 'drowsy' THEN 1
			WHEN loc.description = 'semi' THEN 2
			WHEN loc.description = 'unconscious' THEN 3
		END AS locWorst7Days,
		CASE
			WHEN arrival.[transferred_from_another_hospital] = 1 AND dbo.withinDays(arrival.this_hospital_arrival_date, arrival.this_hospital_arrival_time, m.hospital_admission_date, m.hospital_admission_time, 7) = 1 THEN ''
			WHEN s.[urinary_tract_infection] IS NULL THEN ''
			WHEN s.[urinary_tract_infection] = 'notknown' THEN 'NK'
			WHEN s.[urinary_tract_infection] = 'yes' THEN 'Y'
			WHEN s.[urinary_tract_infection] = 'no' THEN 'N'
			ELSE ''
		END AS urinaryTractInfection7Days,
		CASE
		    WHEN arrival.[transferred_from_another_hospital] = 1 AND dbo.withinDays(arrival.this_hospital_arrival_date, arrival.this_hospital_arrival_time, m.hospital_admission_date, m.hospital_admission_time, 7) = 1 THEN ''
			WHEN s.[new_pneumonia] IS NULL THEN ''
			WHEN s.[new_pneumonia] = 'notknown' THEN 'NK'
			WHEN s.[new_pneumonia] = 'yes' THEN 'Y'
			WHEN s.[new_pneumonia] = 'no' THEN 'N'
			ELSE ''
		END AS pneumoniaAntibiotics7Days,
		CASE
			WHEN ISNULL(s.palliative_care,'no') = 'no' THEN ''
			WHEN dbo.withinHours(c.start_date, c.start_time, s.palliative_care_date, 0, 72) = 0 THEN 'Y'
			ELSE ''
		END
		AS palliativeCareByDischarge,
		CASE
			WHEN ISNULL(s.palliative_care,'no') = 'no' THEN ''
			WHEN dbo.withinHours(c.start_date, c.start_time, s.palliative_care_date, 0, 72) = 0 THEN CONVERT( varchar(10), s.palliative_care_date, 103 )
			ELSE ''
		END
		AS palliativeCareByDischargeDate,
		CASE
			WHEN ISNULL(s.palliative_care,'no') = 'no' THEN ''
			WHEN dbo.withinHours(c.start_date, c.start_time, s.palliative_care_date, 0, 72) = 1 THEN ''
			WHEN ISNULL(s.end_of_life_pathway,'no') = 'yes' THEN 'Y'
			ELSE 'N'
		END
		AS endOfLifePathwayByDischarge
	FROM 
		dbo.care_activity AS c
	LEFT OUTER JOIN
		dbo.clinical_summary AS s
		ON c.clinical_summary_id = s.id
	LEFT OUTER JOIN
		dbo.level_of_consciousness AS loc
		ON loc.id = s.worst_level_of_consciousness_id
	LEFT OUTER JOIN
		dbo.medical_history AS m
		ON m.id = c.medical_history_id 
	LEFT OUTER JOIN
		dbo.arrival AS arrival
		ON arrival.id = m.arrival_id
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[clinicAsmt]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[clinicAsmt]() 
RETURNS @AsmtTab TABLE (
	medical_history_id numeric(19,0),
	hospital_stay_id varchar(255),
	loc_stimulation INT ,
	loc_questions INT,
	loc_tasks INT,
	best_gaze INT,
	hemianopia INT,
	facial_palsy INT,
	left_arm_mrc_scale INT,
	right_arm_mrc_scale INT,
	left_leg_mrc_scale INT,
	right_leg_mrc_scale INT,
	limb_ataxia INT,
	sensory_loss INT,
	aphasia INT,
	dysarthia INT,
	inattention INT
   )
AS
BEGIN
	INSERT INTO @AsmtTab
    SELECT DISTINCT a.medical_history_id, a.hospital_stay_id,
	CASE
		WHEN c.loc_stimulation = 'keen' THEN 0 
		WHEN c.loc_stimulation = 'arousal' THEN 1
		WHEN c.loc_stimulation = 'repeated'  THEN 2
		WHEN c.loc_stimulation = 'unresponsive' THEN 3
		ELSE 0
	END
	AS loc_stimulation,
	CASE
		WHEN c.loc_questions = 'both' THEN 0
		WHEN c.loc_questions = 'one' THEN 1
		WHEN c.loc_questions = 'neither' THEN 2
		ELSE -1
	END
	AS loc_questions,
	CASE
		WHEN c.loc_tasks = 'both' THEN 0
		WHEN c.loc_tasks = 'one' THEN 1
		WHEN c.loc_tasks = 'neither' THEN 2
		ELSE -1
	END
	AS loc_tasks,
	CASE 
		WHEN c.best_gaze = 'normal'  THEN 0
		WHEN c.best_gaze = 'partial' THEN 1
		WHEN c.best_gaze = 'forced'  THEN 2
		ELSE -1
	END
	AS best_gaze,
	CASE
		WHEN c.hemianopia = 'none' THEN 0
		WHEN c.hemianopia = 'partial' THEN 1
		WHEN c.hemianopia = 'complete' THEN 2
		WHEN c.hemianopia = 'bilateral' THEN 3
		ELSe -1
	END
	AS hemianopia,
	CASE
		WHEN c.facial_palsy = 'Normal'   THEN 0
		WHEN c.facial_palsy = 'Minor'    THEN 1
		WHEN c.facial_palsy = 'Partial'  THEN 2
		WHEN c.facial_palsy = 'Complete' THEN 3
		ELSE -1
	END
	AS facial_palsy,
	ISNULL(c.left_arm_mrc_scale, -1)AS left_arm_mrc_scale,
	ISNULL(c.right_arm_mrc_scale, -1) AS right_arm_mrc_scale,
	ISNULL(c.left_leg_mrc_scale, -1) AS left_leg_mrc_scale,
	ISNULL(c.right_leg_mrc_scale, -1) AS right_leg_mrc_scale,
	CASE
		WHEN c.limb_ataxia = 'yes' THEN 0
		WHEN c.limb_ataxia = 'single' THEN 1
		WHEN c.limb_ataxia = 'two' THEN 2
		ELSE -1
	END 
	AS limb_ataxia,
	CASE
		WHEN c.sensory_loss = 'none' THEN 0
		WHEN c.sensory_loss = 'mild' THEN 1
		WHEN c.sensory_loss = 'severe' THEN 2
		ELSE -1
	END AS sensory_loss,
	CASE
		WHEN c.aphasia = 'normal' THEN 0
		WHEN c.aphasia = 'mild'   THEN 1
		WHEN c.aphasia = 'severe' THEN 2
		WHEN c.aphasia = 'global' THEn 3
		ELSE -1 
	END
	AS aphasia,
	CASE 
		WHEN c.dysarthria = 'normal' THEN 0
		WHEN c.dysarthria = 'mild'   THEN 1
		WHEN c.dysarthria = 'severe' THEN 2
		ELSE -1
	END 
	AS dysarthia,
	CASE
		WHEN c.inattention = 'normal'   THEN 0
		WHEN c.inattention = 'single'   THEN 1
		WHEN c.inattention = 'profound' THEN 2
		ELSE -1
	END
	AS inattention
	FROM 
		dbo.clinical_assessment AS c,
		dbo.care_activity AS a
	WHERE
		a.clinical_assessment_id = c.id
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[admissionAsmt]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[admissionAsmt]()
RETURNS @admAsmtTab TABLE(
	care_activity_id numeric(19,0),
	medical_history_id numeric(19,0),
	hospital_stay_id varchar(255),
	urinaryContinencePlanDate VARCHAR(10),
	urinaryContinencePlanNoPlan VARCHAR(4),
	urinaryContinencePlanNoPlanReason VARCHAR(4),
	malnutritionScreening VARCHAR(4),
	malnutritionScreeningDietitianDate VARCHAR(10),
	malnutritionScreeningDietitianNotSeen VARCHAR(4)
)
AS
BEGIN	
	/*
	-- POPULATE Reasons for non-performance
	--
	*/

	--pw commented out for SQL 2005
	--DECLARE @UrinaryContinenceNoPlanReason AS [dbo].[ReasonTableType];
	--INSERT 
	--	INTO @UrinaryContinenceNoPlanReason 
	--	VALUES 
	--		('organisational', 'OR'),
	--		('unknown', 'NK'),
	--		('continent',  'PC'),
	--		('refused', 'PR'),
	--		('unconcious',NULL),
	--		('other',	NULL);




		
	INSERT INTO @admAsmtTab
	SELECT
		c.id AS care_activity_id, 
		c.medical_history_id AS medical_history_id,
		c.hospital_stay_id AS hospital_stay_id,
		
		--pw commented out for SQL 2005
		--contPlanPerf.perfDate AS urinaryContinencePlanDate,
		--contPlanPerf.notPerformed AS urinaryContinencePlanNoPlan,
		--contPlanPerf.codedReason AS urinaryContinencePlanNoPlanReason,

		--pw added for SQL 2005
		CASE 
			WHEN ISNULL(co.has_continence_plan, 0) = 1 THEN  convert(CHAR(10),co.continence_plan_date, 103)
			ELSE ''
		END
		AS urinaryContinencePlanDate,
		CASE ISNULL(co.has_continence_plan, 0)
			WHEN 1 THEN '0'
			ELSE '1'
		END
		AS urinaryContinencePlanNoPlan,
		CASE ISNULL(co.has_continence_plan, 0)
			WHEN 1 THEN ''
			ELSE CASE cpr.[description]
				WHEN 'organisational' THEN 'OR'
				WHEN 'unknown' THEN 'NK'
				WHEN 'continent' THEN 'PC'
				WHEN 'refused' THEN 'PR'
				WHEN 'unconcious' THEN NULL 
				WHEN 'other' THEN NULL
				ELSE NULL
				--separate NULL options retained in case codes subsequently provided; should spelling of 'unconcious' be corrected?
			END
		END
		AS urinaryContinencePlanNoPlanReason,

		CASE
			WHEN ISNULL(nm.unable_to_screen,0) = 1  THEN 'NS'
			WHEN nm.date_screened IS NULL THEN 'NS'
			WHEN nm.must_score IS NULL THEN 'NS'
			WHEN nm.must_score  < 2 THEN 'N'
			ELSE 'Y'
		END
		AS malnutritionScreening,
		CASE 
			WHEN ISNULL(nm.unable_to_screen,0) = 1  THEN ''
			WHEN nm.date_screened IS NULL THEN ''
			WHEN nm.must_score IS NULL THEN ''
			WHEN nm.must_score  < 2 THEN ''			
			ELSE CONVERT(VARCHAR(10), nm.dietitian_referral_date,103) 
		END AS malnutritionScreeningDietitianDate,
		CASE
			WHEN ISNULL(nm.unable_to_screen,0) = 1  THEN ''
			WHEN nm.date_screened IS NULL THEN ''
			WHEN nm.must_score IS NULL THEN ''
			WHEN nm.must_score  < 2 THEN ''
			ELSE nm.dietitian_not_seen
		END  AS malnutritionScreeningDietitianNotSeen
	FROM 
		dbo.care_activity AS c
	LEFT OUTER JOIN
		dbo.continence_management AS co
		ON c.continence_management_id = co.id
	LEFT OUTER JOIN
		dbo.nutrition_management AS nm
		ON c.nutrition_management_id = nm.id
	LEFT OUTER JOIN
		dbo.no_continence_plan_reason_type AS cpr	
		ON co.no_continence_plan_reason_id = cpr.id
	--pw commented out for SQL 2005
	--CROSS APPLY
	--	dbo.performanceRecord(
	--		co.continence_plan_date,
	--		0,
	--		co.has_continence_plan, 
	--		cpr.description, 
	--		@UrinaryContinenceNoPlanReason) AS contPlanPerf	 
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[barthelRec]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[barthelRec](@stage varchar(20))
RETURNS @barthelTab TABLE(
	medical_history_id numeric(19,0),
	hospital_stay_id varchar(255),
	barthel_score TINYINT,
	barthel_id TINYINT
)
AS
BEGIN	
	INSERT INTO @barthelTab
	SELECT 
		c.medical_history_id AS medical_history_id,
		c.hospital_stay_id AS hospital_stay_id,
		CASE
			WHEN b.bowels >=0  OR b.bladder >=0 OR b.grooming >=0 OR b.toilet >=0 OR b.feeding  >=0	
			OR b.transfer  >=0 OR b.mobility  >=0 OR b.dressing >=0 OR b.stairs  >=0 OR b.bathing  >=0
 THEN (b.bowels +  b.bladder +  b.grooming  +  b.toilet + b.feeding + b.transfer   +  b.mobility   +  b.dressing  +  b.stairs  + b.bathing)
			ELSE b.manual_total
		END AS barthel_score,
		b.id AS barthel_id
								
		

	FROM 
		dbo.care_activity AS c
	LEFT OUTER JOIN
		dbo.therapy_management as thmg
		ON c.therapy_management_id = thmg.id
	LEFT OUTER JOIN
		dbo.assessment_management AS asmg
		ON thmg.assessment_management_id = asmg.id
	LEFT OUTER JOIN
		dbo.barthel AS b
		ON b.assessment_management_id = asmg.id
	JOIN
		dbo.pathway_stage AS pstg
		ON b.pathway_stage_id = pstg.id 
		AND pstg.description = @stage	
	RETURN
END
GO
/****** Object:  Table [dbo].[evaluation]    Script Date: 07/22/2013 16:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluation](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[date_evaluated] [datetime] NOT NULL,
	[time_evaluated] [int] NOT NULL,
	[evaluator_id] [numeric](19, 0) NOT NULL,
	[care_activity_id] [numeric](19, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[como1]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[como1]() 
RETURNS @comoTab TABLE 
	( 
		previous_stroke varchar(1),
		previous_tia varchar(1),
		diabetes varchar(1),
		atrial_fibrillation varchar(1),
		myocardial_infarction varchar(1),
		hyperlipidaemia varchar(1),
		hypertension varchar(1),
		valvular_heart_disease varchar(1),
		ischaemic_heart_disease varchar(1),
		congestive_heart_failure varchar(1)
     )
AS
BEGIN 
	INSERT INTO @comoTab

	SELECT  

	CASE 
		WHEN ISNULL(previousStroke.value,'false') = 'false' THEN 'N'
		ELSE 'Y'
	END,
	CASE 
		WHEN ISNULL(previousTia.value,'false') = 'false' THEN 'N'
		ELSE 'Y'
	END,
	CASE 
		WHEN ISNULL(diabetes.value,'false') = 'false' THEN 'N'
		ELSE 'Y'
	END,
	CASE 
		WHEN ISNULL(atrialFibrilation.value,'false') = 'false' THEN 'N'
		ELSE 'Y'
	END,
	CASE 
		WHEN ISNULL(mycardialInfarction.value,'false') = 'false' THEN 'N'
		ELSE 'Y'
	END,		
	CASE 
		WHEN ISNULL(_hyperlipidaemia.value,'false') = 'false' THEN 'N'
		ELSE 'Y'
	END,
	CASE 
		WHEN ISNULL(_hypertension.value,'false') = 'false' THEN 'N'
		ELSE 'Y'
	END,
	CASE 
		WHEN ISNULL(valvularHeartDisease.value,'false') = 'false' THEN 'N'
		ELSE 'Y'
	END,
	CASE 
		WHEN ISNULL(ischaemicHeartDisease.value,'false') = 'false' THEN 'N'
		ELSE 'Y'
	END,	
	CASE 
		WHEN ISNULL(congestiveHeartDisease.value,'false') = 'false' THEN 'N'
		ELSE 'Y'
	END
	
	FROM 
		dbo.care_activity AS care
	JOIN [dbo].[comorbidity] AS previousStroke
	ON care.medical_history_id = previousStroke.medical_history_id
	JOIN [dbo].[comorbidity_type] AS previousStroke_d 
		ON previousStroke.type_id = previousStroke_d.id 
		AND previousStroke_d.description = 'previous stroke'

	JOIN [dbo].[comorbidity] AS previousTia 
		ON care.medical_history_id = previousTia.medical_history_id
	JOIN [dbo].[comorbidity_type] AS previousTia_d 
		ON previousTia.type_id = previousTia_d.id 
		AND previousTia_d.description = 'previous tia'

	JOIN [dbo].[comorbidity] AS diabetes 
		ON care.medical_history_id = diabetes.medical_history_id
	JOIN [dbo].[comorbidity_type] AS diabetes_d 
		ON diabetes.type_id = diabetes_d.id 
		AND diabetes_d.description = 'diabetes'

	JOIN [dbo].[comorbidity] AS atrialFibrilation 
		ON care.medical_history_id = atrialFibrilation.medical_history_id
	JOIN [dbo].[comorbidity_type] AS atrialFibrilation_d 
		ON atrialFibrilation.type_id = atrialFibrilation_d.id 
		AND atrialFibrilation_d.description =  'atrial fibrillation'
		
		
		
	JOIN [dbo].[comorbidity] AS mycardialInfarction 
		ON care.medical_history_id = mycardialInfarction.medical_history_id
	JOIN [dbo].[comorbidity_type] AS mycardialInfarction_d 
		ON mycardialInfarction.type_id = mycardialInfarction_d.id 
		AND mycardialInfarction_d.description = 'myocardial infarction'
		
		 
	JOIN [dbo].[comorbidity] AS _hyperlipidaemia 
		ON care.medical_history_id = _hyperlipidaemia.medical_history_id
	JOIN [dbo].[comorbidity_type] AS _hyperlipidaemia_d 
		ON _hyperlipidaemia.type_id = _hyperlipidaemia_d.id 
		AND _hyperlipidaemia_d.description = 'hyperlipidaemia'
	 
		
	JOIN [dbo].[comorbidity] AS _hypertension 
		ON care.medical_history_id = _hypertension.medical_history_id
	JOIN [dbo].[comorbidity_type] AS _hypertension_d 
		ON _hypertension.type_id = _hypertension_d.id 
		AND _hypertension_d.description = 'hypertension'
	 
		
	JOIN [dbo].[comorbidity] AS valvularHeartDisease 
		ON care.medical_history_id = valvularHeartDisease.medical_history_id
	JOIN [dbo].[comorbidity_type] AS valvularHeartDisease_d 
		ON valvularHeartDisease.type_id = valvularHeartDisease_d.id 
		AND valvularHeartDisease_d.description = 'valvular heart disease'
	
	
		
	JOIN [dbo].[comorbidity] AS ischaemicHeartDisease 
		ON care.medical_history_id = ischaemicHeartDisease.medical_history_id
	JOIN [dbo].[comorbidity_type] AS ischaemicHeartDisease_d 
		ON ischaemicHeartDisease.type_id = ischaemicHeartDisease_d.id 
		AND ischaemicHeartDisease_d.description = 'ischaemic heart disease'
	
	
	
	JOIN [dbo].[comorbidity] AS congestiveHeartDisease 
		ON care.medical_history_id = congestiveHeartDisease.medical_history_id
	JOIN [dbo].[comorbidity_type] AS congestiveHeartDisease_d 
		ON congestiveHeartDisease.type_id = congestiveHeartDisease_d.id 
		AND congestiveHeartDisease_d.description = 'congestive heart failure'
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[como]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[como]() 
RETURNS @comoTab TABLE 
	( 
		hospital_stay_id varchar(255),
		medical_history_id numeric(19,0),
		previous_stroke varchar(1),
		previous_tia varchar(1),
		diabetes varchar(1),
		atrial_fibrillation varchar(1),
		myocardial_infarction varchar(1),
		hyperlipidaemia varchar(1),
		hypertension varchar(1),
		valvular_heart_disease varchar(1),
		ischaemic_heart_disease varchar(1),
		congestive_heart_failure varchar(1)
     )
AS
BEGIN 
	INSERT INTO @comoTab

	SELECT  

		hospital_stay_id,
		medical_history_id, 
		CASE WHEN [1] = 1 THEN 'Y' ELSE 'N' END AS previous_stroke, 
		CASE WHEN [2] = 1 THEN 'Y' ELSE 'N' END AS previous_tia,
		CASE WHEN [3] = 1 THEN 'Y' ELSE 'N' END AS diabetes,
		CASE WHEN [4] = 1 THEN 'Y' ELSE 'N' END AS atrial_fibrillation,
		CASE WHEN [5] = 1 THEN 'Y' ELSE 'N' END AS myocardial_infarction,
		CASE WHEN [6] = 1 THEN 'Y' ELSE 'N' END AS hyperlipidaemia,
		CASE WHEN [7] = 1 THEN 'Y' ELSE 'N' END AS hypertension,
		CASE WHEN [8] = 1 THEN 'Y' ELSE 'N' END AS valvular_heart_disease,
		CASE WHEN [9] = 1 THEN 'Y' ELSE 'N' END AS ischaemic_heart_disease,
		CASE WHEN [10] = 1 THEN 'Y' ELSE 'N' END AS congestive_heart_failure
	FROM
		(SELECT c.medical_history_id, c.value, c.type_id, a.hospital_stay_id FROM comorbidity c JOIN care_activity a on c.medical_history_id = a.medical_history_id WHERE c.value = 'true') P
		PIVOT ( COUNT(P.value)
		FOR type_id IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10]))AS pvt ORDER BY medical_history_id 
	RETURN
END
GO
/****** Object:  View [dbo].[thrombolysis_view]    Script Date: 07/22/2013 16:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[thrombolysis_view] as
SELECT rs.hospital_number,
    convert(char(10), rs.[start_date], 103) as Admission,
    -- cast((rs.start_time / 60) as varchar(2)) + ':' + cast((rs.start_time % 60) as varchar(2)) as 'Start Time',
    convert(char(5), dateadd(MINUTE, rs.start_time, ''), 114) as 'Start Time',
	convert(char(10), rs.end_date, 103) as 'Admission End',
	convert(char(5), dateadd(MINUTE, rs.end_time, ''), 114) as 'End Time',
	--care_activity_properties_elt as 'Thrombolysis applied to patient',
	convert(char(10), thrombolysis_date, 103) as 'Thrombolysis Start',
	convert(char(5), dateadd(MINUTE, thrombolysis_time, ''), 114) as 'Thrombolysis Time',
	decision_maker_grade as 'Decision Maker',
	decision_maker_location,
	decision_maker_speciality,
	decision_maker_speciality_other,
	complications,
	follow_up_scan,
	
	rs.hospital_stay_id,
	ca.id

FROM report_start rs -- To know which start data to select that links to the care activity id
join care_activity ca on ca.id = rs.id
left JOIN thrombolysis thromb on thromb.id = ca.thrombolysis_id

-- cacap.care_activity_properties is the care id
join care_activity_care_activity_properties cacap on cacap.care_activity_properties = ca.id
where care_activity_properties_idx = 'thrombolysed'
GO
/****** Object:  View [dbo].[treatment_view]    Script Date: 07/22/2013 16:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[treatment_view] as

SELECT rs.hospital_number,
    convert(char(10), rs.[start_date], 103) as Admission,
    -- cast((rs.start_time / 60) as varchar(2)) + ':' + cast((rs.start_time % 60) as varchar(2)) as 'Start Time',
    convert(char(5), dateadd(MINUTE, rs.start_time, ''), 114) as 'Start Time',
	convert(char(10), rs.end_date, 103) as 'Admission End',
	convert(char(5), dateadd(MINUTE, rs.end_time, ''), 114) as 'End Time',
	
	
	rs.hospital_stay_id,
	ca.id

FROM report_start rs -- To know which start data to select that links to the care activity id, add a link
join care_activity ca on ca.id = rs.id
right join treatment t on t.care_activity_id = ca.id
join treatment_type tt on tt.id = t.type_id

-- cacap.care_activity_properties is the care id
-- join care_activity_care_activity_properties cacap on cacap.care_activity_properties = ca.id
-- where care_activity_properties_idx = 'inRandomisedTrial'
GO
/****** Object:  UserDefinedFunction [dbo].[imageRec]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[imageRec]() 
RETURNS @imageTab TABLE (
	medical_history_id numeric(19,0),
	brainImagingDateTime varchar(16) ,
	brainImagingTimeNotEntered varchar(1),
	brainImagingNotPerformed varchar(1),
	strokeType varchar(3),
	imageType varchar(3)
	)
AS
BEGIN
	INSERT INTO @imageTab
    SELECT 
		a.medical_history_id,
		CASE 
			WHEN ISNULL(i.scan_post_stroke,'unknown') <> 'yes' THEN ''
			WHEN ISNULL(m.inpatient_at_onset,0) = 0 AND  dbo.isBefore(s.taken_date, s.taken_time, patient.hospital_admission_date, patient.hospital_admission_time) = 1
				THEN  dbo.makeDatetime(patient.hospital_admission_date, ISNULL(patient.hospital_admission_time,0)+1)
			WHEN ISNULL(m.inpatient_at_onset,0) = 1 AND  dbo.isBefore(s.taken_date, s.taken_time, m.onset_date, m.onset_time) = 1
				THEN  dbo.makeDatetime(m.onset_date, m.onset_time+1)				
			ELSE dbo.makeDatetime(s.taken_date, s.taken_time)
		END
		AS takenDatetime, 
		CASE
			WHEN ISNULL(i.scan_post_stroke,'unknown') = 'yes' AND s.taken_time IS NULL THEN '1' 			
			WHEN ISNULL(i.scan_post_stroke,'unknown') = 'yes' AND s.taken_time IS NOT NULL THEN '0'
			ELSE ''
		END
		AS timeNotEntered,
		CASE
			WHEN ISNULL(i.scan_post_stroke,'unknown') <> 'yes' THEN '1'
			ELSE ''
		END
		AS brainImagingNotPerformed,
		CASE 
			WHEN ISNULL(i.scan_post_stroke,'unknown') = 'yes' AND s.diagnosis_type_id = 2 THEN 'I'
			WHEN ISNULL(i.scan_post_stroke,'unknown') = 'yes' AND s.diagnosis_type_id = 3 THEN 'PIH'
			ELSE ''
		END
		AS strokeType,
		imgt.description AS imageType
	FROM
		dbo.care_activity AS a
	LEFT OUTER JOIN
		dbo.medical_history AS m ON a.medical_history_id = m.id
	LEFT OUTER JOIN
		dbo.imaging AS i ON a.imaging_id = i.id
	LEFT OUTER JOIN
		dbo.scan AS s ON i.scan_id = s.id
	LEFT OUTER JOIN
		dbo.image_type AS imgt ON imgt.id = s.image_type_id
	LEFT OUTER JOIN
		dbo.patient_data AS patient ON a.patient_id = patient.id		
	RETURN
END
GO
/****** Object:  View [dbo].[imaging_view]    Script Date: 07/22/2013 16:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[imaging_view] as

SELECT rs.hospital_number,
    convert(char(10), rs.[start_date], 103) as Admission,
    -- cast((rs.start_time / 60) as varchar(2)) + ':' + cast((rs.start_time % 60) as varchar(2)) as 'Start Time',
    convert(char(5), dateadd(MINUTE, rs.start_time, ''), 114) as 'Start Time',
	convert(char(10), rs.end_date, 103) as 'Admission End',
	convert(char(5), dateadd(MINUTE, rs.end_time, ''), 114) as 'End Time',
	
	
	rs.hospital_stay_id,
	ca.id

FROM report_start rs -- To know which start data to select that links to the care activity id, add a link
join care_activity ca on ca.id = rs.id


-- cacap.care_activity_properties is the care id
-- join care_activity_care_activity_properties cacap on cacap.care_activity_properties = ca.id
-- where care_activity_properties_idx = 'inRandomisedTrial'
GO
/****** Object:  UserDefinedFunction [dbo].[spchThpy]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[spchThpy]()
RETURNS @spchThpyTab TABLE(
	care_activity_id numeric(19,0),
	medical_history_id numeric(19,0),
	hospital_stay_id varchar(255),
	spchThpy_id numeric(19,0),
	spchThpyComms72HrsDateTime varchar(16),
	spchThpyComms72HrsTimeNotEntered varchar(1),
	spchThpyComms72HrsNotAssessed varchar(1),
	spchThpyComms72HrsNotAssessedReason  varchar(2),
	spchThpySwallow72HrsDateTime varchar(16),
	spchThpySwallow72HrsTimeNotEntered varchar(1),
	spchThpySwallow72HrsNotAssessed varchar(1),
	spchThpySwallow72HrsNotAssessedReason  varchar(2),
	therapyRequired VARCHAR(1),
	therapyDays VARCHAR(40),
	therapyMinutes VARCHAR(60),
	spchThpyCommsByDischargeDateTime varchar(16),
	spchThpyCommsByDischargeTimeNotEntered varchar(1),
	spchThpyCommsByDischargeNotAssessed varchar(1),
	spchThpyCommsByDischargeNotAssessedReason  varchar(2),
	spchThpySwallowByDischargeDateTime varchar(16),
	spchThpySwallowByDischargeTimeNotEntered varchar(1),
	spchThpySwallowByDischargeNotAssessed varchar(1),
	spchThpySwallowByDischargeNotAssessedReason  varchar(2)
	
)
AS
BEGIN	
	INSERT INTO @spchThpyTab
	SELECT	
		c.id AS care_activity_id, 		
		c.medical_history_id AS medical_history_id,		
		c.hospital_stay_id AS hospital_stay_id,
		o.id,		
		
		CASE 
			WHEN ISNULL(o.communication_assessment_performed_in72hrs,0) <> 1 THEN ''
			ELSE dbo.makeDateTime(o.communication_assessment_date, o.communication_assessment_time) 
		END 
		AS spchThpyComms72HrsDateTime,
				
		CASE
			WHEN ISNULL(o.communication_assessment_performed_in72hrs,0) =1 AND o.communication_assessment_time IS NULL THEN '1'
			ELSE ''
		END
		AS spchThpyComms72HrsTimeNotEntered,
		
		CASE
			WHEN ISNULL(o.communication_assessment_performed_in72hrs,0)  <> 1  THEN '1'			
			ELSE '0'
		END 
		AS spchThpyComms72HrsNotAssessed,
		
		CASE			
			WHEN o.communication_assessment_performed_in72hrs = 1 THEN ''						
			WHEN ncr2.description IS NULL THEN 'NK'
			WHEN ncr2.description = 'organisational' THEN 'OR'
			WHEN ncr2.description = 'refused' THEN 'PR'
			WHEN ncr2.description = 'unwell' THEN 'PU'
			WHEN ncr2.description = 'noproblem' THEN 'ND'
			ELSE 'NK'
		END
		AS spchThpyComms72HrsNotAssessedReason,
		
		

		CASE 
			WHEN ISNULL(o.swallowing_assessment_performed_in72hrs,0) <> 1 THEN ''
			ELSE dbo.makeDateTime(o.swallowing_assessment_date, o.swallowing_assessment_time) 
		END 
		AS spchThpySwallow72HrsDateTime,
		
		
		CASE
			WHEN ISNULL(o.swallowing_assessment_performed_in72hrs,0) = 1 AND o.swallowing_assessment_time IS NULL THEN '1'
			ELSE '0'
		END
		AS spchThpySwallow72HrsTimeNotEntered,
		
		CASE
			WHEN ISNULL(o.swallowing_assessment_performed_in72hrs,0) = 0  THEN '1'			
			ELSE '0'
		END 
		AS spchThpySwallow72HrsNotAssessed,
		
		CASE			
			WHEN ISNULL(o.swallowing_assessment_performed_in72hrs,0) = 1 THEN ''						
			WHEN nsr2.description IS NULL THEN 'NK'
			WHEN nsr2.description = 'organisational' THEN 'OR'
			WHEN nsr2.description = 'refused' THEN 'PR'
			WHEN nsr2.description = 'unwell' THEN 'PU'
			WHEN nsr2.description = 'noproblem' THEN 'ND'
			WHEN nsr2.description = 'passedswallowscreen' THEN 'PS'
			ELSE 'NK'
		END
		AS spchThpySwallow72HrsNotAssessedReason,
		
		--
		
		CASE 
			WHEN ISNULL(o.therapy_required,0) = 0 THEN 'N' 
			ELSE  'Y'
		END AS therapyRequired,
		
		CASE 
			WHEN ISNULL(o.therapy_required,0) = 1 THEN CAST( ISNULL(o.days_of_therapy,0) AS VARCHAR(40) ) 
			ELSE ''
		END AS therapyDays,
		
		CASE 
			WHEN ISNULL(o.therapy_required,0) = 1 THEN CAST (ISNULL(o.minutes_of_therapy,0) AS VARCHAR(60))
			ELSE ''
		END AS therapyMinutes,
		
		 --
		 
		CASE 
			WHEN o.communication_assessment_performed <> 1 THEN ''
			WHEN o.swallowing_assessment_date IS NULL THEN ''
			WHEN nsr.description = 'noproblem' THEN ''
			WHEN dbo.withinHours(c.start_date, ISNULL(c.start_time,0), o.communication_assessment_date, o.communication_assessment_time, 72) = 1 THEN ''
			WHEN patient.S7StrokeUnitDischargeDateTime IS NULL  THEN ''
			-- WHEN DATEDIFF(MINUTE, DATEADD(minute, patient.stroke_ward_discharge_time,patient.stroke_ward_discharge_date), DATEADD(minute, ISNULL(o.swallowing_assessment_time, 0), o.swallowing_assessment_date)) < 0 THEN ''
			ELSE dbo.makeDateTime(o.communication_assessment_date, o.communication_assessment_time) 
		END 
		AS spchThpyCommsByDischargeDateTime,
				
		CASE
			WHEN o.communication_assessment_time IS NULL THEN '1'
			ELSE '0'
		END
		AS spchThpyCommsByDischargeTimeNotEntered,
		
		CASE
			WHEN ISNULL(o.communication_assessment_performed,0) = 1 THEN '0'			
			ELSE '1'
		END 
		AS spchThpyCommsByDischargeNotAssessed,
		
		CASE			
			WHEN ISNULL(o.communication_assessment_performed,0) = 1 THEN ''						
			WHEN ncr.description IS NULL THEN 'NK'
			WHEN ncr.description = 'organisational' THEN 'OR'
			WHEN ncr.description = 'refused' THEN 'PR'
			WHEN ncr.description = 'unwell' THEN 'PU'
			WHEN ncr.description = 'noproblem' THEN 'ND'
			ELSE 'NK'
		END
		AS spchThpyCommsByDischargeNotAssessedReason,
		
		
		CASE /* --- */
			WHEN ISNULL(o.swallowing_assessment_performed,0) = 0 THEN ''
			WHEN nsr.description = 'passedswallowscreen' THEN ''
			WHEN dbo.withinHours(c.start_date, ISNULL(c.start_time,0), o.swallowing_assessment_date, o.swallowing_assessment_time, 72) = 1 THEN ''
			WHEN patient.S7StrokeUnitDischargeDateTime IS NULL  THEN ''
			-- ideally the date should be before discharge 
			-- WHEN DATEDIFF(MINUTE, DATEADD(minute, patient.stroke_ward_discharge_time,patient.stroke_ward_discharge_date), DATEADD(minute, ISNULL(o.swallowing_assessment_time, 0), o.swallowing_assessment_date)) < 0 THEN ''
			
			ELSE dbo.makeDateTime(o.swallowing_assessment_date, o.swallowing_assessment_time) 
			 
		END 
		AS spchThpySwallowByDischargeDateTime,
		
		
		CASE
			WHEN o.communication_assessment_time IS NULL THEN '1'
			ELSE '0'
		END
		AS spchThpySwallowByDischargeTimeNotEntered,
		
		CASE
			WHEN ISNULL(o.swallowing_assessment_performed, 0) = 0 THEN '1'
			ELSE '0'
		END 
		AS spchThpySwallowByDischargeNotAssessed,
		
		CASE			
			WHEN ISNULL(o.swallowing_assessment_performed,0) = 1 THEN ''						
			WHEN nsr.description IS NULL THEN 'NK'
			WHEN nsr.description = 'organisational' THEN 'OR'
			WHEN nsr.description = 'refused' THEN 'PR'
			WHEN nsr.description = 'unwell' THEN 'MU'
			ELSE 'NK'
		END
		AS spchThpySwallowByDischargeNotAssessedReason		

		
	FROM 
		dbo.care_activity AS c
	LEFT OUTER JOIN
		dbo.therapy_management t
		ON c.therapy_management_id = t.id
	LEFT OUTER JOIN
		dbo.speech_and_language_therapy_management AS o
		ON t.speech_and_language_therapy_management_id = o.id
	LEFT OUTER JOIN
		dbo.communication_no_assessment_reason_type AS ncr	
		ON o.no_communication_assessment_reason_type_id = ncr.id
	LEFT OUTER JOIN
		dbo.communication_no_assessment_reason_type AS ncr2	
		ON o.no72hr_communication_assessment_reason_type_id = ncr2.id
	LEFT OUTER JOIN
		dbo.swallowing_no_assessment_reason_type AS nsr
		ON o.no_swallowing_assessment_reason_type_id = nsr.id
	LEFT OUTER JOIN
		dbo.swallowing_no_assessment_reason_type AS nsr2
		ON o.no72hr_swallowing_assessment_reason_type_id = nsr2.id	
	LEFT OUTER JOIN 
		dbo.patient_data AS patient
		ON c.patient_id = patient.id
	RETURN
	
END
GO
/****** Object:  UserDefinedFunction [dbo].[swallowScreen]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[swallowScreen]()
RETURNS @swallowScreenTab TABLE(
	hospital_stay_id varchar(255),
	medical_history_id numeric(19,0),
	swallowScreen4hrsDateTime varchar(16),
	swallowScreen4hrsTimeNotEntered VARCHAR(1),
	swallowScreen4hrsNotPerformed VARCHAR(1),
	swallowScreen4hrsNotPerformedReason CHAR(2),
	swallowScreen72hrsDateTime varchar(16),
	swallowScreen72hrsTimeNotEntered VARCHAR(1),
	swallowScreen72hrsNotPerformed VARCHAR(1),
	swallowScreen72hrsNotPerformedReason VARCHAR(2),
	admissionDate varchar(16)
)
AS
BEGIN	
	INSERT INTO @swallowScreenTab
	SELECT 
		c.hospital_stay_id AS hospital_stay_id,
		c.medical_history_id AS medical_history_id,
		
		CASE
			WHEN s.swallow_screen_date IS NULL THEN ''
			WHEN ISNULL(s.swallow_screen_performed,0) = 0 THEN ''
			WHEN ISNULL(m.inpatient_at_onset,0) = 0 AND dbo.isBefore(s.swallow_screen_date, ISNULL(s.swallow_screen_time,0), patient.hospital_admission_date, patient.hospital_admission_time) = 1
				THEN  dbo.makeDatetime(patient.hospital_admission_date, ISNULL(patient.hospital_admission_time,0)+1)
			WHEN ISNULL(m.inpatient_at_onset,0) = 1 AND  dbo.isBefore(s.swallow_screen_date, ISNULL(s.swallow_screen_time,0), m.onset_date, m.onset_time) = 1
				THEN  dbo.makeDatetime(m.onset_date, m.onset_time+1)			
			WHEN dbo.withinHours(c.start_date, ISNULL(c.start_time,0), s.swallow_screen_date, ISNULL(s.swallow_screen_time,0), 4) = 1 THEN dbo.makeDatetime(s.swallow_screen_date, s.swallow_screen_time) 
			ELSE ''
		END AS swallowScreen4hrsDateTime,
								
		CASE
			WHEN ISNULL(s.swallow_screen_performed,0) = 0 THEN ''	
			WHEN s.swallow_screen_date IS NULL THEN ''			
			WHEN dbo.withinHours(c.start_date, ISNULL(c.start_time,0), s.swallow_screen_date, ISNULL(s.swallow_screen_time,0), 4) = 0 THEN  ''
			ELSE ''		
		END 
		AS swallowScreen4hrsTimeNotEntered,
		
		CASE
			WHEN ISNULL(s.swallow_screen_performed,0) = 0 THEN '1'
			WHEN s.swallow_screen_date IS NULL THEN '1'			
			WHEN dbo.withinHours(c.start_date, ISNULL(c.start_time,0), s.swallow_screen_date, ISNULL(s.swallow_screen_time,0), 4) = 0 THEN '1'
			ELSE '0'
		END AS swallowScreen4hrsNotPerformed,		
		
		CASE
			WHEN ISNULL(s.swallow_screen_performed,0) = 0 THEN dbo.getNoSwallowScreenCode(r72.description)
			WHEN dbo.withinHours(c.start_date, ISNULL(c.start_time,0), s.swallow_screen_date, ISNULL(s.swallow_screen_time,0), 4) = 0 THEN dbo.getNoSwallowScreenCode(r4.description)		
			ELSE ''
		END AS swallowScreen4hrsNotPerformedReason,
		
		CASE
			WHEN s.swallow_screen_date IS NULL THEN ''
			WHEN ISNULL(s.swallow_screen_performed,0) = 0 THEN ''
			WHEN dbo.withinHours(c.start_date, ISNULL(c.start_time,0), s.swallow_screen_date, ISNULL(s.swallow_screen_time,0), 4) = 0 AND dbo.withinHours(c.start_date, ISNULL(c.start_time,0), s.swallow_screen_date, ISNULL(s.swallow_screen_time,0), 72) = 1 THEN dbo.makeDatetime(s.swallow_screen_date, s.swallow_screen_time) 
			ELSE ''				
		END AS swallowScreen72hrsDateTime,
	
		CASE
			WHEN ISNULL(s.swallow_screen_performed,0) = 0 THEN ''	
			WHEN s.swallow_screen_date IS NULL THEN ''									
			WHEN dbo.withinHours(c.start_date, ISNULL(c.start_time,0), s.swallow_screen_date, ISNULL(s.swallow_screen_time,0), 4) = 0 
				AND dbo.withinHours(c.start_date, ISNULL(c.start_time,0), s.swallow_screen_date, ISNULL(s.swallow_screen_time,0), 72) = 1 
				AND s.swallow_screen_time IS NULL 
				THEN  '1'
			ELSE ''
		END 
		AS swallowScreen72hrsTimeNotEntered,
						
		CASE
			WHEN s.swallow_screen_date IS NULL THEN '1'
			WHEN s.swallow_screen_performed = 0 THEN '1'
			WHEN dbo.withinHours(c.start_date, ISNULL(c.start_time,0), s.swallow_screen_date, ISNULL(s.swallow_screen_time,0), 4) = 1 THEN ''
			WHEN dbo.withinHours(c.start_date, ISNULL(c.start_time,0), s.swallow_screen_date, ISNULL(s.swallow_screen_time,0), 72) = 0  
				THEN '1'
			ELSE '0'
		END AS swallowScreen72hrsNotPerformed,

		
		CASE
			WHEN ISNULL(s.swallow_screen_performed,0) = 0 THEN dbo.getNoSwallowScreenCode(r72.description)
			WHEN dbo.withinHours(c.start_date, ISNULL(c.start_time,0), s.swallow_screen_date, ISNULL(s.swallow_screen_time,0), 4) = 0 
			-- OR dbo.withinHours(c.start_date, ISNULL(c.start_time,0), s.swallow_screen_date, ISNULL(s.swallow_screen_time,0), 72) = 0  
				THEN dbo.getNoSwallowScreenCode(r72.description)
			ELSE ''
		END AS swallowScreen72hrsNotPerformedReason,
		
		dbo.makeDatetime(c.start_date, c.start_time)

	FROM 
		care_activity AS c 	
	LEFT OUTER JOIN
		clinical_assessment s
		ON c.clinical_assessment_id = s.id	
	LEFT OUTER JOIN
		no_swallow_screen_performed_reason_type as r4
		ON s.no_swallow_screen_performed_reason_at4hours_id = r4.id
	LEFT OUTER JOIN
		no_swallow_screen_performed_reason_type as r72
		ON s.no_swallow_screen_performed_reason_id = r72.id
	LEFT OUTER JOIN 
		dbo.patient_data AS patient 
		ON c.patient_id = patient.id
	LEFT OUTER JOIN
		dbo.medical_history AS m ON c.medical_history_id = m.id		
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[strkOnset]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[strkOnset]()
RETURNS @strkOnsetTab TABLE(
	care_activity_id numeric(19,0),
	medical_history_id numeric(19,0),
	hospital_stay_id varchar(255),
	strokeNurseAssessedDateTime varchar(16),
	strokeNurseAssessedTimeNotEntered char(1),
	strokeNurseNotAssessed char(1),
	strokeConsultantAssessedDateTime varchar(16),
	strokeConsultantAssessedTimeNotEntered char(1),
	strokeConsultantNotAssessed VARCHAR(10)
)
AS
BEGIN	
	INSERT INTO @strkOnsetTab
	SELECT
		c.id AS care_activity_id, 
		c.medical_history_id AS medical_history_id,
		c.hospital_stay_id AS hospital_stay_id,
		CASE 
			WHEN ISNULL(m.inpatient_at_onset,0) = 0 AND  dbo.isBefore(ne.date_evaluated, ne.time_evaluated, patient.hospital_admission_date, patient.hospital_admission_time) = 1
				THEN  dbo.makeDatetime(patient.hospital_admission_date, ISNULL(patient.hospital_admission_time,0)+1)
			WHEN ISNULL(m.inpatient_at_onset,0) = 1 AND  dbo.isBefore(ne.date_evaluated, ne.time_evaluated, m.onset_date, m.onset_time) = 1
				THEN  dbo.makeDatetime(m.onset_date, m.onset_time+1)
			ELSE
				ISNULL(dbo.makeDateTime( ne.date_evaluated, ne.time_evaluated),'') 
		END
		AS strokeNurseAssessedDateTime,
		CASE
			WHEN ne.time_evaluated IS NULL THEN '1'
			ELSE '0'
		END
		AS strokeNurseAssessedTimeNotEntered,
		
		CASE
			WHEN np.care_activity_properties_elt IS NULL THEN ''
			WHEN np.care_activity_properties_elt = 'true' THEN '1'
			ELSE '0'
		END
		AS strokeNurseNotAssessed,
		
		CASE 
			WHEN ISNULL(m.inpatient_at_onset,0) = 0 AND  dbo.isBefore(de.date_evaluated, de.time_evaluated, patient.hospital_admission_date, patient.hospital_admission_time) = 1
				THEN  dbo.makeDatetime(patient.hospital_admission_date, ISNULL(patient.hospital_admission_time,0)+1)
			WHEN ISNULL(m.inpatient_at_onset,0) = 1 AND  dbo.isBefore(de.date_evaluated, de.time_evaluated, m.onset_date, m.onset_time) = 1
				THEN  dbo.makeDatetime(m.onset_date, m.onset_time+1)
			ELSE
				ISNULL(dbo.makeDateTime( ne.date_evaluated, ne.time_evaluated),'') 
		END
		AS strokeConsultantAssessedDateTime,
		
		CASE
			WHEN de.time_evaluated IS NULL THEN '1'
			ELSE '0'
		END
		AS strokeConsultantAssessedTimeNotEntered,
				
		CASE
			WHEN dp.care_activity_properties_elt IS NULL THEN ''
			WHEN dp.care_activity_properties_elt = 'true' THEN '1'
			ELSE dp.care_activity_properties_elt
		END 
		AS strokeConsultantNotAssessed		
		
	FROM 
		dbo.care_activity AS c
	LEFT OUTER JOIN
		dbo.medical_history AS m ON c.medical_history_id = m.id
	LEFT OUTER JOIN
		dbo.patient_data AS patient ON c.patient_id = patient.id				
	LEFT OUTER JOIN
		dbo.evaluation AS ne
		ON ne.care_activity_id = c.id
		AND ne.evaluator_id = 2
	LEFT OUTER JOIN
		dbo.evaluation AS de
		ON de.care_activity_id = c.id
		AND de.evaluator_id = 3	
	LEFT OUTER JOIN 
		care_activity_care_activity_properties np 
			ON np.care_activity_properties = c.id
			AND np.care_activity_properties_idx = 'Ward based nurse not seen'		
	LEFT OUTER JOIN 
		care_activity_care_activity_properties dp 
			ON  c.id = dp.care_activity_properties
			AND dp.care_activity_properties_idx = 'Stroke consultant not seen'		

	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[postDchg]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[postDchg]()
RETURNS @postDchgTab TABLE(
    post_discharge_care_id numeric(19,0),
	care_activity_id numeric(19,0),
	medical_history_id numeric(19,0),
	hospital_stay_id varchar(255),
	end_rehab_date varchar(10),
	discharge_type VARCHAR(2),
    transfer_team_code VARCHAR(4),	
	care_home_discharge VARCHAR(3),
	care_home_discharge_type VARCHAR(1),
	home_discharge_type varchar(3),
	discharged_esdmt varchar(3),
	discharged_mcrt varchar(3),
	adl_help varchar(1),
	adl_help_type varchar(3),
	discharge_visits_per_week VARCHAR(1),
	discharge_visits_per_week_nk VARCHAR(1),
	discharge_atrial_fibrilation VARCHAR(1),
	discharge_atrial_fibrillation_anticoagulation VARCHAR(2),
	discharge_joint_care_planning VARCHAR(2),
	discharge_named_contact VARCHAR(1),
	discharge_barthel TINYINT,
	discharge_pi_consent  VARCHAR(2),
	palliativeCare varchar(1),
	palliativeCareDecisionDate varchar(10),
	endOfLifePathway varchar(1)
)
AS
BEGIN	
	INSERT INTO @postDchgTab
	SELECT	
	    pdc.id AS post_discharge_care_id,
		c.id AS care_activity_id, 		
		c.medical_history_id AS medical_history_id,		
		c.hospital_stay_id AS hospital_stay_id,
		CASE
			WHEN LEN(ISNULL(patient.S7DeathDate,'')) > 0 AND patient.S7StrokeUnitDeath = 'Y'  THEN ''
			WHEN pdc.discharged_to = 'otherHospital' THEN ''
			WHEN c.fit_for_discharge_date IS NULL THEN '' 
			ELSE CONVERT(VARCHAR(10), c.fit_for_discharge_date, 103)  
		END
		AS end_rehab_date,
		CASE
			WHEN LEN(ISNULL(patient.S7DeathDate,'')) > 0 AND patient.S7StrokeUnitDeath = 'Y' THEN 'D'
			WHEN pdc.discharged_to = 'nursingCareHome' THEN 'CH'
			WHEN pdc.discharged_to = 'residentialCareHome' THEN 'CH'
			WHEN pdc.discharged_to = 'home' THEN 'H'
			WHEN pdc.discharged_to = 'otherHospital' THEN 'TC'
			WHEN pdc.discharged_to = 'somewhere' THEN 'SE'
			WHEN pdc.discharged_to = 'intermediateCare' THEN 'T'
			WHEN pdtt.ESD = 'Y' THEN 'TC'
			WHEN pdtt.Generic_Comm_Care = 'Y' THEN 'TC'
			ELSE ''
		END
		AS discharge_type,
		CASE
			WHEN pdc.discharged_to = 'intermediateCare' THEN pdc.new_care_team
			WHEN pdc.discharged_to = 'otherHospital' THEN pdc.new_care_team
			ELSE ''
		END AS transfer_team_code,
		CASE			
			WHEN pdc.discharged_to <> 'residentialCareHome' THEN ''
			WHEN pdc.patient_previously_resident = 0 THEN 'NPR'
			WHEN pdc.patient_previously_resident = 1 THEN 'PR'
			ELSE ''
		END
		AS care_home_discharge,
		CASE			
			WHEN pdc.discharged_to <> 'residentialCareHome' THEN ''
			WHEN pdc.temporary_or_permanent = 'perm' THEN 'P'
			WHEN pdc.temporary_or_permanent = 'temporary' THEN 'T'
			ELSE ''
		END
		AS care_home_discharge_type,
		CASE
			WHEN pdc.discharged_to <> 'home' THEN ''
			WHEN pdc.alone_post_discharge = 1 THEN 'LA'
			WHEN pdc.alone_post_discharge = 0 THEN 'NLA'
			WHEN pdc.alone_post_discharge_unknown = 1 THEN 'NK'
			ELSE '' 
		END 
		AS home_discharge_type,
		CASE
			WHEN LEN(ISNULL(patient.S7DeathDate,'')) > 0 OR patient.S7StrokeUnitDeath = 'Y'  THEN '' -- In case the patient died 
			WHEN pdc.discharged_to = 'otherHospital' THEN '' 
			WHEN pdst.Stroke_neurology_specific_community_rehabilitation_team = 'Y' THEN 'SNS'
			WHEN pdst.Non_specialist_community_rehabilitation_team = 'Y' THEN 'NS'
			ELSE 'N'
		END
		AS discharged_esdmt,
		CASE
			WHEN LEN(ISNULL(patient.S7DeathDate,'')) > 0 OR patient.S7StrokeUnitDeath = 'Y'  THEN '' -- In case the patient died 
			WHEN pdc.discharged_to = 'otherHospital' THEN '' 
			WHEN pdst.Stroke_neurology_specific_community_rehabilitation_team = 'Y' THEN 'SNS'
			WHEN pdst.Non_specialist_community_rehabilitation_team = 'Y' THEN 'NS'
			ELSE 'N'
		END
		AS discharged_mcrt,
		CASE
			WHEN LEN(ISNULL(patient.S7DeathDate,'')) > 0 OR patient.S7StrokeUnitDeath = 'Y'  THEN '' -- In case the patient died 
			WHEN pdc.discharged_to = 'otherHospital' THEN ''
			WHEN pdc.support_on_discharge_needed = 'Yes' THEN 'Y'
			ELSE 'N'
		END
		AS adl_help,
		CASE
			WHEN LEN(ISNULL(patient.S7DeathDate,'')) > 0 OR patient.S7StrokeUnitDeath = 'Y'  THEN '' -- In case the patient died 
			WHEN pdc.discharged_to = 'otherHospital' THEN ''
			WHEN ISNULL(pdc.support_on_discharge_needed,'No') = 'No' THEN ''
			WHEN pdst.Social_Services = 'Y' AND pdst.Informal_Carers = 'Y' THEN 'PIC'
			WHEN pdst.Social_Services = 'Y' THEN 'PC'
			WHEN pdst.Informal_Carers = 'Y' THEN 'IC'
			WHEN pdst.Social_Services_Unavailable = 'Y' THEN 'U'
			WHEN pdst.Patient_Refused = 'Y' THEN 'PR'
			ELSE '' -- @TODO SSNAP 7.9.1 - No 'PIC' option  
		END as adl_help_type,
		CASE
			WHEN LEN(ISNULL(patient.S7DeathDate,'')) > 0 OR patient.S7StrokeUnitDeath = 'Y'  THEN '' -- In case the patient died 
			WHEN pdc.discharged_to = 'otherHospital' THEN ''
			WHEN ISNULL(pdc.support_on_discharge_needed,'No') = 'No' THEN ''
			ELSE CAST ( ISNULL(pdc.number_of_social_service_visits,0) AS VARCHAR(1))
		END
		AS discharge_visits_per_week,
		
		CASE
			WHEN LEN(ISNULL(patient.S7DeathDate,'')) > 0 OR patient.S7StrokeUnitDeath = 'Y'  THEN '' -- In case the patient died 
			WHEN pdc.discharged_to = 'otherHospital' THEN ''
			WHEN ISNULL(pdc.support_on_discharge_needed,'No') = 'No' THEN ''
			WHEN pdc.number_of_social_service_visits IS NOT NULL THEN ''
			ELSE CAST ( ISNULL(pdc.number_of_social_service_visits_unknown,0) AS VARCHAR(1) )  
		END
		AS discharge_visits_per_week_nk,
		CASE
			WHEN LEN(ISNULL(patient.S7DeathDate,'')) > 0 OR patient.S7StrokeUnitDeath = 'Y'  THEN '' -- In case the patient died 
			WHEN pdc.discharged_to = 'otherHospital' THEN '' 
			WHEN c.in_af_on_discharge = 'Yes' THEN 'Y'
			WHEN c.in_af_on_discharge = 'No' THEN 'N'
			ELSE ''
		END
		AS discharge_atrial_fibrilation,
		CASE
			WHEN LEN(ISNULL(patient.S7DeathDate,'')) > 0 OR patient.S7StrokeUnitDeath = 'Y'  THEN '' -- In case the patient died 
			WHEN pdc.discharged_to = 'otherHospital' THEN ''
			WHEN c.in_af_on_discharge <> 'Yes' THEN ''
			WHEN c.on_anticoagulant_at_discharge = 'Yes' THEN 'Y'
			WHEN c.on_anticoagulant_at_discharge = 'No' THEN 'N'
			WHEN c.on_anticoagulant_at_discharge = 'NoBut' THEN 'NB'
			ELSE ''
		END AS discharge_atrial_fibrillation_anticoagulation,
		CASE
			WHEN LEN(ISNULL(patient.S7DeathDate,'')) > 0 OR patient.S7StrokeUnitDeath = 'Y'  THEN '' -- In case the patient died 
			WHEN pdc.discharged_to = 'otherHospital' THEN '' 
			WHEN pdc.documented_evidence = 'Yes' THEN 'Y'
			WHEN pdc.documented_evidence = 'No' THEN 'Y'
			WHEN pdc.documented_evidence = 'NotApplicable' THEN 'NA'
			ELSE ''
		END AS discharge_named_contact,
		CASE
			WHEN LEN(ISNULL(patient.S7DeathDate,'')) > 0 OR patient.S7StrokeUnitDeath = 'Y'  THEN '' -- In case the patient died 
			WHEN pdc.discharged_to = 'otherHospital' THEN '' 
			WHEN pdc.documentation_post_discharge = 1 THEN 'Y'
			WHEN pdc.documentation_post_discharge = 0 THEN 'N'
			ELSE ''
		END AS discharge_joint_care_planning, 
		barthel.barthel_score AS discharge_barthel,
		CASE
			WHEN ISNULL( arr.outcome_questionnair_opt_out, 0) = 1  THEN 'Y'
			ELSE ''			
		END	AS discharge_pi_consent,
		CASE
			WHEN ISNULL(pdc.palliative_care,'no') = 'yes' THEN 'Y'			
			ELSE 'N'
		END
		AS palliativeCare,
		CASE
			WHEN ISNULL(pdc.palliative_care,'no') = 'no' THEN ''
			WHEN pdc.palliative_care_date IS NULL THEN ''
			ELSE CONVERT( varchar(10), pdc.palliative_care_date, 103 )
		END
		AS palliativeCareDecisionDate,
		CASE
			WHEN ISNULL(pdc.palliative_care,'no') = 'no' THEN ''
			WHEN pdc.end_of_life_pathway = 'yes' THEN 'Y'
			ELSE 'N'
		END
		AS endOfLifePathway		
	FROM 
		dbo.care_activity AS c
	LEFT OUTER JOIN
		dbo.post_discharge_care pdc
		ON c.post_discharge_care_id = pdc.id
	LEFT OUTER JOIN
		dbo.postDchgSupport() AS pdst
		ON c.post_discharge_care_id = pdst.post_discharge_care_id
	LEFT OUTER JOIN
		dbo.postDchgThrpy() AS pdtt
		ON c.post_discharge_care_id = pdtt.post_discharge_care_id
	LEFT OUTER JOIN
		dbo.barthelRec('Discharge') As barthel 
		ON c.hospital_stay_id = barthel.hospital_stay_id
	LEFT OUTER JOIN	
		dbo.patient_data AS patient
		ON patient.id = c.patient_id
	LEFT OUTER JOIN 
		dbo.medical_history  AS MH
		ON mh.id = c.medical_history_id
	LEFT OUTER JOIN
		dbo.arrival AS arr
		ON arr.id = mh.arrival_id		
	RETURN
	
END
GO
/****** Object:  View [dbo].[discharge_view]    Script Date: 07/22/2013 16:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[discharge_view] as
SELECT rs.hospital_number,
    convert(char(10), rs.[start_date], 103) as Admission,
    -- cast((rs.start_time / 60) as varchar(2)) + ':' + cast((rs.start_time % 60) as varchar(2)) as 'Start Time',
    convert(char(5), dateadd(MINUTE, rs.start_time, ''), 114) as 'Start Time',
	convert(char(10), rs.end_date, 103) as 'Admission End',
	convert(char(5), dateadd(MINUTE, rs.end_time, ''), 114) as 'End Time',
	convert(char(10), fit_for_discharge_date, 103) as 'Ready for Discharge',
	social_worker_referral,
	convert(char(10), social_worker_referral_date, 103) as 'Social Worker Referral',
	social_worker_referral_unknown,
	social_worker_assessment,
	convert(char(10), social_worker_assessment_date, 103) as 'Social Worker Assessment',
	social_worker_assessment_unknown,
	esd_referral,
	convert(char(10), esd_referral_date, 103) as 'Early Supported Discharge Referral',
	esd_referral_date_unknown,
	caprt.care_activity_properties_elt as 'Enrolled on Randomised Stroke Trial',
	rs.hospital_stay_id,
	ca.id

FROM report_start rs -- To know which start data to select that links to the care activity id, add a link
join care_activity ca on ca.id = rs.id
left JOIN post_discharge_care pdc on pdc.id = ca.post_discharge_care_id
left join care_activity_property_randomised_trial caprt on ca.id = caprt.care_activity_properties

-- join care_activity_care_activity_properties cacap on cacap.care_activity_properties = ca.id
-- where care_activities_idx = 'inRandomisedTrial'
GO
/****** Object:  UserDefinedFunction [dbo].[physio]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[physio]()
RETURNS @physioTab TABLE(
	care_activity_id numeric(19,0),
	medical_history_id numeric(19,0),
	hospital_stay_id varchar(255),
	physio_id numeric(19,0),
	physio72HrsDateTime varchar(16),
	physio72HrsTimeNotEntered varchar(1),
	physio72HrsNotAssessed varchar(1),
	physio72HrsNotAssessedReason  varchar(2),
	physioRequired VARCHAR(1),
	physioDays VARCHAR(40),
	physioMinutes VARCHAR(60),
	physioByDischargeDateTime varchar(16),
	physioByDischargeTimeNotEntered varchar(1),
	physioByDischargeNotAssessed varchar(1),
	physioByDischargeNotAssessedReason  varchar(2)
)
AS
BEGIN	
	INSERT INTO @physioTab
	SELECT
		c.id AS care_activity_id, 
		c.medical_history_id AS medical_history_id,
		c.hospital_stay_id AS hospital_stay_id,
		o.id,
		CASE
			WHEN ISNULL(o.assessment_performed_in72hrs,0) <> 1 THEN ''
			WHEN o.assessment_date IS NULL THEN  ''
			ELSE dbo.makeDateTime( o.assessment_date, o.assessment_time) 
		END AS physio72HrsDateTime,
		
		CASE
			WHEN ISNULL(o.assessment_performed_in72hrs,0) = 1 AND o.assessment_time IS NULL THEN '1'
			ELSE ''
		END
		AS physio72HrsTimeNotEntered,
		
		CASE
			WHEN ISNULL(o.assessment_performed_in72hrs,0) = 0 THEN '1'			
			ELSE '0'
		END 
		AS physio72HrsNotAssessed,
		
		CASE			
			WHEN ISNULL(o.assessment_performed_in72hrs,0) = 1  THEN ''			
			WHEN r2.description IS NULL THEN 'NK'
			WHEN r2.description = 'organisational' THEN 'OR'
			WHEN r2.description = 'refused' THEN 'PR'
			WHEN r2.description = 'unwell' THEN 'PU'
			WHEN r2.description = 'noDeficit' THEN 'ND'
			ELSE 'NK'
		END
		AS physio72HrsNotAssessedReason,
		
		CASE 
			WHEN ISNULL(o.therapy_required,0) = 0 THEN 'N' 
			ELSE  'Y'
		END AS physioRequired,
		
		CASE 
			WHEN ISNULL(o.therapy_required,0) = 1 THEN cast(ISNULL(o.days_of_therapy,0) AS VARCHAR(40))
			ELSE ''
		END	AS physioDays,
		CASE 
			WHEN ISNULL(o.therapy_required,0) = 1 THEN cast(ISNULL(o.minutes_of_therapy,0) AS VARCHAR(60))
			ELSE ''
		END AS physioMinutes,
	
		
		CASE
		 
			WHEN ISNULL(o.assessment_performed,0) = 0 THEN ''
			WHEN r.description = 'noDeficit' THEN ''			
			--WHEN patient.S7StrokeUnitDischargeDateTime is null THEN ''
			--WHEN patient.stroke_ward_discharge_time IS NULL THEN ''
			--WHEN patient.stroke_ward_discharge_date IS NULL THEN ''
			--WHEN DATEDIFF(MINUTE, DATEADD(minute, patient.stroke_ward_discharge_time,patient.stroke_ward_discharge_date), DATEADD(minute, ISNULL(o.assessment_time, 0), o.assessment_date)) < 0 THEN ''
			ELSE dbo.makeDateTime(o.assessment_date, ISNULL(o.assessment_time, 0)) 
			 
		END
		AS physioByDischargeDateTime,
		
		
		CASE
			WHEN o.assessment_time IS NULL THEN '1'
			ELSE '0'
		END
		AS physioByDischargeTimeNotEntered,
		
		CASE
			WHEN ISNULL(o.assessment_performed, 0) = 0 THEN '1'
			ELSE '0'
		END 
		AS physioByDischargeNotAssessed,
		
		CASE			
			WHEN ISNULL(o.assessment_performed,0) = 1 THEN ''
			WHEN r.description IS NULL THEN 'NK'
			WHEN r.description = 'organisational' THEN 'OR'
			WHEN r.description = 'refused' THEN 'PR'
			WHEN r.description = 'unwell' THEN 'MU'
			WHEN r.description = 'noDeficit' THEN 'ND'
			ELSE 'NK'
		END
		AS physioByDischargeNotAssessedReason		
		
	FROM 
		dbo.care_activity AS c
	LEFT OUTER JOIN
		dbo.therapy_management t
		ON c.therapy_management_id = t.id
	LEFT OUTER JOIN
		dbo.physiotherapy_management AS o
		ON t.physiotherapy_management_id = o.id
	LEFT OUTER JOIN
		dbo.physiotherapy_no_assessment_reason_type AS r	
		ON o.no_assessment_reason_type_id = r.id
	LEFT OUTER JOIN
		dbo.physiotherapy_no_assessment_reason_type AS r2	
		ON o.no72hr_assessment_reason_type_id = r2.id
	LEFT OUTER JOIN 
		dbo.patient_data AS patient 
		ON c.patient_id = patient.id
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[noThromboReason]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[noThromboReason]()
RETURNS @noThromboReasonTab TABLE(
	hospital_stay_id varchar(255),
	medical_history_id numeric(19,0),
	strokeType VARCHAR(4),
	noThrombolysisOther VARCHAR(1),
	noThrombolysisMedication VARCHAR(1),
	noThrombolysisAge VARCHAR(1),
	noThrombolysisOutsideHours VARCHAR(1),
	noThrombolysisNotAvailable VARCHAR(1),
	noThrombolysisNone VARCHAR(1),
	noThrombolysisRefused VARCHAR(1),
	noThrombolysisTooLate VARCHAR(1),
	noThrombolysisComorbidity VARCHAR(1),
	noThrombolysisScanLate VARCHAR(1),
	noThrombolysisHaemorhagic VARCHAR(1),
	noThrombolysisSymptomsImproving VARCHAR(1),
	noThrombolysisTooMildOrTooSevere VARCHAR(1), 
	noThrombolysisOnsetTimeUnknown VARCHAR(1),
	noThrombolysisReason VARCHAR(4),
	x varchar(max) 
)
AS
BEGIN
	
	INSERT INTO @noThromboReasonTab
	SELECT 
		c.hospital_stay_id AS hospital_stay_id,
		c.medical_history_id AS medical_history_id,
		img.strokeType AS strokeType,
		CONVERT(VARCHAR(1), dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisOther') ),
		CONVERT(VARCHAR(1), dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisMedication')),
		CONVERT(VARCHAR(1), dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisAge' )),
		CONVERT(VARCHAR(1), dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisOutsideHours')),
		CONVERT(VARCHAR(1), dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisNotAvailable')),
		CONVERT(VARCHAR(1), dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisNone')),
		CONVERT(VARCHAR(1), dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisRefused')),
		CONVERT(VARCHAR(1), dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisTooLate')),
		CONVERT(VARCHAR(1), dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisComorbidity')),
		CONVERT(VARCHAR(1), dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisScanLate')),
		CONVERT(VARCHAR(1), dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisHaemorrhagicStroke')),
		CONVERT(VARCHAR(1), dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisSymptomsImproving')),
		CONVERT(VARCHAR(1), dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisTooMildOrTooSevere')), 
		CONVERT(VARCHAR(1), dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisOnsetTimeUnknown')),
		CASE
			WHEN img.strokeType = 'PIH' THEN ''
			WHEN dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisOutsideHours') = 1 THEN  'OTSH'
			WHEN dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisNotAvailable') = 1 THEN  'TNA'
			WHEN dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisScanLate') = 1 THEN  'USQE'
			WHEN dbo.propertyParser( p.care_activity_properties_elt, 'noThrombolysisNone') = 1 THEN  'N'
		END AS noThrombolysisReason,
		p.care_activity_properties_elt
	FROM 
		care_activity AS c				
	LEFT OUTER JOIN 
		care_activity_care_activity_properties p 
			ON p.care_activity_properties = c.id
			AND p.care_activity_properties_idx = 'reasonsNotThrombolysed'
	LEFT OUTER JOIN
	    dbo.imageRec() as img ON c.medical_history_id = img.medical_history_id
	UPDATE @noThromboReasonTab 
	   SET
			noThrombolysisOther = '',
			noThrombolysisMedication = '',
			noThrombolysisAge = '',
			noThrombolysisOutsideHours = '',
			noThrombolysisNotAvailable = '',
			noThrombolysisNone = '',
			noThrombolysisRefused = '',
			noThrombolysisTooLate = '',
			noThrombolysisComorbidity = '',
			noThrombolysisScanLate = '',
			noThrombolysisHaemorhagic = '',
			noThrombolysisSymptomsImproving = '',
			noThrombolysisTooMildOrTooSevere = '', 
			noThrombolysisOnsetTimeUnknown = ''
     WHERE 	ISNULL(noThrombolysisReason,'X') IN ( 'OTSH','TNA', 'USQE', 'N')  OR strokeType = 'PIH'
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[thromboRec2]    Script Date: 07/22/2013 16:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[thromboRec2]() 
RETURNS @thromboTab TABLE (
	medical_history_id numeric(19,0),
	hospital_stay_id varchar(255),
	thrombolysis varchar(2),
	noThrombolysisReason varchar(5),
	imageType VARCHAR(4),
	takenDatetime varchar(16),
	timeNotEntered varchar(1),
	complications VARCHAR(1),
	complicationHaemorrhage VARCHAR(1),
	complicationOedema VARCHAR(1),
	complicationBleed VARCHAR(1),
	complicationOther VARCHAR(1),
	complicationOtherText varchar(30),
	nihss24Hrs TINYINT,
	nihss24_unknown TINYINT
	)
AS
BEGIN
	INSERT INTO @thromboTab
    SELECT 
		a.medical_history_id,
		a.hospital_stay_id,
		CASE
			WHEN img.strokeType = 'PIH' THEN 'NB'
			WHEN t.thrombolysis_date IS NULL AND r.noThrombolysisReason IS NOT NULL THEN 'N'
			WHEN t.thrombolysis_date IS NULL THEN 'NB'
			ELSE 'Y'
		END AS thrombolysis,
		r.noThrombolysisReason AS noThrombolysisReason,
		img.strokeType AS strokeType,
		CASE
			WHEN t.thrombolysis_date IS NULL  THEN ''
			WHEN img.strokeType = 'PIH'  THEN ''
			WHEN ISNULL(m.inpatient_at_onset,0) = 0 AND dbo.isBefore(t.thrombolysis_date, ISNULL(t.thrombolysis_time,0), patient.hospital_admission_date, patient.hospital_admission_time) = 1
				THEN  dbo.makeDatetime(patient.hospital_admission_date, ISNULL(patient.hospital_admission_time,0)+1)
			WHEN ISNULL(m.inpatient_at_onset,0) = 1 AND  dbo.isBefore(t.thrombolysis_date, ISNULL(t.thrombolysis_time,0), m.onset_date, m.onset_time) = 1
				THEN  dbo.makeDatetime(m.onset_date, m.onset_time+1)			
			ELSE 
				CONVERT (CHAR(10), t.thrombolysis_date, 103)
					+ ' ' +
				CONVERT(CHAR(5), DATEADD(minute, t.thrombolysis_time, t.thrombolysis_date), 114)			
		END AS takenDatetime, 
		
		CASE
			WHEN img.strokeType = 'PIH' THEN  ''
			WHEN t.thrombolysis_time IS NULL THEN '1'
			ELSE '0'
		END AS timeNotEntered,
		
		CASE
			WHEN img.strokeType = 'PIH' THEN  ''
		    WHEN t.thrombolysis_date IS NULL THEN ''
			WHEN t.complications = 1 THEN 'Y'
			ELSE 'N'
		END AS complications,
		
		CASE
			WHEN img.strokeType = 'PIH' THEN  ''
			WHEN t.thrombolysis_date IS NULL THEN ''		
			WHEN t.complications = 1 AND t.complication_type_haemorrhage = 1 THEN '1'			
			ELSE '0'
		END
		AS complicationHaemorrhage,
		
		CASE
			WHEN img.strokeType = 'PIH' THEN  ''
			WHEN t.thrombolysis_date IS NULL THEN ''				
			WHEN t.complications = 1 AND t.complication_type_oedema = 1 THEN '1'			
			ELSE '0'
		END
		AS complicationOedema,
		
		CASE
			WHEN img.strokeType = 'PIH' THEN  ''
			WHEN t.thrombolysis_date IS NULL THEN ''				
			WHEN t.complications = 1 AND t.complication_type_bleed = 1 THEN '1'			
			ELSE '0'
		END
		AS complicationBleed,	
				
		CASE
			WHEN img.strokeType = 'PIH' THEN  ''		
			WHEN t.thrombolysis_date IS NULL THEN ''		
			WHEN t.complications = 1 AND t.complication_type_other = 1 THEN '1'			
			ELSE '0'
		END
		AS complicationOther,	
		
		CASE
			WHEN img.strokeType = 'PIH' THEN  ''		
			WHEN t.thrombolysis_date IS NULL THEN ''		
			WHEN t.complications = 1 AND t.complication_type_other = 1 THEN complication_type_other_text
			ELSE ''
		END
		AS complicationOtherText,
		
		t.nihss_score_at24hours AS nihss24Hrs,
		t.nihss_score_at24hours_unknown AS nihss24_unknown	
	FROM
		dbo.care_activity AS a
	LEFT OUTER JOIN
		dbo.thrombolysis AS t ON a.thrombolysis_id = t.id
	LEFT OUTER JOIN
		dbo.noThromboReason() AS r ON r.hospital_stay_id = a.hospital_stay_id
	LEFT OUTER JOIN
	    dbo.imageRec() as img ON a.medical_history_id = img.medical_history_id
	LEFT OUTER JOIN 
		dbo.patient_data AS patient 
		ON a.patient_id = patient.id
	LEFT OUTER JOIN
		dbo.medical_history AS m ON a.medical_history_id = m.id
	RETURN
END
GO
/****** Object:  View [dbo].[SsnapExport]    Script Date: 07/22/2013 16:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[SsnapExport]
AS
SELECT DISTINCT
    care.id as care_activity_id,
	care.hospital_stay_id as hsi,
	mh.id as md_hist_id,
	(CAST(care.hospital_stay_id AS VARCHAR(19)) +'/'+ CAST(care.version AS VARCHAR(19))) AS ImportIdentifier,
	patient.hospital_number AS S1HospitalNumber,
	patient.S1NHSNumber, 
	patient.S1NoNHSNumber,
	patient.S1Surname,
	patient.S1Forename,
	patient.S1BirthDate,
	pas.S1AgeOnArrival,
	patient.S1Gender,
	patient.S1PostcodeOut,
	patient.S1PostcodeIn,
	patient.S1Ethnicity,
	/*CASE
		WHEN diagnosisCategoryType.description = 'TIA ' THEN 'T'
		WHEN diagnosisCategoryType.description = 'Stroke ' THEN 'S'
		WHEN diagnosisCategoryType.description = 'Other ' THEN 'O'
		ELSE ''
	END as S1Diagnosis,*/
	'S' as S1Diagnosis,
	CASE 
		WHEN mh.inpatient_at_onset = 1 THEN 'Y'
		ELSE 'N'
	END	AS S1OnsetInHospital,
    CONVERT (VARCHAR(16), DATEADD( minute, ISNULL(mh.onset_time,0), mh.onset_date), 103) + ' ' + CONVERT (VARCHAR(5), DATEADD( minute, ISNULL(mh.onset_time,0), mh.onset_date ), 114) AS S1OnsetDateTime,  
    CASE 
           WHEN mh.onset_time IS NULL THEN 1
           WHEN ISNULL(mh.onset_time_unknown,0) = 1 THEN 1
           ELSE 0
    END
    AS S1OnsetTimeNotEntered,  
    CASE
		WHEN mh.onset_date IS NOT NULL AND mh.during_sleep = 1 THEN 'DS' 
		WHEN mh.onset_date IS NOT NULL AND mh.onset_date_estimated = 1 THEN 'BE'
		WHEN mh.onset_date IS NOT NULL AND mh.onset_time IS NOT NULL THEN 'P'		
		WHEN mh.onset_date IS NOT NULL AND mh.onset_time IS NULL THEN 'BE'		
		ELSE ''
	END
	AS S1OnsetDateType,
	
	CASE
		WHEN mh.onset_date IS NULL THEN 'NK'		
		WHEN mh.onset_time IS NULL THEN 'NK'
		WHEN mh.onset_time_estimated = 1 THEN 'BE'
		WHEN mh.during_sleep = 1 THEN 'BE'
		WHEN mh.onset_time_unknown = 1 THEN 'NK'
		WHEN mh.onset_time IS NOT NULL THEN 'P'		
		ELSE 'NK' 
	END 
	AS S1OnsetTimeType, 
	CASE
		WHEN mh.inpatient_at_onset = 1 THEN ''
		WHEN ISNULL(arr.arrive_by_ambulance,0) = 0 THEN 'N'
		ELSE 'Y'
	END AS S1ArriveByAmbulance,
	CASE
		WHEN mh.inpatient_at_onset = 1 THEN '' 
		WHEN ISNULL(arr.arrive_by_ambulance,0) = 1 AND ISNULL(trust.code,'-') = '-' THEN ''	
		WHEN ISNULL(arr.arrive_by_ambulance,0) = 1 THEN trust.code
		ELSE ''			
	END AS S1AmbulanceTrust,
	CASE
		WHEN mh.inpatient_at_onset = 1 THEN '' 
		WHEN ISNULL(arr.arrive_by_ambulance,0) = 1 THEN ISNULL(CONVERT(VARCHAR(19),arr.cad_number),'')
		ELSE ''
	END	AS S1CadNumber,
	CASE
		WHEN mh.inpatient_at_onset = 1 THEN '' 
		WHEN ISNULL(arr.arrive_by_ambulance,0) = 0 THEN ''
		WHEN ISNULL(arr.cad_number_unknown,0) = 1 THEN '1'
		ELSE '0'
	END AS S1CadNumberNK,
	patient.S1FirstArrivalDateTime	AS S1FirstArrivalDateTime,
	patient.S1FirstArrivalTimeNotEntered	AS S1FirstArrivalTimeNotEntered,
	patient.S1FirstWard			AS S1FirstWard,
	patient.S1FirstStrokeUnitArrivalDateTime	AS S1FirstStrokeUnitArrivalDateTime,
	patient.S1FirstStrokeUnitArrivalTimeNotEntered	AS S1FirstStrokeUnitArrivalTimeNotEntered,
	patient.S1FirstStrokeUnitArrivalNA	AS S1FirstStrokeUnitArrivalNA,
	ISNULL(coMorb.congestive_heart_failure,'N') AS S2CoMCongestiveHeartFailure,
	ISNULL(coMorb.hypertension,'N')		AS S2CoMHypertension,
	ISNULL(coMorb.atrial_fibrillation,'N') AS S2CoMAtrialFibrilation,
	ISNULL(coMorb.diabetes,'N')			AS S2CoMDiabetes,
	CASE 
		WHEN mh.previous_stroke = 'yes' THEN 'Y'
		WHEN mh.previous_tia = 'yes' THEN 'Y'
		ELSE 'N'
	END
	AS S2CoMStrokeTIA,
	CASE 
		WHEN atrial_fibrillation = 'Y' THEN meds.antiplatelet
		ELSE ''
	END AS S2CoMAFAntiplatelet,
	CASE 
		WHEN atrial_fibrillation = 'Y' THEN meds.warfarin
		ELSE ''
	END AS S2CoMAFAnticoagulent,
	rankin.pre_admission_rankin	AS S2RankinBeforeStroke,
	''  AS S2NihssArrival,
	clAsmt.loc_stimulation AS S2NihssArrivalLoc,	
	clAsmt.loc_questions AS S2NihssArrivalLocQuestions,
	clAsmt.loc_tasks AS S2NihssArrivalLocCommands,
	clAsmt.best_gaze AS S2NihssArrivalBestGaze,
	clAsmt.hemianopia AS S2NihssArrivalVisual,
	clAsmt.facial_palsy AS S2NihssArrivalFacialPalsy,
	clAsmt.left_arm_mrc_scale AS S2NihssArrivalMotorArmLeft,
	clAsmt.right_arm_mrc_scale AS S2NihssArrivalMotorArmRight,
	clAsmt.left_leg_mrc_scale AS S2NihssArrivalMotorLegLeft,
	clAsmt.right_leg_mrc_scale AS S2NihssArrivalMotorLegRight,
	clAsmt.limb_ataxia AS S2NihssArrivalLimbAtaxia,
	clAsmt.sensory_loss AS S2NihssArrivalSensory,
	clAsmt.aphasia AS S2NihssArrivalBestLanguage,
	clAsmt.dysarthia AS S2NihssArrivalDysarthria,
	clAsmt.inattention AS S2NihssArrivalExtinctionInattention,
	img.brainImagingDateTime AS S2BrainImagingDateTime,
	img.brainImagingTimeNotEntered AS S2BrainImagingTimeNotEntered,
	img.brainImagingNotPerformed AS S2BrainImagingNotPerformed, 
	img.strokeType AS S2StrokeType,
	tboRec.thrombolysis AS S2Thrombolysis,
	tboRsn.noThrombolysisReason AS S2ThrombolysisNoReason,
	tboRsn.noThrombolysisHaemorhagic AS S2ThrombolysisNoButHaemorrhagic,
	tboRsn.noThrombolysisTooLate AS  S2ThrombolysisNoButTimeWindow,
	tboRsn.noThrombolysisComorbidity AS S2ThrombolysisNoButComorbidity,
	tboRsn.noThrombolysisMedication AS S2ThrombolysisNoButMedication,
	tboRsn.noThrombolysisRefused AS S2ThrombolysisNoButRefusal,
	tboRsn.noThrombolysisAge AS S2ThrombolysisNoButAge,
	tboRsn.noThrombolysisSymptomsImproving AS S2ThrombolysisNoButImproving,
	tboRsn.noThrombolysisTooMildOrTooSevere AS S2ThrombolysisNoButTooMildSevere, 
	tboRsn.noThrombolysisOnsetTimeUnknown AS S2ThrombolysisNoButTimeUnknownWakeUp,
	tboRsn.noThrombolysisOther AS S2ThrombolysisNoButOtherMedical,
	
	tboRec.takenDatetime AS S2ThrombolysisDateTime,
	tboRec.timeNotEntered AS S2ThrombolysisTimeNotEntered,
	tboRec.complications AS S2ThrombolysisComplications,
	tboRec.complicationHaemorrhage AS S2ThrombolysisComplicationSih,
	tboRec.complicationOedema AS S2ThrombolysisComplicationAO,
	tboRec.complicationBleed AS S2ThrombolysisComplicationEB,
	tboRec.complicationOther AS S2ThrombolysisComplicationOther,
	tboRec.complicationOtherText AS S2ThrombolysisComplicationOtherDetails,
	
	tboRec.nihss24Hrs AS S2Nihss24Hrs,
	tboRec.nihss24_unknown AS S2Nihss24HrsNK,
	swScr.swallowScreen4hrsDateTime AS S2SwallowScreening4HrsDateTime,
	swScr.swallowScreen4hrsTimeNotEntered AS S2SwallowScreening4HrsTimeNotEntered,
	swScr.swallowScreen4hrsNotPerformed AS S2SwallowScreening4HrsNotPerformed,
	swScr.swallowScreen4hrsNotPerformedReason AS S2SwallowScreening4HrsNotPerformedReason,
	medRec.previous_tia AS S2TIAInLastMonth,
	medRec.assessed_in_vascular_clinic AS S2NeurovascularClinicAssessed,
	barthelRec.barthel_score AS S2BarthelBeforeStroke,
	img.imageType AS S2BrainImagingModality,
	clinicalSummary.palliativeCare AS S3PalliativeCare,
	clinicalSummary.palliativeCareDecisionDate AS S3PalliativeCareDecisionDate,
	clinicalSummary.endOfLifePathway AS S3EndOfLifePathway,
	onset.strokeNurseAssessedDateTime AS S3StrokeNurseAssessedDateTime,
	onset.strokeNurseAssessedTimeNotEntered AS S3StrokeNurseAssessedTimeNotEntered,
	onset.strokeNurseNotAssessed AS S3StrokeNurseNotAssessed,
	onset.strokeConsultantAssessedDateTime AS S3StrokeConsultantAssessedDateTime,
	onset.strokeConsultantAssessedTimeNotEntered AS S3StrokeConsultantAssessedTimeNotEntered,
	onset.strokeConsultantNotAssessed AS S3StrokeConsultantNotAssessed,
	swScr.swallowScreen72hrsDateTime AS S3SwallowScreening72HrsDateTime,
	swScr.swallowScreen72hrsTimeNotEntered AS S3SwallowScreening72HrsTimeNotEntered, 
	swScr.swallowScreen72hrsNotPerformed AS S3SwallowScreening72HrsNotPerformed,
	swScr.swallowScreen72hrsNotPerformedReason AS S3SwallowScreening72HrsNotPerformedReason,
	occupationalTherapy.occTherapist72HrsDateTime AS S3OccTherapist72HrsDateTime,
	occupationalTherapy.occTherapist72HrsTimeNotEntered AS S3OccTherapist72HrsTimeNotEntered, 
	occupationalTherapy.occTherapist72HrsNotAssessed AS S3OccTherapist72HrsNotAssessed, 
	occupationalTherapy.occTherapist72HrsNotAssessedReason AS S3OccTherapist72HrsNotAssessedReason , 
	physiotherapy.physio72HrsDateTime AS S3Physio72HrsDateTime,
	physiotherapy.physio72HrsTimeNotEntered AS S3Physio72HrsTimeNotEntered,
	physiotherapy.physio72HrsNotAssessed AS S3Physio72HrsNotAssessed,
	physiotherapy.physio72HrsNotAssessedReason AS S3Physio72HrsNotAssessedReason, 
	speechTherapy.spchThpyComms72HrsDateTime AS S3SpLangTherapistComm72HrsDateTime,
	speechTherapy.spchThpyComms72HrsTimeNotEntered AS S3SpLangTherapistComm72HrsTimeNotEntered,
	speechTherapy.spchThpyComms72HrsNotAssessed AS S3SpLangTherapistComm72HrsNotAssessed,
	speechTherapy.spchThpyComms72HrsNotAssessedReason AS S3SpLangTherapistComm72HrsNotAssessedReason,
	speechTherapy.spchThpySwallow72HrsDateTime AS S3SpLangTherapistSwallow72HrsDateTime ,
	speechTherapy.spchThpySwallow72HrsTimeNotEntered AS S3SpLangTherapistSwallow72HrsTimeNotEntered , 
	speechTherapy.spchThpySwallow72HrsNotAssessed AS S3SpLangTherapistSwallow72HrsNotAssessed ,
	speechTherapy.spchThpySwallow72HrsNotAssessedReason AS S3SpLangTherapistSwallow72HrsNotAssessedReason , 

	--
	--  SECTION 4.1
	--
	
	patient.S4ArrivalDateTime,
	patient.S4ArrivalTimeNotEntered,
	patient.S4FirstWard,
	patient.S4StrokeUnitArrivalDateTime,
	patient.S4StrokeUnitArrivalTimeNotEntered,
	patient.S4StrokeUnitArrivalNA,

	--
	-- SECTION 4.4.1
	--
	physiotherapy.physioRequired AS S4Physio,
	physiotherapy.physioDays AS S4PhysioDays,
	physiotherapy.physioMinutes AS S4PhysioMinutes,
	occupationalTherapy.therapyRequired AS S4OccTher,
	occupationalTherapy.therapyDays AS S4OccTherDays,
	occupationalTherapy.therapyMinutes AS S4OccTherMinutes,
	speechTherapy.therapyRequired AS S4SpeechLang,
	speechTherapy.therapyDays AS S4SpeechLangDays,
	speechTherapy.therapyMinutes AS S4SpeechLangMinutes,
	therapyManagement.psychoRequired AS S4Psychology,
	therapyManagement.psychoDays AS S4PsychologyDays,
	therapyManagement.psychoMinutes AS S4PsychologyMinutes,
	therapyManagement.rehabGoalsDate AS S4RehabGoalsDate,
	therapyManagement.rehabGoalsNone AS S4RehabGoalsNone,
	therapyManagement.rehabGoalsNoneReason AS S4RehabGoalsNoneReason,

	--
	-- SECTION 5
	--
	
	clinicalSummary.locWorst7Days AS S5LocWorst7Days,
	clinicalSummary.urinaryTractInfection7Days AS S5UrinaryTractInfection7Days,
	clinicalSummary.pneumoniaAntibiotics7Days AS S5PneumoniaAntibiotics7Days,

	--
	-- SECTION 6
	--
	
	occupationalTherapy.occTherapistByDischargeDateTime AS S6OccTherapistByDischargeDateTime,
	occupationalTherapy.occTherapistByDischargeTimeNotEntered AS S6OccTherapistByDischargeTimeNotEntered,
	occupationalTherapy.occTherapistByDischargeNotAssessed AS S6OccTherapistByDischargeNotAssessed,
	occupationalTherapy.occTherapistByDischargeNotAssessedReason AS S6OccTherapistByDischargeNotAssessedReason,
	physiotherapy.physioByDischargeDateTime AS S6PhysioByDischargeDateTime,
	physiotherapy.physioByDischargeTimeNotEntered AS S6PhysioByDischargeTimeNotEntered,
	physiotherapy.physioByDischargeNotAssessed AS S6PhysioByDischargeNotAssessed,
	physiotherapy.physioByDischargeNotAssessedReason AS S6PhysioByDischargeNotAssessedReason,
	speechTherapy.spchThpyCommsByDischargeDateTime AS S6SpLangTherapistCommByDischargeDateTime,
	speechTherapy.spchThpyCommsByDischargeTimeNotEntered AS S6SpLangTherapistCommByDischargeTimeNotEntered,
	speechTherapy.spchThpyCommsByDischargeNotAssessed AS S6SpLangTherapistCommByDischargeNotAssessed,
	speechTherapy.spchThpyCommsByDischargeNotAssessedReason AS S6SpLangTherapistCommByDischargeNotAssessedReason,
	speechTherapy.spchThpySwallowByDischargeDateTime AS S6SpLangTherapistSwallowByDischargeDateTime,
	speechTherapy.spchThpySwallowByDischargeTimeNotEntered AS S6SpLangTherapistSwallowByDischargeTimeNotEntered,
	speechTherapy.spchThpySwallowByDischargeNotAssessed AS S6SpLangTherapistSwallowByDischargeNotAssessed,
	speechTherapy.spchThpySwallowByDischargeNotAssessedReason AS S6SpLangTherapistSwallowByDischargeNotAssessedReason,
	admissionAssessment.urinaryContinencePlanDate AS S6UrinaryContinencePlanDate,
	admissionAssessment.urinaryContinencePlanNoPlan AS S6UrinaryContinencePlanNoPlan,
	admissionAssessment.urinaryContinencePlanNoPlanReason AS S6UrinaryContinencePlanNoPlanReason,
	admissionAssessment.malnutritionScreening AS S6MalnutritionScreening,
	admissionAssessment.malnutritionScreeningDietitianDate AS S6MalnutritionScreeningDietitianDate,
	admissionAssessment.malnutritionScreeningDietitianNotSeen AS S6MalnutritionScreeningDietitianNotSeen,
	occupationalTherapy.moodScreeningDate AS  S6MoodScreeningDate,
	occupationalTherapy.moodScreeningnoScreening AS S6MoodScreeningNoScreening,
	occupationalTherapy.moodScreeningnoScreeningReaaon AS S6MoodScreeningNoScreeningReason,
	occupationalTherapy.cognitionScreeningDate AS S6CognitionScreeningDate,
	occupationalTherapy.cognitionScreeningNoScreening AS S6CognitionScreeningNoScreening,
	occupationalTherapy.cognitionScreeningNoScreeningReason AS S6CognitionScreeningNoScreeningReason,
	CASE 
		WHEN clinicalSummary.palliativeCare = 'Y' THEN ''
		ELSE postDischarge.palliativeCare 
	END AS S6PalliativeCareByDischarge,
	CASE 
		WHEN clinicalSummary.palliativeCare = 'Y' THEN ''
		ELSE postDischarge.palliativeCareDecisionDate 
	END AS S6PalliativeCareByDischargeDate,
	CASE 
		WHEN clinicalSummary.palliativeCare = 'Y' THEN ''
		ELSE postDischarge.endOfLifePathway 
	END AS S6EndOfLifePathwayByDischarge,
	occupationalTherapy.firstRehabGoalsDate AS S6FirstRehabGoalsDate,
	
	--
	-- SECTION 7.1 - 7.3
	--
	postDischarge.discharge_type AS S7DischargeType,
	patient.S7DeathDate,
	CASE 
		WHEN postDischarge.discharge_type = 'D' THEN patient.S7StrokeUnitDeath
		ELSE ''
	END AS S7StrokeUnitDeath,
	postDischarge.transfer_team_code AS S7TransferTeamCode,
	patient.S7StrokeUnitDischargeDateTime,
	patient.S7StrokeUnitDischargeTimeNotEntered,
	patient.S7HospitalDischargeDateTime,
	patient.S7HospitalDischargeTimeNotEntered,
	--
	-- SECTION 7.3.1 - 7.102
	--
	--
	postDischarge.end_rehab_date AS S7EndRehabDate,
	rankin.discharge_rankin AS S7RankinDischarge,
	postDischarge.care_home_discharge AS S7CareHomeDischarge,
	postDischarge.care_home_discharge_type AS S7CareHomeDischargeType,
	postDischarge.home_discharge_type AS S7HomeDischargeType,
	postDischarge.discharged_esdmt AS S7DischargedEsdmt,
	postDischarge.discharged_mcrt AS S7DischargedMcrt,
	postDischarge.adl_help AS S7AdlHelp,
	postDischarge.adl_help_type AS S7AdlHelpType,
	postDischarge.discharge_visits_per_week AS S7DischargeVisitsPerWeek,
	postDischarge.discharge_visits_per_week_nk AS S7DischargeVisitsPerWeekNK,
	postDischarge.discharge_atrial_fibrilation AS S7DischargeAtrialFibrillation,
	postDischarge.discharge_atrial_fibrillation_anticoagulation AS S7DischargeAtrialFibrillationAnticoagulation,
	postDischarge.discharge_joint_care_planning AS S7DischargeJointCarePlanning,
	postDischarge.discharge_named_contact AS S7DischargeNamedContact,
	postDischarge.discharge_barthel AS S7DischargeBarthel,
	postDischarge.discharge_pi_consent AS S7DischargePIConsent,

	--
	-- SECTION 8
	--
	pas.S8FollowUp,
	pas.S8FollowUpDate,
	pas.S8FollowUpType,
	pas.S8FollowUpBy,
	pas.S8FollowUpByOther,
	pas.S8FollowUpPIConsent,
	pas.S8MoodBehaviourCognitiveScreened,
	pas.S8MoodBehaviourCognitiveSupportNeeded,
	pas.S8MoodBehaviourCognitivePsychologicalSupport,
	pas.S8Living,
	pas.S8LivingOther,
	pas.S8Rankin6Month,
	pas.S8PersistentAtrialFibrillation,
	pas.S8TakingAntiplateletDrug,
	pas.S8TakingAnticoagulent,
	pas.S8TakingLipidLowering,
	pas.S8TakingAntihypertensive,
	pas.S8SinceStrokeAnotherStroke,
	pas.S8SinceStrokeMyocardialInfarction, 
	pas.S8SinceStrokeOtherHospitalisationIllness 
FROM
	dbo.care_activity AS care
	LEFT OUTER JOIN         
		dbo.medical_history AS mh
		ON care.medical_history_id = mh.id
	LEFT OUTER JOIN
		dbo.arrival AS arr
		ON arr.id = mh.arrival_id
	LEFT OUTER JOIN
	    dbo.ambulance_trust_type AS trust 
	    ON arr.ambulance_trust_id = trust.id
    LEFT OUTER JOIN
		dbo.como() AS coMorb
		on care.hospital_stay_id = coMorb.hospital_stay_id
	LEFT OUTER JOIN 
		dbo.meds() AS meds 
		ON care.medical_history_id = meds.medical_history_id
	LEFt OUTER JOIN
	    dbo.rankinScore() AS rankin ON care.hospital_stay_id = rankin.hospital_stay_id
	LEFT OUTER JOIN
		dbo.clinicAsmt() As clAsmt ON care.hospital_stay_id = clAsmt.hospital_stay_id
	LEFT OUTER JOIN
		dbo.imageRec() as img ON care.medical_history_id = img.medical_history_id
	LEFT OUTER JOIN
		dbo.nothromboReason() AS tboRsn ON care.medical_history_id = tboRsn.medical_history_id
	LEFT OUTER JOIN
		dbo.thromboRec2() AS tboRec ON care.medical_history_id = tboRec.medical_history_id
	LEFT OUTER JOIN 
		dbo.swallowScreen() AS swScr ON care.hospital_stay_id = swScr.hospital_stay_id
	LEFT OUTER JOIN
		dbo.barthelRec('Pre-admission') As barthelRec ON care.medical_history_id = barthelRec.medical_history_id
	LEFT OUTER JOIN
		dbo.medical_history_rec() as medRec ON care.medical_history_id = medRec.medical_history_id
	LEFT OUTER JOIN
		dbo.clSmry() as clinicalSummary 
		on clinicalSummary.hospital_stay_id = care.hospital_stay_id
	LEFT OUTER JOIN
		dbo.strkOnset() AS onset
		ON onset.hospital_stay_id = care.hospital_stay_id
	LEFT OUTER JOIN
		dbo.spchThpy() AS speechTherapy
		ON speechTherapy.hospital_stay_id = care.hospital_stay_id
	LEFT OUTER JOIN
		dbo.occThrpy() AS occupationalTherapy
		ON occupationalTherapy.hospital_stay_id = care.hospital_stay_id
	LEFT OUTER JOIN
		dbo.physio() AS physiotherapy
		ON physiotherapy.hospital_stay_id = care.hospital_stay_id
	LEFT OUTER JOIN
		dbo.thpyMgMt() AS therapyManagement
		ON therapyManagement.hospital_stay_id = care.hospital_stay_id
	LEFT OUTER JOIN
		dbo.admissionAsmt() AS admissionAssessment 
		ON admissionAssessment.hospital_stay_id = care.hospital_stay_id
	LEFT OUTER JOIN
		dbo.postDchg() AS postDischarge
		ON postDischarge.hospital_stay_id = care.hospital_stay_id
	LEFt OUTER JOIN dbo.imaging AS imaging
		ON imaging.id = care.imaging_id		
	LEFT OUTER JOIN scan AS scan
		ON imaging.scan_id = scan.id
	LEFt OUTER JOIN diagnosis_category_type AS diagnosisCategoryType
		ON diagnosisCategoryType.id = scan.diagnosis_category_id
	LEFT OUTER JOIN
		dbo.PAS AS PAS
		ON care.hospital_stay_id = convert(varchar(255), pas.spell_id)
	LEFT OUTER JOIN
		dbo.patient_data AS patient 
		ON care.patient_id = patient.id
GO
/****** Object:  Default [DF__SchemaVer__isCur__0E99DA9F]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[SchemaVersion] ADD  DEFAULT ((0)) FOR [isCurrent]
GO
/****** Object:  Check [CK_SchemaVersion_isCurrent]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[SchemaVersion]  WITH CHECK ADD  CONSTRAINT [CK_SchemaVersion_isCurrent] CHECK  (([isCurrent]=(1) OR [isCurrent]=(0)))
GO
ALTER TABLE [dbo].[SchemaVersion] CHECK CONSTRAINT [CK_SchemaVersion_isCurrent]
GO
/****** Object:  ForeignKey [FKD43CE3F9B53E504D]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[arrival]  WITH CHECK ADD  CONSTRAINT [FKD43CE3F9B53E504D] FOREIGN KEY([ambulance_trust_id])
REFERENCES [dbo].[ambulance_trust_type] ([id])
GO
ALTER TABLE [dbo].[arrival] CHECK CONSTRAINT [FKD43CE3F9B53E504D]
GO
/****** Object:  ForeignKey [FKEC2588AE99F3E117]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[barthel]  WITH CHECK ADD  CONSTRAINT [FKEC2588AE99F3E117] FOREIGN KEY([pathway_stage_id])
REFERENCES [dbo].[pathway_stage] ([id])
GO
ALTER TABLE [dbo].[barthel] CHECK CONSTRAINT [FKEC2588AE99F3E117]
GO
/****** Object:  ForeignKey [FKEC2588AE9FB31C26]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[barthel]  WITH CHECK ADD  CONSTRAINT [FKEC2588AE9FB31C26] FOREIGN KEY([assessment_management_id])
REFERENCES [dbo].[assessment_management] ([id])
GO
ALTER TABLE [dbo].[barthel] CHECK CONSTRAINT [FKEC2588AE9FB31C26]
GO
/****** Object:  ForeignKey [FK_care_activity_care_activity]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[care_activity]  WITH CHECK ADD  CONSTRAINT [FK_care_activity_care_activity] FOREIGN KEY([id])
REFERENCES [dbo].[care_activity] ([id])
GO
ALTER TABLE [dbo].[care_activity] CHECK CONSTRAINT [FK_care_activity_care_activity]
GO
/****** Object:  ForeignKey [FK_care_activity_post_discharge_care]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[care_activity]  WITH CHECK ADD  CONSTRAINT [FK_care_activity_post_discharge_care] FOREIGN KEY([post_discharge_care_id])
REFERENCES [dbo].[post_discharge_care] ([id])
GO
ALTER TABLE [dbo].[care_activity] CHECK CONSTRAINT [FK_care_activity_post_discharge_care]
GO
/****** Object:  ForeignKey [FK787D8C7D29D6FE40]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[care_activity]  WITH CHECK ADD  CONSTRAINT [FK787D8C7D29D6FE40] FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient_proxy] ([id])
GO
ALTER TABLE [dbo].[care_activity] CHECK CONSTRAINT [FK787D8C7D29D6FE40]
GO
/****** Object:  ForeignKey [FK787D8C7D64158A38]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[care_activity]  WITH CHECK ADD  CONSTRAINT [FK787D8C7D64158A38] FOREIGN KEY([imaging_id])
REFERENCES [dbo].[imaging] ([id])
GO
ALTER TABLE [dbo].[care_activity] CHECK CONSTRAINT [FK787D8C7D64158A38]
GO
/****** Object:  ForeignKey [FK787D8C7D6E35B564]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[care_activity]  WITH CHECK ADD  CONSTRAINT [FK787D8C7D6E35B564] FOREIGN KEY([patient_life_style_id])
REFERENCES [dbo].[patient_life_style] ([id])
GO
ALTER TABLE [dbo].[care_activity] CHECK CONSTRAINT [FK787D8C7D6E35B564]
GO
/****** Object:  ForeignKey [FK787D8C7D98965B91]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[care_activity]  WITH CHECK ADD  CONSTRAINT [FK787D8C7D98965B91] FOREIGN KEY([clinical_summary_id])
REFERENCES [dbo].[clinical_summary] ([id])
GO
ALTER TABLE [dbo].[care_activity] CHECK CONSTRAINT [FK787D8C7D98965B91]
GO
/****** Object:  ForeignKey [FK787D8C7DA1C0C699]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[care_activity]  WITH CHECK ADD  CONSTRAINT [FK787D8C7DA1C0C699] FOREIGN KEY([medical_history_id])
REFERENCES [dbo].[medical_history] ([id])
GO
ALTER TABLE [dbo].[care_activity] CHECK CONSTRAINT [FK787D8C7DA1C0C699]
GO
/****** Object:  ForeignKey [FK787D8C7DAA226EA9]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[care_activity]  WITH CHECK ADD  CONSTRAINT [FK787D8C7DAA226EA9] FOREIGN KEY([nutrition_management_id])
REFERENCES [dbo].[nutrition_management] ([id])
GO
ALTER TABLE [dbo].[care_activity] CHECK CONSTRAINT [FK787D8C7DAA226EA9]
GO
/****** Object:  ForeignKey [FK787D8C7DB5532281]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[care_activity]  WITH CHECK ADD  CONSTRAINT [FK787D8C7DB5532281] FOREIGN KEY([continence_management_id])
REFERENCES [dbo].[continence_management] ([id])
GO
ALTER TABLE [dbo].[care_activity] CHECK CONSTRAINT [FK787D8C7DB5532281]
GO
/****** Object:  ForeignKey [FK787D8C7DBD56D383]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[care_activity]  WITH CHECK ADD  CONSTRAINT [FK787D8C7DBD56D383] FOREIGN KEY([clinical_assessment_id])
REFERENCES [dbo].[clinical_assessment] ([id])
GO
ALTER TABLE [dbo].[care_activity] CHECK CONSTRAINT [FK787D8C7DBD56D383]
GO
/****** Object:  ForeignKey [FK787D8C7DBF7884CB]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[care_activity]  WITH CHECK ADD  CONSTRAINT [FK787D8C7DBF7884CB] FOREIGN KEY([therapy_management_id])
REFERENCES [dbo].[therapy_management] ([id])
GO
ALTER TABLE [dbo].[care_activity] CHECK CONSTRAINT [FK787D8C7DBF7884CB]
GO
/****** Object:  ForeignKey [FK787D8C7DD4B0C4DE]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[care_activity]  WITH CHECK ADD  CONSTRAINT [FK787D8C7DD4B0C4DE] FOREIGN KEY([post_discharge_care_id])
REFERENCES [dbo].[post_discharge_care] ([id])
GO
ALTER TABLE [dbo].[care_activity] CHECK CONSTRAINT [FK787D8C7DD4B0C4DE]
GO
/****** Object:  ForeignKey [FK787D8C7DF4FE840D]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[care_activity]  WITH CHECK ADD  CONSTRAINT [FK787D8C7DF4FE840D] FOREIGN KEY([fluid_management_id])
REFERENCES [dbo].[fluid_management] ([id])
GO
ALTER TABLE [dbo].[care_activity] CHECK CONSTRAINT [FK787D8C7DF4FE840D]
GO
/****** Object:  ForeignKey [FK787D8C7DFB21439C]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[care_activity]  WITH CHECK ADD  CONSTRAINT [FK787D8C7DFB21439C] FOREIGN KEY([thrombolysis_id])
REFERENCES [dbo].[thrombolysis] ([id])
GO
ALTER TABLE [dbo].[care_activity] CHECK CONSTRAINT [FK787D8C7DFB21439C]
GO
/****** Object:  ForeignKey [FK313FE94355CDF454]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[catheter_history]  WITH CHECK ADD  CONSTRAINT [FK313FE94355CDF454] FOREIGN KEY([reason_id])
REFERENCES [dbo].[catheter_reason_type] ([id])
GO
ALTER TABLE [dbo].[catheter_history] CHECK CONSTRAINT [FK313FE94355CDF454]
GO
/****** Object:  ForeignKey [FK313FE943B5532281]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[catheter_history]  WITH CHECK ADD  CONSTRAINT [FK313FE943B5532281] FOREIGN KEY([continence_management_id])
REFERENCES [dbo].[continence_management] ([id])
GO
ALTER TABLE [dbo].[catheter_history] CHECK CONSTRAINT [FK313FE943B5532281]
GO
/****** Object:  ForeignKey [FKA54EB6EAEDB53F9]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[clinical_assessment]  WITH CHECK ADD  CONSTRAINT [FKA54EB6EAEDB53F9] FOREIGN KEY([classification_id])
REFERENCES [dbo].[clinical_classification_type] ([id])
GO
ALTER TABLE [dbo].[clinical_assessment] CHECK CONSTRAINT [FKA54EB6EAEDB53F9]
GO
/****** Object:  ForeignKey [FKA54EB6EBA04E74B]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[clinical_assessment]  WITH CHECK ADD  CONSTRAINT [FKA54EB6EBA04E74B] FOREIGN KEY([no_swallow_screen_performed_reason_at4hours_id])
REFERENCES [dbo].[no_swallow_screen_performed_reason_type] ([id])
GO
ALTER TABLE [dbo].[clinical_assessment] CHECK CONSTRAINT [FKA54EB6EBA04E74B]
GO
/****** Object:  ForeignKey [FKA54EB6ECB0D15DC]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[clinical_assessment]  WITH CHECK ADD  CONSTRAINT [FKA54EB6ECB0D15DC] FOREIGN KEY([no_swallow_screen_performed_reason_id])
REFERENCES [dbo].[no_swallow_screen_performed_reason_type] ([id])
GO
ALTER TABLE [dbo].[clinical_assessment] CHECK CONSTRAINT [FKA54EB6ECB0D15DC]
GO
/****** Object:  ForeignKey [FKA54EB6EF1C0392D]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[clinical_assessment]  WITH CHECK ADD  CONSTRAINT [FKA54EB6EF1C0392D] FOREIGN KEY([glasgow_coma_score_id])
REFERENCES [dbo].[glasgow_coma_score] ([id])
GO
ALTER TABLE [dbo].[clinical_assessment] CHECK CONSTRAINT [FKA54EB6EF1C0392D]
GO
/****** Object:  ForeignKey [FK3B15127ABBFC43FA]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[clinical_summary]  WITH CHECK ADD  CONSTRAINT [FK3B15127ABBFC43FA] FOREIGN KEY([worst_level_of_consciousness_id])
REFERENCES [dbo].[level_of_consciousness] ([id])
GO
ALTER TABLE [dbo].[clinical_summary] CHECK CONSTRAINT [FK3B15127ABBFC43FA]
GO
/****** Object:  ForeignKey [FKE7C6E6B5A1C0C699]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[comorbidity]  WITH CHECK ADD  CONSTRAINT [FKE7C6E6B5A1C0C699] FOREIGN KEY([medical_history_id])
REFERENCES [dbo].[medical_history] ([id])
GO
ALTER TABLE [dbo].[comorbidity] CHECK CONSTRAINT [FKE7C6E6B5A1C0C699]
GO
/****** Object:  ForeignKey [FKE7C6E6B5C88723DD]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[comorbidity]  WITH CHECK ADD  CONSTRAINT [FKE7C6E6B5C88723DD] FOREIGN KEY([type_id])
REFERENCES [dbo].[comorbidity_type] ([id])
GO
ALTER TABLE [dbo].[comorbidity] CHECK CONSTRAINT [FKE7C6E6B5C88723DD]
GO
/****** Object:  ForeignKey [FK5E30DD808D00E9B]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[continence_management]  WITH CHECK ADD  CONSTRAINT [FK5E30DD808D00E9B] FOREIGN KEY([no_continence_plan_reason_id])
REFERENCES [dbo].[no_continence_plan_reason_type] ([id])
GO
ALTER TABLE [dbo].[continence_management] CHECK CONSTRAINT [FK5E30DD808D00E9B]
GO
/****** Object:  ForeignKey [FK332C073C8F998D2F]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[evaluation]  WITH CHECK ADD  CONSTRAINT [FK332C073C8F998D2F] FOREIGN KEY([evaluator_id])
REFERENCES [dbo].[staff_role] ([id])
GO
ALTER TABLE [dbo].[evaluation] CHECK CONSTRAINT [FK332C073C8F998D2F]
GO
/****** Object:  ForeignKey [FK332C073CC11D709F]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[evaluation]  WITH CHECK ADD  CONSTRAINT [FK332C073CC11D709F] FOREIGN KEY([care_activity_id])
REFERENCES [dbo].[care_activity] ([id])
GO
ALTER TABLE [dbo].[evaluation] CHECK CONSTRAINT [FK332C073CC11D709F]
GO
/****** Object:  ForeignKey [FKADC371D851F3421B]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[fluid_management]  WITH CHECK ADD  CONSTRAINT [FKADC371D851F3421B] FOREIGN KEY([inadequate_at72fluid_reason_type_id])
REFERENCES [dbo].[inadequate_fluid_reason_type] ([id])
GO
ALTER TABLE [dbo].[fluid_management] CHECK CONSTRAINT [FKADC371D851F3421B]
GO
/****** Object:  ForeignKey [FKADC371D89F7D344]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[fluid_management]  WITH CHECK ADD  CONSTRAINT [FKADC371D89F7D344] FOREIGN KEY([inadequate_at48fluid_reason_type_id])
REFERENCES [dbo].[inadequate_fluid_reason_type] ([id])
GO
ALTER TABLE [dbo].[fluid_management] CHECK CONSTRAINT [FKADC371D89F7D344]
GO
/****** Object:  ForeignKey [FKADC371D8CA888802]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[fluid_management]  WITH CHECK ADD  CONSTRAINT [FKADC371D8CA888802] FOREIGN KEY([inadequate_at24fluid_reason_type_id])
REFERENCES [dbo].[inadequate_fluid_reason_type] ([id])
GO
ALTER TABLE [dbo].[fluid_management] CHECK CONSTRAINT [FKADC371D8CA888802]
GO
/****** Object:  ForeignKey [FK9F88ACA919029DF5]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[identifier]  WITH CHECK ADD  CONSTRAINT [FK9F88ACA919029DF5] FOREIGN KEY([type_id])
REFERENCES [dbo].[identifier_type] ([id])
GO
ALTER TABLE [dbo].[identifier] CHECK CONSTRAINT [FK9F88ACA919029DF5]
GO
/****** Object:  ForeignKey [FK71F5DB58801C4FC0]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[imaging]  WITH CHECK ADD  CONSTRAINT [FK71F5DB58801C4FC0] FOREIGN KEY([no_scan_reason_id])
REFERENCES [dbo].[no_scan_reason_type] ([id])
GO
ALTER TABLE [dbo].[imaging] CHECK CONSTRAINT [FK71F5DB58801C4FC0]
GO
/****** Object:  ForeignKey [FK71F5DB58AB97EDDC]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[imaging]  WITH CHECK ADD  CONSTRAINT [FK71F5DB58AB97EDDC] FOREIGN KEY([scan_id])
REFERENCES [dbo].[scan] ([id])
GO
ALTER TABLE [dbo].[imaging] CHECK CONSTRAINT [FK71F5DB58AB97EDDC]
GO
/****** Object:  ForeignKey [FK26EB84E66EA1BA98]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[medical_history]  WITH CHECK ADD  CONSTRAINT [FK26EB84E66EA1BA98] FOREIGN KEY([arrival_id])
REFERENCES [dbo].[arrival] ([id])
GO
ALTER TABLE [dbo].[medical_history] CHECK CONSTRAINT [FK26EB84E66EA1BA98]
GO
/****** Object:  ForeignKey [FK7725CACF82F8391B]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[medication]  WITH CHECK ADD  CONSTRAINT [FK7725CACF82F8391B] FOREIGN KEY([type_id])
REFERENCES [dbo].[medication_type] ([id])
GO
ALTER TABLE [dbo].[medication] CHECK CONSTRAINT [FK7725CACF82F8391B]
GO
/****** Object:  ForeignKey [FK7725CACFA1C0C699]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[medication]  WITH CHECK ADD  CONSTRAINT [FK7725CACFA1C0C699] FOREIGN KEY([medical_history_id])
REFERENCES [dbo].[medical_history] ([id])
GO
ALTER TABLE [dbo].[medication] CHECK CONSTRAINT [FK7725CACFA1C0C699]
GO
/****** Object:  ForeignKey [FK8658F48799F3E117]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[modified_rankin]  WITH CHECK ADD  CONSTRAINT [FK8658F48799F3E117] FOREIGN KEY([pathway_stage_id])
REFERENCES [dbo].[pathway_stage] ([id])
GO
ALTER TABLE [dbo].[modified_rankin] CHECK CONSTRAINT [FK8658F48799F3E117]
GO
/****** Object:  ForeignKey [FK8658F4879FB31C26]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[modified_rankin]  WITH CHECK ADD  CONSTRAINT [FK8658F4879FB31C26] FOREIGN KEY([assessment_management_id])
REFERENCES [dbo].[assessment_management] ([id])
GO
ALTER TABLE [dbo].[modified_rankin] CHECK CONSTRAINT [FK8658F4879FB31C26]
GO
/****** Object:  ForeignKey [FKF319A34A60BD38C2]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[nutrition_management]  WITH CHECK ADD  CONSTRAINT [FKF319A34A60BD38C2] FOREIGN KEY([inadequate_at24nutrition_reason_type_id])
REFERENCES [dbo].[inadequate_nutrition_reason_type] ([id])
GO
ALTER TABLE [dbo].[nutrition_management] CHECK CONSTRAINT [FKF319A34A60BD38C2]
GO
/****** Object:  ForeignKey [FKF319A34A619B3E5B]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[nutrition_management]  WITH CHECK ADD  CONSTRAINT [FKF319A34A619B3E5B] FOREIGN KEY([inadequate_at72nutrition_reason_type_id])
REFERENCES [dbo].[inadequate_nutrition_reason_type] ([id])
GO
ALTER TABLE [dbo].[nutrition_management] CHECK CONSTRAINT [FKF319A34A619B3E5B]
GO
/****** Object:  ForeignKey [FKF319A34A75311304]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[nutrition_management]  WITH CHECK ADD  CONSTRAINT [FKF319A34A75311304] FOREIGN KEY([inadequate_at48nutrition_reason_type_id])
REFERENCES [dbo].[inadequate_nutrition_reason_type] ([id])
GO
ALTER TABLE [dbo].[nutrition_management] CHECK CONSTRAINT [FKF319A34A75311304]
GO
/****** Object:  ForeignKey [FK74AD82CB93781D4]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[observation]  WITH CHECK ADD  CONSTRAINT [FK74AD82CB93781D4] FOREIGN KEY([type_id])
REFERENCES [dbo].[observation_type] ([id])
GO
ALTER TABLE [dbo].[observation] CHECK CONSTRAINT [FK74AD82CB93781D4]
GO
/****** Object:  ForeignKey [FK74AD82CC11D709F]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[observation]  WITH CHECK ADD  CONSTRAINT [FK74AD82CC11D709F] FOREIGN KEY([care_activity_id])
REFERENCES [dbo].[care_activity] ([id])
GO
ALTER TABLE [dbo].[observation] CHECK CONSTRAINT [FK74AD82CC11D709F]
GO
/****** Object:  ForeignKey [FK702D56025A3BE9FA]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[occupational_therapy_management]  WITH CHECK ADD  CONSTRAINT [FK702D56025A3BE9FA] FOREIGN KEY([no_mood_assessment_reason_type_id])
REFERENCES [dbo].[occupational_therapy_no_assessment_reason_type] ([id])
GO
ALTER TABLE [dbo].[occupational_therapy_management] CHECK CONSTRAINT [FK702D56025A3BE9FA]
GO
/****** Object:  ForeignKey [FK702D5602CABCAA06]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[occupational_therapy_management]  WITH CHECK ADD  CONSTRAINT [FK702D5602CABCAA06] FOREIGN KEY([no_assessment_reason_type_id])
REFERENCES [dbo].[occupational_therapy_no_assessment_reason_type] ([id])
GO
ALTER TABLE [dbo].[occupational_therapy_management] CHECK CONSTRAINT [FK702D5602CABCAA06]
GO
/****** Object:  ForeignKey [FKC1288C5BD1473F2A]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[occupational_therapy_management]  WITH CHECK ADD  CONSTRAINT [FKC1288C5BD1473F2A] FOREIGN KEY([no72hr_assessment_reason_type_id])
REFERENCES [dbo].[occupational_therapy_no_assessment_reason_type] ([id])
GO
ALTER TABLE [dbo].[occupational_therapy_management] CHECK CONSTRAINT [FKC1288C5BD1473F2A]
GO
/****** Object:  ForeignKey [FK114847918703F2E4]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[physiotherapy_management]  WITH CHECK ADD  CONSTRAINT [FK114847918703F2E4] FOREIGN KEY([no_assessment_reason_type_id])
REFERENCES [dbo].[physiotherapy_no_assessment_reason_type] ([id])
GO
ALTER TABLE [dbo].[physiotherapy_management] CHECK CONSTRAINT [FK114847918703F2E4]
GO
/****** Object:  ForeignKey [FKC1288C5BD1473F2F]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[physiotherapy_management]  WITH CHECK ADD  CONSTRAINT [FKC1288C5BD1473F2F] FOREIGN KEY([no72hr_assessment_reason_type_id])
REFERENCES [dbo].[physiotherapy_no_assessment_reason_type] ([id])
GO
ALTER TABLE [dbo].[physiotherapy_management] CHECK CONSTRAINT [FKC1288C5BD1473F2F]
GO
/****** Object:  ForeignKey [FK435363737340A39]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[post_discharge_support]  WITH CHECK ADD  CONSTRAINT [FK435363737340A39] FOREIGN KEY([type_id])
REFERENCES [dbo].[post_discharge_support_type] ([id])
GO
ALTER TABLE [dbo].[post_discharge_support] CHECK CONSTRAINT [FK435363737340A39]
GO
/****** Object:  ForeignKey [FK43536373D4B0C4DE]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[post_discharge_support]  WITH CHECK ADD  CONSTRAINT [FK43536373D4B0C4DE] FOREIGN KEY([post_discharge_care_id])
REFERENCES [dbo].[post_discharge_care] ([id])
GO
ALTER TABLE [dbo].[post_discharge_support] CHECK CONSTRAINT [FK43536373D4B0C4DE]
GO
/****** Object:  ForeignKey [FK6170500DBD7519D3]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[post_discharge_therapy]  WITH CHECK ADD  CONSTRAINT [FK6170500DBD7519D3] FOREIGN KEY([type_id])
REFERENCES [dbo].[post_discharge_therapy_type] ([id])
GO
ALTER TABLE [dbo].[post_discharge_therapy] CHECK CONSTRAINT [FK6170500DBD7519D3]
GO
/****** Object:  ForeignKey [FK6170500DD4B0C4DE]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[post_discharge_therapy]  WITH CHECK ADD  CONSTRAINT [FK6170500DD4B0C4DE] FOREIGN KEY([post_discharge_care_id])
REFERENCES [dbo].[post_discharge_care] ([id])
GO
ALTER TABLE [dbo].[post_discharge_therapy] CHECK CONSTRAINT [FK6170500DD4B0C4DE]
GO
/****** Object:  ForeignKey [FKDAD694BFA1C0C699]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[risk_factor]  WITH CHECK ADD  CONSTRAINT [FKDAD694BFA1C0C699] FOREIGN KEY([medical_history_id])
REFERENCES [dbo].[medical_history] ([id])
GO
ALTER TABLE [dbo].[risk_factor] CHECK CONSTRAINT [FKDAD694BFA1C0C699]
GO
/****** Object:  ForeignKey [FKDAD694BFF76277CA]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[risk_factor]  WITH CHECK ADD  CONSTRAINT [FKDAD694BFF76277CA] FOREIGN KEY([type_id])
REFERENCES [dbo].[risk_factor_type] ([id])
GO
ALTER TABLE [dbo].[risk_factor] CHECK CONSTRAINT [FKDAD694BFF76277CA]
GO
/****** Object:  ForeignKey [FK35C67D67AAE64B]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[scan]  WITH CHECK ADD  CONSTRAINT [FK35C67D67AAE64B] FOREIGN KEY([diagnosis_type_id])
REFERENCES [dbo].[diagnosis_type] ([id])
GO
ALTER TABLE [dbo].[scan] CHECK CONSTRAINT [FK35C67D67AAE64B]
GO
/****** Object:  ForeignKey [FK35C67D6985FC25]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[scan]  WITH CHECK ADD  CONSTRAINT [FK35C67D6985FC25] FOREIGN KEY([diagnosis_category_id])
REFERENCES [dbo].[diagnosis_category_type] ([id])
GO
ALTER TABLE [dbo].[scan] CHECK CONSTRAINT [FK35C67D6985FC25]
GO
/****** Object:  ForeignKey [FK35C67D6985FD25]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[scan]  WITH CHECK ADD  CONSTRAINT [FK35C67D6985FD25] FOREIGN KEY([diagnosis_category_id])
REFERENCES [dbo].[diagnosis_category_type] ([id])
GO
ALTER TABLE [dbo].[scan] CHECK CONSTRAINT [FK35C67D6985FD25]
GO
/****** Object:  ForeignKey [FK35C67D7E1B8B1F]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[scan]  WITH CHECK ADD  CONSTRAINT [FK35C67D7E1B8B1F] FOREIGN KEY([image_type_id])
REFERENCES [dbo].[image_type] ([id])
GO
ALTER TABLE [dbo].[scan] CHECK CONSTRAINT [FK35C67D7E1B8B1F]
GO
/****** Object:  ForeignKey [FKC1288C5B2D5728A0]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[speech_and_language_therapy_management]  WITH CHECK ADD  CONSTRAINT [FKC1288C5B2D5728A0] FOREIGN KEY([no_communication_assessment_reason_type_id])
REFERENCES [dbo].[communication_no_assessment_reason_type] ([id])
GO
ALTER TABLE [dbo].[speech_and_language_therapy_management] CHECK CONSTRAINT [FKC1288C5B2D5728A0]
GO
/****** Object:  ForeignKey [FKC1288C5B72134C8E]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[speech_and_language_therapy_management]  WITH CHECK ADD  CONSTRAINT [FKC1288C5B72134C8E] FOREIGN KEY([no_swallowing_assessment_reason_type_id])
REFERENCES [dbo].[swallowing_no_assessment_reason_type] ([id])
GO
ALTER TABLE [dbo].[speech_and_language_therapy_management] CHECK CONSTRAINT [FKC1288C5B72134C8E]
GO
/****** Object:  ForeignKey [FKC1288C5BB7DE045]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[speech_and_language_therapy_management]  WITH CHECK ADD  CONSTRAINT [FKC1288C5BB7DE045] FOREIGN KEY([no72hr_communication_assessment_reason_type_id])
REFERENCES [dbo].[communication_no_assessment_reason_type] ([id])
GO
ALTER TABLE [dbo].[speech_and_language_therapy_management] CHECK CONSTRAINT [FKC1288C5BB7DE045]
GO
/****** Object:  ForeignKey [FKC1288C5BD1473F09]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[speech_and_language_therapy_management]  WITH CHECK ADD  CONSTRAINT [FKC1288C5BD1473F09] FOREIGN KEY([no72hr_swallowing_assessment_reason_type_id])
REFERENCES [dbo].[swallowing_no_assessment_reason_type] ([id])
GO
ALTER TABLE [dbo].[speech_and_language_therapy_management] CHECK CONSTRAINT [FKC1288C5BD1473F09]
GO
/****** Object:  ForeignKey [FK_report_admin_tx__report_id]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[ssnap_report_admin_tx]  WITH CHECK ADD  CONSTRAINT [FK_report_admin_tx__report_id] FOREIGN KEY([report_id])
REFERENCES [dbo].[ssnap_report] ([id])
GO
ALTER TABLE [dbo].[ssnap_report_admin_tx] CHECK CONSTRAINT [FK_report_admin_tx__report_id]
GO
/****** Object:  ForeignKey [FK_report_field__report_record]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[ssnap_report_field]  WITH CHECK ADD  CONSTRAINT [FK_report_field__report_record] FOREIGN KEY([record_id])
REFERENCES [dbo].[ssnap_report_record] ([id])
GO
ALTER TABLE [dbo].[ssnap_report_field] CHECK CONSTRAINT [FK_report_field__report_record]
GO
/****** Object:  ForeignKey [FK_report_record__report]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[ssnap_report_record]  WITH CHECK ADD  CONSTRAINT [FK_report_record__report] FOREIGN KEY([report_id])
REFERENCES [dbo].[ssnap_report] ([id])
GO
ALTER TABLE [dbo].[ssnap_report_record] CHECK CONSTRAINT [FK_report_record__report]
GO
/****** Object:  ForeignKey [FK_upload_tx__report]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[ssnap_upload_transaction]  WITH CHECK ADD  CONSTRAINT [FK_upload_tx__report] FOREIGN KEY([report_id])
REFERENCES [dbo].[ssnap_report] ([id])
GO
ALTER TABLE [dbo].[ssnap_upload_transaction] CHECK CONSTRAINT [FK_upload_tx__report]
GO
/****** Object:  ForeignKey [FK4046B5D916479FC5]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[therapy_management]  WITH CHECK ADD  CONSTRAINT [FK4046B5D916479FC5] FOREIGN KEY([assessment_management_id])
REFERENCES [dbo].[assessment_management] ([id])
GO
ALTER TABLE [dbo].[therapy_management] CHECK CONSTRAINT [FK4046B5D916479FC5]
GO
/****** Object:  ForeignKey [FK4046B5D931DB5E90]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[therapy_management]  WITH CHECK ADD  CONSTRAINT [FK4046B5D931DB5E90] FOREIGN KEY([cognitive_status_no_assessment_type_id])
REFERENCES [dbo].[cognitive_status_no_assessment_type] ([id])
GO
ALTER TABLE [dbo].[therapy_management] CHECK CONSTRAINT [FK4046B5D931DB5E90]
GO
/****** Object:  ForeignKey [FK4046B5D93611E1FF]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[therapy_management]  WITH CHECK ADD  CONSTRAINT [FK4046B5D93611E1FF] FOREIGN KEY([rehab_goals_not_set_reason_type_id])
REFERENCES [dbo].[rehab_goals_not_set_reason_type] ([id])
GO
ALTER TABLE [dbo].[therapy_management] CHECK CONSTRAINT [FK4046B5D93611E1FF]
GO
/****** Object:  ForeignKey [FK4046B5D99FB31C26]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[therapy_management]  WITH CHECK ADD  CONSTRAINT [FK4046B5D99FB31C26] FOREIGN KEY([assessment_management_id])
REFERENCES [dbo].[assessment_management] ([id])
GO
ALTER TABLE [dbo].[therapy_management] CHECK CONSTRAINT [FK4046B5D99FB31C26]
GO
/****** Object:  ForeignKey [FK4046B5D9AD908856]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[therapy_management]  WITH CHECK ADD  CONSTRAINT [FK4046B5D9AD908856] FOREIGN KEY([physiotherapy_management_id])
REFERENCES [dbo].[physiotherapy_management] ([id])
GO
ALTER TABLE [dbo].[therapy_management] CHECK CONSTRAINT [FK4046B5D9AD908856]
GO
/****** Object:  ForeignKey [FK4046B5D9E4185627]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[therapy_management]  WITH CHECK ADD  CONSTRAINT [FK4046B5D9E4185627] FOREIGN KEY([occupational_therapy_management_id])
REFERENCES [dbo].[occupational_therapy_management] ([id])
GO
ALTER TABLE [dbo].[therapy_management] CHECK CONSTRAINT [FK4046B5D9E4185627]
GO
/****** Object:  ForeignKey [FK4046B5D9FA3677E5]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[therapy_management]  WITH CHECK ADD  CONSTRAINT [FK4046B5D9FA3677E5] FOREIGN KEY([speech_and_language_therapy_management_id])
REFERENCES [dbo].[speech_and_language_therapy_management] ([id])
GO
ALTER TABLE [dbo].[therapy_management] CHECK CONSTRAINT [FK4046B5D9FA3677E5]
GO
/****** Object:  ForeignKey [FKFC397878C11D709F]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[treatment]  WITH CHECK ADD  CONSTRAINT [FKFC397878C11D709F] FOREIGN KEY([care_activity_id])
REFERENCES [dbo].[care_activity] ([id])
GO
ALTER TABLE [dbo].[treatment] CHECK CONSTRAINT [FKFC397878C11D709F]
GO
/****** Object:  ForeignKey [FKFC397878FAC0C7A0]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[treatment]  WITH CHECK ADD  CONSTRAINT [FKFC397878FAC0C7A0] FOREIGN KEY([type_id])
REFERENCES [dbo].[treatment_type] ([id])
GO
ALTER TABLE [dbo].[treatment] CHECK CONSTRAINT [FKFC397878FAC0C7A0]
GO
/****** Object:  ForeignKey [FK37927CC3E96F2C]    Script Date: 07/22/2013 16:35:02 ******/
ALTER TABLE [dbo].[ward]  WITH CHECK ADD  CONSTRAINT [FK37927CC3E96F2C] FOREIGN KEY([site_id])
REFERENCES [dbo].[site] ([id])
GO
ALTER TABLE [dbo].[ward] CHECK CONSTRAINT [FK37927CC3E96F2C]
GO
