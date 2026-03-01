USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[InventoryItem](
	[InventoryItemId] [bigint] IDENTITY(1,1) NOT NULL,
	[InventoryItemTypeId] [int] NOT NULL,
	[InventoryLocationId] [int] NOT NULL,
	[PartId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[SerialNumber] [varchar](100) NOT NULL,
	[Quantity] [decimal](9, 2) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_InventoryItem] PRIMARY KEY CLUSTERED 
(
	[InventoryItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[InventoryItem] ADD  CONSTRAINT [DF_InventoryItem_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[InventoryItem] ADD  CONSTRAINT [DF_InventoryItem_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[InventoryItem] ADD  CONSTRAINT [DF_InventoryItem_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[InventoryItem]  WITH CHECK ADD  CONSTRAINT [FK_InventoryItem_InventoryItemType] FOREIGN KEY([InventoryItemTypeId])
REFERENCES [dbo].[InventoryItemType] ([InventoryItemTypeId]) ON UPDATE NO ACTION ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[InventoryItem] CHECK CONSTRAINT [FK_InventoryItem_InventoryItemType]
GO

ALTER TABLE [dbo].[InventoryItem]  WITH CHECK ADD  CONSTRAINT [FK_InventoryItem_InventoryLocation] FOREIGN KEY([InventoryLocationId])
REFERENCES [dbo].[InventoryLocation] ([InventoryLocationId]) ON UPDATE NO ACTION ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[InventoryItem] CHECK CONSTRAINT [FK_InventoryItem_InventoryLocation]
GO

ALTER TABLE [dbo].[InventoryItem]  WITH CHECK ADD  CONSTRAINT [FK_InventoryItem_Part] FOREIGN KEY([PartId])
REFERENCES [dbo].[Part] ([PartId]) ON UPDATE NO ACTION ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[InventoryItem] CHECK CONSTRAINT [FK_InventoryItem_Part]
GO

ALTER TABLE [dbo].[InventoryItem]  WITH CHECK ADD  CONSTRAINT [FK_InventoryItem_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId]) ON UPDATE NO ACTION ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[InventoryItem] CHECK CONSTRAINT [FK_InventoryItem_Supplier]
GO
