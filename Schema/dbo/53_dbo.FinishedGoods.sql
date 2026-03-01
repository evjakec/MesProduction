USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FinishedGoods](
	[FinishedGoodsId] [bigint] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_FinishedGoods] PRIMARY KEY CLUSTERED 
(
	[FinishedGoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FinishedGoods] ADD  CONSTRAINT [DF_FinishedGoods_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[FinishedGoods] ADD  CONSTRAINT [DF_FinishedGoods_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[FinishedGoods] ADD  CONSTRAINT [DF_FinishedGoods_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[FinishedGoods]  WITH CHECK ADD  CONSTRAINT [FK_FinishedGoods_Container] FOREIGN KEY([ContainerId])
REFERENCES [dbo].[Container] ([ContainerId])
GO

ALTER TABLE [dbo].[FinishedGoods] CHECK CONSTRAINT [FK_FinishedGoods_Container]
GO