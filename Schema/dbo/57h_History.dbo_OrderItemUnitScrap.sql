USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[dbo_OrderItemUnitScrap](
	[HistoryOrderItemUnitScrapId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderItemUnitScrapId] [bigint] NOT NULL,
	[OrderItemUnitId] [bigint] NOT NULL,
	[EquipmentId] [int] NOT NULL,
	[DefectId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Comment] [varchar](2000) NOT NULL,
	[ScrapDate] [datetime2](7) NOT NULL,
	[ScrapDateUtc] [datetime2](7) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_OrderItemUnitScrap] PRIMARY KEY CLUSTERED 
(
	[HistoryOrderItemUnitScrapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[dbo_OrderItemUnitScrap] ADD  CONSTRAINT [DF_History_OrderItemUnitScrap_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[dbo_OrderItemUnitScrap] ADD  CONSTRAINT [DF_History_OrderItemUnitScrap_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO