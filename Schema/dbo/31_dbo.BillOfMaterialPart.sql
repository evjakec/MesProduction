USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BillOfMaterialPart](
	[BillOfMaterialPartId] [int] IDENTITY(1,1) NOT NULL,
	[BillOfMaterialId] [int] NOT NULL,
	[PartId] [int] not null,
	[Quantity] [decimal](9, 2) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BillOfMaterialPart] PRIMARY KEY CLUSTERED 
(
	[BillOfMaterialPartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[BillOfMaterialPart] ADD  CONSTRAINT [DF_BillOfMaterialPart_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[BillOfMaterialPart] ADD  CONSTRAINT [DF_BillOfMaterialPart_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[BillOfMaterialPart] ADD  CONSTRAINT [DF_BillOfMaterialPart_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[BillOfMaterialPart]  WITH CHECK ADD  CONSTRAINT [FK_BillOfMaterialPart_BillOfMaterial] FOREIGN KEY([BillOfMaterialId])
REFERENCES [dbo].[BillOfMaterial] ([BillOfMaterialId])
GO

ALTER TABLE [dbo].[BillOfMaterialPart] CHECK CONSTRAINT [FK_BillOfMaterialPart_BillOfMaterial]
GO

ALTER TABLE [dbo].[BillOfMaterialPart]  WITH CHECK ADD  CONSTRAINT [FK_BillOfMaterialPart_Part] FOREIGN KEY([PartId])
REFERENCES [dbo].[Part] ([PartId])
GO

ALTER TABLE [dbo].[BillOfMaterialPart] CHECK CONSTRAINT [FK_BillOfMaterialPart_Part]
GO