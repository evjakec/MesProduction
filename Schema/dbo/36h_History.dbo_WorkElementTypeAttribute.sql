USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[dbo_WorkElementTypeAttribute](
	[HistoryWorkElementTypeAttributeId] [bigint] IDENTITY(1,1) NOT NULL,
	[WorkElementTypeAttributeId] [int] NOT NULL,
	[WorkElementTypeId] [int] NOT NULL,
	[Name] [varchar] (500) NOT NULL,
	[IsRequiredAtSetup] [bit] NOT NULL,
	[IsRequiredAtRun] [bit] NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_WorkElementTypeAttribute] PRIMARY KEY CLUSTERED 
(
	[HistoryWorkElementTypeAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[dbo_WorkElementTypeAttribute] ADD  CONSTRAINT [DF_History_WorkElementTypeAttribute_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[dbo_WorkElementTypeAttribute] ADD  CONSTRAINT [DF_History_WorkElementTypeAttribute_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO