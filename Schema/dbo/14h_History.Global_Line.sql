USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[Global_Line](
	[HistoryLineId] [bigint] IDENTITY(1,1) NOT NULL,
	[LineId] [int] NOT NULL,
	[UnitId] [int] NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[DisplayName] [varchar](100) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_Line] PRIMARY KEY CLUSTERED 
(
	[HistoryLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[Global_Line] ADD  CONSTRAINT [DF_History_Line_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[Global_Line] ADD  CONSTRAINT [DF_History_Line_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO