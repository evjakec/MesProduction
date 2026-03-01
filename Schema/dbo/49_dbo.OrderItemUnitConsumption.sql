USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrderItemUnitConsumption](
	[OrderItemUnitConsumptionId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderItemUnitId] [bigint] NOT NULL,
	[EquipmentId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[BillOfProcessProcessWorkElementAttributeId] [int] NOT NULL,
	[ConsumedSerialNumber] [varchar](20) not null,
	[IsConsumed] [bit] not null,
	[ConsumedDate] [datetime2](7) NOT NULL,
	[ConsumedDateUtc] [datetime2](7) NOT NULL,
	[RemovedDate] [datetime2](7) NULL,
	[RemovedDateUtc] [datetime2](7) NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrderItemUnitConsumption] PRIMARY KEY CLUSTERED 
(
	[OrderItemUnitConsumptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OrderItemUnitConsumption] ADD  CONSTRAINT [DF_OrderItemUnitConsumption_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[OrderItemUnitConsumption] ADD  CONSTRAINT [DF_OrderItemUnitConsumption_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[OrderItemUnitConsumption] ADD  CONSTRAINT [DF_OrderItemUnitConsumption_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[OrderItemUnitConsumption]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitConsumption_OrderItemUnit] FOREIGN KEY([OrderItemUnitId])
REFERENCES [dbo].[OrderItemUnit] ([OrderItemUnitId])
GO

ALTER TABLE [dbo].[OrderItemUnitConsumption] CHECK CONSTRAINT [FK_OrderItemUnitConsumption_OrderItemUnit]
GO

ALTER TABLE [dbo].[OrderItemUnitConsumption]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitConsumption_BillOfProcessProcessWorkElementAttribute] FOREIGN KEY([BillOfProcessProcessWorkElementAttributeId])
REFERENCES [dbo].[BillOfProcessProcessWorkElementAttribute] ([BillOfProcessProcessWorkElementAttributeId])
GO

ALTER TABLE [dbo].[OrderItemUnitConsumption] CHECK CONSTRAINT [FK_OrderItemUnitConsumption_BillOfProcessProcessWorkElementAttribute]
GO

ALTER TABLE [dbo].[OrderItemUnitConsumption]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitConsumption_GlobalEquipment] FOREIGN KEY([EquipmentId])
REFERENCES [Global].[Equipment] ([EquipmentId])
GO

ALTER TABLE [dbo].[OrderItemUnitConsumption] CHECK CONSTRAINT [FK_OrderItemUnitConsumption_GlobalEquipment]
GO

ALTER TABLE [dbo].[OrderItemUnitConsumption]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitConsumption_AuthorizationUser] FOREIGN KEY([UserId])
REFERENCES [Authorization].[User] ([UserId])
GO

ALTER TABLE [dbo].[OrderItemUnitConsumption] CHECK CONSTRAINT [FK_OrderItemUnitConsumption_AuthorizationUser]
GO

