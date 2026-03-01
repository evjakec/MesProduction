USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PartItemAttributeType](
	[PartItemAttributeTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PartId] [int] NOT NULL,
	[ItemAttributeTypeId] [int] NOT NULL,
	[IsRequired] BIT NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PartItemAttributeType] PRIMARY KEY CLUSTERED 
(
	[PartItemAttributeTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PartItemAttributeType] ADD  CONSTRAINT [DF_PartItemAttributeType_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[PartItemAttributeType] ADD  CONSTRAINT [DF_PartItemAttributeType_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[PartItemAttributeType] ADD  CONSTRAINT [DF_PartItemAttributeType_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[PartItemAttributeType]  WITH CHECK ADD  CONSTRAINT [FK_PartItemAttributeType_Part] FOREIGN KEY([PartId])
REFERENCES [dbo].[Part] ([PartId])
GO

ALTER TABLE [dbo].[PartItemAttributeType] CHECK CONSTRAINT [FK_PartItemAttributeType_Part]
GO

ALTER TABLE [dbo].[PartItemAttributeType]  WITH CHECK ADD  CONSTRAINT [FK_PartItemAttributeType_ItemAttributeType] FOREIGN KEY([ItemAttributeTypeId])
REFERENCES [dbo].[ItemAttributeType] ([ItemAttributeTypeId])
GO

ALTER TABLE [dbo].[PartItemAttributeType] CHECK CONSTRAINT [FK_PartItemAttributeType_ItemAttributeType]
GO

CREATE UNIQUE NONCLUSTERED INDEX [UIX_PartItemAttributeType_PartId_ItemAttributeTypeId] ON [dbo].[PartItemAttributeType]
(
	[PartId] ASC,
	[ItemAttributeTypeId] ASC
)
INCLUDE([PartItemAttributeTypeId],[IsRequired],[LastModifiedTime],[LastModifiedTimeUtc]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)

GO