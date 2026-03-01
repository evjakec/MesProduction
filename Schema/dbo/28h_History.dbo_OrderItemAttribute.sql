USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[dbo_OrderItemAttribute](
	[HistoryOrderItemAttributeId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderItemAttributeId] [int] NOT NULL,
	[OrderItemId] [int] NOT NULL,
	[ItemAttributeTypeId] [int] NOT NULL,
	[AttributeValue] [varchar](1000) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_OrderItemAttribute] PRIMARY KEY CLUSTERED 
(
	[HistoryOrderItemAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[dbo_OrderItemAttribute] ADD  CONSTRAINT [DF_History_OrderItemAttribute_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[dbo_OrderItemAttribute] ADD  CONSTRAINT [DF_History_OrderItemAttribute_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO