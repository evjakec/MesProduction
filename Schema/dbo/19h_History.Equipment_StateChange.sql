USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[Equipment_StateChange](
	[HistoryStateChangeId] [bigint] IDENTITY(1,1) NOT NULL,
	[StateChangeId] [bigint] NOT NULL,
	[EquipmentId] [bigint] NOT NULL,
	[EquipmentName] [varchar](50) NOT NULL,
	[StateChangeTime] [datetime2](7) NOT NULL,
	[StateChangeTimeUTC] [datetime2](7) NOT NULL,
	[CurrentStateId] [int] NOT NULL,
	[PreviousStateId] [int] NOT NULL,
	[PreviousStateTimeInSeconds] [int] NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUTC] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_StateChange] PRIMARY KEY CLUSTERED 
(
	[HistoryStateChangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[Equipment_StateChange] ADD  CONSTRAINT [DF_History_StateChange_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[Equipment_StateChange] ADD  CONSTRAINT [DF_History_StateChange_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO