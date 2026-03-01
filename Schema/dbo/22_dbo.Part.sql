USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Part](
	[PartId] [int] IDENTITY(1,1) NOT NULL,
	[PartTypeId] TINYINT NOT NULL,
	[PartNumber] [varchar](20) NOT NULL,
	[PartRevision] [char](1) not null,
	[Description] [varchar](1000) not null,
	[UnitOfMeasureId] TINYINT NOT NULL,
	[IsActive] [bit] not null,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Part] PRIMARY KEY CLUSTERED 
(
	[PartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Part] ADD  CONSTRAINT [DF_Part_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[Part] ADD  CONSTRAINT [DF_Part_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[Part] ADD  CONSTRAINT [DF_Part_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[Part]  WITH CHECK ADD  CONSTRAINT [FK_Part_PartType] FOREIGN KEY([PartTypeId])
REFERENCES [dbo].[PartType] ([PartTypeId])
GO

ALTER TABLE [dbo].[Part] CHECK CONSTRAINT [FK_Part_PartType]
GO

ALTER TABLE [dbo].[Part]  WITH CHECK ADD  CONSTRAINT [FK_Part_UnitOfMeasure] FOREIGN KEY([UnitOfMeasureId])
REFERENCES [dbo].[UnitOfMeasure] ([UnitOfMeasureId])
GO

ALTER TABLE [dbo].[Part] CHECK CONSTRAINT [FK_Part_UnitOfMeasure]
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_Part_PartNumber_PartRevision] ON [dbo].[Part]
(
	[PartNumber] ASC,
	[PartRevision] ASC
)
INCLUDE([PartId],[PartTypeId],[Description],[UnitOfMeasureId],[IsActive],[LastModifiedBy],[LastModifiedTime],[LastModifiedTimeUtc]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)

GO