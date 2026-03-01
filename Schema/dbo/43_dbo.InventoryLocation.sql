USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[InventoryLocation](
	[InventoryLocationId] [int] IDENTITY(1,1) NOT NULL,
	[InventoryLocationTypeId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_InventoryLocation] PRIMARY KEY CLUSTERED 
(
	[InventoryLocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[InventoryLocation] ADD  CONSTRAINT [DF_InventoryLocation_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[InventoryLocation] ADD  CONSTRAINT [DF_InventoryLocation_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[InventoryLocation] ADD  CONSTRAINT [DF_InventoryLocation_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[InventoryLocation]  WITH CHECK ADD  CONSTRAINT [FK_InventoryLocation_InventoryLocationType] FOREIGN KEY([InventoryLocationTypeId])
REFERENCES [dbo].[InventoryLocationType] ([InventoryLocationTypeId]) ON UPDATE NO ACTION ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[InventoryLocation] CHECK CONSTRAINT [FK_InventoryLocation_InventoryLocationType]
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_InventoryLocation_Name] ON [dbo].[InventoryLocation]
(
	[Name] ASC
)
INCLUDE([InventoryLocationId],[InventoryLocationTypeId],[LastModifiedBy],[LastModifiedTime],[LastModifiedTimeUtc]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)

GO