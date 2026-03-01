USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrderItemAttribute](
	[OrderItemAttributeId] [int] IDENTITY(1,1) NOT NULL,
	[OrderItemId] [int] NOT NULL,
	[ItemAttributeTypeId] [int] NOT NULL,
	[AttributeValue] [varchar](1000) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrderItemAttribute] PRIMARY KEY CLUSTERED 
(
	[OrderItemAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OrderItemAttribute] ADD  CONSTRAINT [DF_OrderItemAttribute_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[OrderItemAttribute] ADD  CONSTRAINT [DF_OrderItemAttribute_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[OrderItemAttribute] ADD  CONSTRAINT [DF_OrderItemAttribute_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[OrderItemAttribute]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemAttribute_OrderItem] FOREIGN KEY([OrderItemId])
REFERENCES [dbo].[OrderItem] ([OrderItemId])
GO

ALTER TABLE [dbo].[OrderItemAttribute] CHECK CONSTRAINT [FK_OrderItemAttribute_OrderItem]
GO

ALTER TABLE [dbo].[OrderItemAttribute]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemAttribute_ItemAttributeType] FOREIGN KEY([ItemAttributeTypeId])
REFERENCES [dbo].[ItemAttributeType] ([ItemAttributeTypeId])
GO

ALTER TABLE [dbo].[OrderItemAttribute] CHECK CONSTRAINT [FK_OrderItemAttribute_ItemAttributeType]
GO