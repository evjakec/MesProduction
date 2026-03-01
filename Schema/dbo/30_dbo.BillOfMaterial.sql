USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BillOfMaterial](
	[BillOfMaterialId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[PartId] [int] not null,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveStartDateUtc] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NULL,
	[EffectiveEndDateUtc] [datetime2](7) NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BillOfMaterial] PRIMARY KEY CLUSTERED 
(
	[BillOfMaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[BillOfMaterial] ADD  CONSTRAINT [DF_BillOfMaterial_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[BillOfMaterial] ADD  CONSTRAINT [DF_BillOfMaterial_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[BillOfMaterial] ADD  CONSTRAINT [DF_BillOfMaterial_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[BillOfMaterial]  WITH CHECK ADD  CONSTRAINT [FK_BillOfMaterial_Part] FOREIGN KEY([PartId])
REFERENCES [dbo].[Part] ([PartId])
GO

ALTER TABLE [dbo].[BillOfMaterial] CHECK CONSTRAINT [FK_BillOfMaterial_Part]
GO