USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[dbo_Part](
	[HistoryPartId] [bigint] IDENTITY(1,1) NOT NULL,
	[PartId] [int] NOT NULL,
	[PartTypeId] TINYINT NOT NULL,
	[PartNumber] [varchar](20) NOT NULL,
	[PartRevision] [char](1) not null,
	[Description] [varchar](1000) not null,
	[UnitOfMeasureId] TINYINT NOT NULL,
	[IsActive] [bit] not null,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_Part] PRIMARY KEY CLUSTERED 
(
	[HistoryPartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[dbo_Part] ADD  CONSTRAINT [DF_History_Part_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[dbo_Part] ADD  CONSTRAINT [DF_History_Part_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO