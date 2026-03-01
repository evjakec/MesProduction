USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[dbo_OrderItemUnitConsumption](
	[HistoryOrderItemUnitConsumptionId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderItemUnitConsumptionId] [bigint] NOT NULL,
	[OrderItemUnitId] [bigint] NOT NULL,
	[EquipmentId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[BillOfProcessProcessWorkElementAttributeId] [int] NOT NULL,
	[ConsumedSerialNumber] [varchar](20) not null,
	[IsConsumed] [bit] not null,
	[ConsumedDate] [datetime2](7) NOT NULL,
	[ConsumedDateUtc] [datetime2](7) NOT NULL,
	[RemovedDate] [datetime2](7) NULL,
	[RemovedDateUtc] [datetime2](7) NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_OrderItemUnitConsumption] PRIMARY KEY CLUSTERED 
(
	[HistoryOrderItemUnitConsumptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[dbo_OrderItemUnitConsumption] ADD  CONSTRAINT [DF_History_OrderItemUnitConsumption_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[dbo_OrderItemUnitConsumption] ADD  CONSTRAINT [DF_History_OrderItemUnitConsumption_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO