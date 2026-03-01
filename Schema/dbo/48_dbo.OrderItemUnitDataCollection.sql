USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrderItemUnitDataCollection](
	[OrderItemUnitDataCollectionId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderItemUnitId] [bigint] NOT NULL,
	[EquipmentId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[BillOfProcessProcessWorkElementAttributeId] [int] NOT NULL,
	[CollectedValue] [varchar](1000) not null, -- expecting mostly small values here, but some buffer to be sure.  Can always expand if needed.
	[CollectedDate] [datetime2](7) NOT NULL,
	[CollectedDateUtc] [datetime2](7) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrderItemUnitDataCollection] PRIMARY KEY CLUSTERED 
(
	[OrderItemUnitDataCollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OrderItemUnitDataCollection] ADD  CONSTRAINT [DF_OrderItemUnitDataCollection_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[OrderItemUnitDataCollection] ADD  CONSTRAINT [DF_OrderItemUnitDataCollection_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[OrderItemUnitDataCollection] ADD  CONSTRAINT [DF_OrderItemUnitDataCollection_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[OrderItemUnitDataCollection]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitDataCollection_OrderItemUnit] FOREIGN KEY([OrderItemUnitId])
REFERENCES [dbo].[OrderItemUnit] ([OrderItemUnitId])
GO

ALTER TABLE [dbo].[OrderItemUnitDataCollection] CHECK CONSTRAINT [FK_OrderItemUnitDataCollection_OrderItemUnit]
GO

ALTER TABLE [dbo].[OrderItemUnitDataCollection]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitDataCollection_BillOfProcessProcessWorkElementAttribute] FOREIGN KEY([BillOfProcessProcessWorkElementAttributeId])
REFERENCES [dbo].[BillOfProcessProcessWorkElementAttribute] ([BillOfProcessProcessWorkElementAttributeId])
GO

ALTER TABLE [dbo].[OrderItemUnitDataCollection] CHECK CONSTRAINT [FK_OrderItemUnitDataCollection_BillOfProcessProcessWorkElementAttribute]
GO

ALTER TABLE [dbo].[OrderItemUnitDataCollection]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitDataCollection_GlobalEquipment] FOREIGN KEY([EquipmentId])
REFERENCES [Global].[Equipment] ([EquipmentId])
GO

ALTER TABLE [dbo].[OrderItemUnitDataCollection] CHECK CONSTRAINT [FK_OrderItemUnitDataCollection_GlobalEquipment]
GO

ALTER TABLE [dbo].[OrderItemUnitDataCollection]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitDataCollection_AuthorizationUser] FOREIGN KEY([UserId])
REFERENCES [Authorization].[User] ([UserId])
GO

ALTER TABLE [dbo].[OrderItemUnitDataCollection] CHECK CONSTRAINT [FK_OrderItemUnitDataCollection_AuthorizationUser]
GO

