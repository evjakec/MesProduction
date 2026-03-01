USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[InventoryItemAttribute](
	[InventoryItemAttributeId] [int] IDENTITY(1,1) NOT NULL,
	[InventoryItemId] [bigint] NOT NULL,
	[ItemAttributeTypeId] [int] NOT NULL,
	[AttributeValue] [varchar](1000) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_InventoryItemAttribute] PRIMARY KEY CLUSTERED 
(
	[InventoryItemAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[InventoryItemAttribute] ADD  CONSTRAINT [DF_InventoryItemAttribute_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[InventoryItemAttribute] ADD  CONSTRAINT [DF_InventoryItemAttribute_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[InventoryItemAttribute] ADD  CONSTRAINT [DF_InventoryItemAttribute_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[InventoryItemAttribute]  WITH CHECK ADD  CONSTRAINT [FK_InventoryItemAttribute_InventoryItem] FOREIGN KEY([InventoryItemId])
REFERENCES [dbo].[InventoryItem] ([InventoryItemId]) ON UPDATE NO ACTION ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[InventoryItemAttribute] CHECK CONSTRAINT [FK_InventoryItemAttribute_InventoryItem]
GO

ALTER TABLE [dbo].[InventoryItemAttribute]  WITH CHECK ADD  CONSTRAINT [FK_InventoryItemAttribute_ItemAttributeType] FOREIGN KEY([ItemAttributeTypeId])
REFERENCES [dbo].[ItemAttributeType] ([ItemAttributeTypeId])
GO

ALTER TABLE [dbo].[InventoryItemAttribute] CHECK CONSTRAINT [FK_InventoryItemAttribute_ItemAttributeType]
GO