USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrderItemUnitScrap](
	[OrderItemUnitScrapId] [bigint] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_OrderItemUnitScrap] PRIMARY KEY CLUSTERED 
(
	[OrderItemUnitScrapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OrderItemUnitScrap] ADD  CONSTRAINT [DF_OrderItemUnitScrap_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[OrderItemUnitScrap] ADD  CONSTRAINT [DF_OrderItemUnitScrap_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[OrderItemUnitScrap] ADD  CONSTRAINT [DF_OrderItemUnitScrap_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[OrderItemUnitScrap]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitScrap_OrderItemUnit] FOREIGN KEY([OrderItemUnitId])
REFERENCES [dbo].[OrderItemUnit] ([OrderItemUnitId])
GO

ALTER TABLE [dbo].[OrderItemUnitScrap] CHECK CONSTRAINT [FK_OrderItemUnitScrap_OrderItemUnit]
GO

ALTER TABLE [dbo].[OrderItemUnitScrap]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitScrap_Equipment] FOREIGN KEY([EquipmentId])
REFERENCES [Global].[Equipment] ([EquipmentId])
GO

ALTER TABLE [dbo].[OrderItemUnitScrap] CHECK CONSTRAINT [FK_OrderItemUnitScrap_Equipment]
GO

ALTER TABLE [dbo].[OrderItemUnitScrap]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitScrap_Defect] FOREIGN KEY([DefectId])
REFERENCES [dbo].[Defect] ([DefectId])
GO

ALTER TABLE [dbo].[OrderItemUnitScrap] CHECK CONSTRAINT [FK_OrderItemUnitScrap_Defect]
GO

ALTER TABLE [dbo].[OrderItemUnitScrap]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitScrap_User] FOREIGN KEY([UserId])
REFERENCES [Authorization].[User] ([UserId])
GO

ALTER TABLE [dbo].[OrderItemUnitScrap] CHECK CONSTRAINT [FK_OrderItemUnitScrap_User]
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_OrderItemUnitScrap_OrderItemUnitId] ON [dbo].[OrderItemUnitScrap]
(
	[OrderItemUnitId] ASC
)
INCLUDE([OrderItemUnitScrapId],[EquipmentId],[DefectId],[UserId],[Comment],[ScrapDate],[ScrapDateUtc],[LastModifiedBy],[LastModifiedTime],[LastModifiedTimeUtc]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)

GO