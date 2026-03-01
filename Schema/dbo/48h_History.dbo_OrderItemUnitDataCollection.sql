USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[dbo_OrderItemUnitDataCollection](
	[HistoryOrderItemUnitDataCollectionId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderItemUnitDataCollectionId] [bigint] NOT NULL,
	[OrderItemUnitId] [bigint] NOT NULL,
	[EquipmentId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[BillOfProcessProcessWorkElementAttributeId] [int] NOT NULL,
	[CollectedValue] [varchar](1000) not null, -- expecting mostly small values here, but some buffer to be sure.  Can always expand if needed.
	[CollectedDate] [datetime2](7) NOT NULL,
	[CollectedDateUtc] [datetime2](7) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_OrderItemUnitDataCollection] PRIMARY KEY CLUSTERED 
(
	[HistoryOrderItemUnitDataCollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[dbo_OrderItemUnitDataCollection] ADD  CONSTRAINT [DF_History_OrderItemUnitDataCollection_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[dbo_OrderItemUnitDataCollection] ADD  CONSTRAINT [DF_History_OrderItemUnitDataCollection_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO