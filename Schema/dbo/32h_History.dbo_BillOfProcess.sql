USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[dbo_BillOfProcess](
	[HistoryBillOfProcessId] [bigint] IDENTITY(1,1) NOT NULL,
	[BillOfProcessId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[PartId] [int] NOT NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveStartDateUtc] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NULL,
	[EffectiveEndDateUtc] [datetime2](7) NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_BillOfProcess] PRIMARY KEY CLUSTERED 
(
	[HistoryBillOfProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[dbo_BillOfProcess] ADD  CONSTRAINT [DF_History_BillOfProcess_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[dbo_BillOfProcess] ADD  CONSTRAINT [DF_History_BillOfProcess_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO