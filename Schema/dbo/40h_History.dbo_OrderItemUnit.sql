USE [MesProduction]
GO

CREATE TABLE [History].[dbo_OrderItemUnit](
	[HistoryOrderItemUnitId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderItemUnitId] [bigint] NOT NULL,
	[OrderItemId] [int] NOT NULL,
	[PartId] [int] NOT NULL,
	[SerialNumber] [varchar](20) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_OrderItemUnit] PRIMARY KEY CLUSTERED 
(
	[HistoryOrderItemUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[dbo_OrderItemUnit] ADD  CONSTRAINT [DF_History_OrderItemUnit_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[dbo_OrderItemUnit] ADD  CONSTRAINT [DF_History_OrderItemUnit_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO
