USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrderItemUnitWorkElementHistory](
	[OrderItemUnitWorkElementHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderItemUnitId] [bigint] NOT NULL,
	[BillOfProcessProcessWorkElementId] [int] NOT NULL,
	[EquipmentId] [int] NOT NULL,
	[WorkElementStatusId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[StartDateUtc] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NULL,
	[EndDateUtc] [datetime2](7) NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrderItemUnitWorkElementHistory] PRIMARY KEY CLUSTERED 
(
	[OrderItemUnitWorkElementHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OrderItemUnitWorkElementHistory] ADD  CONSTRAINT [DF_OrderItemUnitWorkElementHistory_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[OrderItemUnitWorkElementHistory] ADD  CONSTRAINT [DF_OrderItemUnitWorkElementHistory_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[OrderItemUnitWorkElementHistory] ADD  CONSTRAINT [DF_OrderItemUnitWorkElementHistory_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[OrderItemUnitWorkElementHistory]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitWorkElementHistory_OrderItemUnit] FOREIGN KEY([OrderItemUnitId])
REFERENCES [dbo].[OrderItemUnit] ([OrderItemUnitId])
GO

ALTER TABLE [dbo].[OrderItemUnitWorkElementHistory] CHECK CONSTRAINT [FK_OrderItemUnitWorkElementHistory_OrderItemUnit]
GO

ALTER TABLE [dbo].[OrderItemUnitWorkElementHistory]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitWorkElementHistory_BillOfProcessProcessWorkElement] FOREIGN KEY([BillOfProcessProcessWorkElementId])
REFERENCES [dbo].[BillOfProcessProcessWorkElement] ([BillOfProcessProcessWorkElementId])
GO

ALTER TABLE [dbo].[OrderItemUnitWorkElementHistory] CHECK CONSTRAINT [FK_OrderItemUnitWorkElementHistory_BillOfProcessProcessWorkElement]
GO

ALTER TABLE [dbo].[OrderItemUnitWorkElementHistory]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitWorkElementHistory_GlobalEquipment] FOREIGN KEY([EquipmentId])
REFERENCES [Global].[Equipment] ([EquipmentId])
GO

ALTER TABLE [dbo].[OrderItemUnitWorkElementHistory] CHECK CONSTRAINT [FK_OrderItemUnitWorkElementHistory_GlobalEquipment]
GO

ALTER TABLE [dbo].[OrderItemUnitWorkElementHistory]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitWorkElementHistory_WorkElementStatus] FOREIGN KEY([WorkElementStatusId])
REFERENCES [dbo].[WorkElementStatus] ([WorkElementStatusId])
GO

ALTER TABLE [dbo].[OrderItemUnitWorkElementHistory] CHECK CONSTRAINT [FK_OrderItemUnitWorkElementHistory_WorkElementStatus]
GO

ALTER TABLE [dbo].[OrderItemUnitWorkElementHistory]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnitWorkElementHistory_AuthorizationUser] FOREIGN KEY([UserId])
REFERENCES [Authorization].[User] ([UserId])
GO

ALTER TABLE [dbo].[OrderItemUnitWorkElementHistory] CHECK CONSTRAINT [FK_OrderItemUnitWorkElementHistory_AuthorizationUser]
GO

