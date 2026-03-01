USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[InventoryItemScrap](
	[InventoryItemScrapId] [bigint] IDENTITY(1,1) NOT NULL,
	[InventoryItemId] [bigint] NOT NULL,
	[DefectId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Quantity] [decimal](9,2) NOT NULL,
	[Comment] [varchar](2000) NOT NULL,
	[ScrapDate] [datetime2](7) NOT NULL,
	[ScrapDateUtc] [datetime2](7) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_InventoryItemScrap] PRIMARY KEY CLUSTERED 
(
	[InventoryItemScrapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[InventoryItemScrap] ADD  CONSTRAINT [DF_InventoryItemScrap_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[InventoryItemScrap] ADD  CONSTRAINT [DF_InventoryItemScrap_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[InventoryItemScrap] ADD  CONSTRAINT [DF_InventoryItemScrap_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[InventoryItemScrap]  WITH CHECK ADD  CONSTRAINT [FK_InventoryItemScrap_InventoryItem] FOREIGN KEY([InventoryItemId])
REFERENCES [dbo].[InventoryItem] ([InventoryItemId])
GO

ALTER TABLE [dbo].[InventoryItemScrap] CHECK CONSTRAINT [FK_InventoryItemScrap_InventoryItem]
GO

ALTER TABLE [dbo].[InventoryItemScrap]  WITH CHECK ADD  CONSTRAINT [FK_InventoryItemScrap_Defect] FOREIGN KEY([DefectId])
REFERENCES [dbo].[Defect] ([DefectId])
GO

ALTER TABLE [dbo].[InventoryItemScrap] CHECK CONSTRAINT [FK_InventoryItemScrap_Defect]
GO

ALTER TABLE [dbo].[InventoryItemScrap]  WITH CHECK ADD  CONSTRAINT [FK_InventoryItemScrap_User] FOREIGN KEY([UserId])
REFERENCES [Authorization].[User] ([UserId])
GO

ALTER TABLE [dbo].[InventoryItemScrap] CHECK CONSTRAINT [FK_InventoryItemScrap_User]
GO