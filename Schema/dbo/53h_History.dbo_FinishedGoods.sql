USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[dbo_FinishedGoods](
	[HistoryFinishedGoodsId] [bigint] IDENTITY(1,1) NOT NULL,
	[FinishedGoodsId] [bigint] NOT NULL,
	[ContainerId] [bigint] NOT NULL,
	[ContainerQuantityAtTransactionDate] [int] not null,
	[IsReturnedToProduction] [bit] not null,
	[TransactionDate] [datetime2](7) NOT NULL,
	[TransactionDateUtc] [datetime2](7) NOT NULL,
	[ReturnToProductionDate] [datetime2](7) NULL,
	[ReturnToProductionDateUtc] [datetime2](7) NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_FinishedGoods] PRIMARY KEY CLUSTERED 
(
	[HistoryFinishedGoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[dbo_FinishedGoods] ADD  CONSTRAINT [DF_History_FinishedGoods_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[dbo_FinishedGoods] ADD  CONSTRAINT [DF_History_FinishedGoods_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO