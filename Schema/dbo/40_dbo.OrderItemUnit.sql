USE [MesProduction]
GO

CREATE TABLE [dbo].[OrderItemUnit](
	[OrderItemUnitId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderItemId] [int] NOT NULL,
	[PartId] [int] NOT NULL,
	[SerialNumber] [varchar](20) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrderItemUnit] PRIMARY KEY CLUSTERED 
(
	[OrderItemUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OrderItemUnit] ADD  CONSTRAINT [DF_OrderItemUnit_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[OrderItemUnit] ADD  CONSTRAINT [DF_OrderItemUnit_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[OrderItemUnit] ADD  CONSTRAINT [DF_OrderItemUnit_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[OrderItemUnit]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnit_OrderItem] FOREIGN KEY([OrderItemId])
REFERENCES [dbo].[OrderItem] ([OrderItemId])
GO

ALTER TABLE [dbo].[OrderItemUnit] CHECK CONSTRAINT [FK_OrderItemUnit_OrderItem]
GO

ALTER TABLE [dbo].[OrderItemUnit]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemUnit_Part] FOREIGN KEY([PartId])
REFERENCES [dbo].[Part] ([PartId])
GO

ALTER TABLE [dbo].[OrderItemUnit] CHECK CONSTRAINT [FK_OrderItemUnit_Part]
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_OrderItemUnit_SerialNumber] ON [dbo].[OrderItemUnit]
(
	[SerialNumber] ASC
)
INCLUDE([OrderItemUnitId],[OrderItemId],[PartId],[LastModifiedTime],[LastModifiedTimeUtc]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
GO
