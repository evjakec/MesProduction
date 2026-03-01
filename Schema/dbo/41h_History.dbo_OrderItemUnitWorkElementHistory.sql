USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[dbo_OrderItemUnitWorkElementHistory](
	[HistoryOrderItemUnitWorkElementHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderItemUnitWorkElementHistoryId] [bigint] NOT NULL,
	[OrderItemUnitId] [bigint] NOT NULL,
	[BillOfProcessProcessWorkElementId] [int] NOT NULL,
	[EquipmentId] [int] NOT NULL,
	[WorkElementStatusId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[StartDateUtc] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NULL,
	[EndDateUtc] [datetime2](7) NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_OrderItemUnitWorkElementHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryOrderItemUnitWorkElementHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[dbo_OrderItemUnitWorkElementHistory] ADD  CONSTRAINT [DF_History_OrderItemUnitWorkElementHistory_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[dbo_OrderItemUnitWorkElementHistory] ADD  CONSTRAINT [DF_History_OrderItemUnitWorkElementHistory_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO