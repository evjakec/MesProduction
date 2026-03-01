USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[dbo_InventoryLocation](
	[HistoryInventoryLocationId] [bigint] IDENTITY(1,1) NOT NULL,
	[InventoryLocationId] [int] NOT NULL,
	[InventoryLocationTypeId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_InventoryLocation] PRIMARY KEY CLUSTERED 
(
	[HistoryInventoryLocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[dbo_InventoryLocation] ADD  CONSTRAINT [DF_History_InventoryLocation_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[dbo_InventoryLocation] ADD  CONSTRAINT [DF_History_InventoryLocation_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO