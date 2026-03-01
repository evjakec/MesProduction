USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ContainerOrderItemUnit](
	[ContainerOrderItemUnitId] [bigint] IDENTITY(1,1) NOT NULL,
	[ContainerId] [bigint] NOT NULL,
	[OrderItemUnitId] [bigint] NOT NULL,
	[PositionOnContainer] [varchar](10) NOT NULL, -- varchar to support L\R side.  May change this later, but we'll use this for now
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContainerOrderItemUnit] PRIMARY KEY CLUSTERED 
(
	[ContainerOrderItemUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ContainerOrderItemUnit] ADD  CONSTRAINT [DF_ContainerOrderItemUnit_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[ContainerOrderItemUnit] ADD  CONSTRAINT [DF_ContainerOrderItemUnit_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[ContainerOrderItemUnit] ADD  CONSTRAINT [DF_ContainerOrderItemUnit_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[ContainerOrderItemUnit]  WITH CHECK ADD  CONSTRAINT [FK_ContainerOrderItemUnit_Container] FOREIGN KEY([ContainerId])
REFERENCES [dbo].[Container] ([ContainerId]) 
GO

ALTER TABLE [dbo].[ContainerOrderItemUnit] CHECK CONSTRAINT [FK_ContainerOrderItemUnit_Container]
GO

ALTER TABLE [dbo].[ContainerOrderItemUnit]  WITH CHECK ADD  CONSTRAINT [FK_ContainerOrderItemUnit_OrderItemUnit] FOREIGN KEY([OrderItemUnitId])
REFERENCES [dbo].[OrderItemUnit] ([OrderItemUnitId]) 
GO

ALTER TABLE [dbo].[ContainerOrderItemUnit] CHECK CONSTRAINT [FK_ContainerOrderItemUnit_OrderItemUnit]
GO
