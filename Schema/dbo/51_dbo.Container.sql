USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Container](
	[ContainerId] [bigint] IDENTITY(1,1) NOT NULL,
	[ContainerTypeId] [int] NOT NULL,
	[InventoryLocationId] [int] NOT NULL,
	[SerialNumber] [varchar](100) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Container] PRIMARY KEY CLUSTERED 
(
	[ContainerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Container] ADD  CONSTRAINT [DF_Container_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[Container] ADD  CONSTRAINT [DF_Container_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[Container] ADD  CONSTRAINT [DF_Container_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[Container]  WITH CHECK ADD  CONSTRAINT [FK_Container_ContainerType] FOREIGN KEY([ContainerTypeId])
REFERENCES [dbo].[ContainerType] ([ContainerTypeId]) ON UPDATE NO ACTION ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[Container] CHECK CONSTRAINT [FK_Container_ContainerType]
GO

ALTER TABLE [dbo].[Container]  WITH CHECK ADD  CONSTRAINT [FK_Container_InventoryLocation] FOREIGN KEY([InventoryLocationId])
REFERENCES [dbo].[InventoryLocation] ([InventoryLocationId]) ON UPDATE NO ACTION ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[Container] CHECK CONSTRAINT [FK_Container_InventoryLocation]
GO
