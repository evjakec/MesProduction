USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[dbo_InventoryItem](
	[HistoryInventoryItemId] [bigint] IDENTITY(1,1) NOT NULL,
	[InventoryItemId] [bigint] NOT NULL,
	[InventoryItemTypeId] [int] NOT NULL,
	[InventoryLocationId] [int] NOT NULL,
	[PartId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[SerialNumber] [varchar](100) NOT NULL,
	[Quantity] [decimal](9, 2) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_InventoryItem] PRIMARY KEY CLUSTERED 
(
	[HistoryInventoryItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[dbo_InventoryItem] ADD  CONSTRAINT [DF_History_InventoryItem_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[dbo_InventoryItem] ADD  CONSTRAINT [DF_History_InventoryItem_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO