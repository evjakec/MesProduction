USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BillOfProcessProcessWorkElementAttribute](
	[BillOfProcessProcessWorkElementAttributeId] [int] IDENTITY(1,1) NOT NULL,
	[BillOfProcessProcessWorkElementId] [int] NOT NULL,
	[WorkElementTypeAttributeId] [int] NOT NULL,
	[AttributeValue] [varchar] (4000) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BillOfProcessProcessWorkElementAttribute] PRIMARY KEY CLUSTERED 
(
	[BillOfProcessProcessWorkElementAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[BillOfProcessProcessWorkElementAttribute] ADD  CONSTRAINT [DF_BillOfProcessProcessWorkElementAttribute_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[BillOfProcessProcessWorkElementAttribute] ADD  CONSTRAINT [DF_BillOfProcessProcessWorkElementAttribute_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[BillOfProcessProcessWorkElementAttribute] ADD  CONSTRAINT [DF_BillOfProcessProcessWorkElementAttribute_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[BillOfProcessProcessWorkElementAttribute]  WITH CHECK ADD  CONSTRAINT [FK_BillOfProcessProcessWorkElementAttribute_BillOfProcessProcessWorkElement] FOREIGN KEY([BillOfProcessProcessWorkElementId])
REFERENCES [dbo].[BillOfProcessProcessWorkElement] (BillOfProcessProcessWorkElementId) ON UPDATE NO ACTION ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[BillOfProcessProcessWorkElementAttribute] CHECK CONSTRAINT [FK_BillOfProcessProcessWorkElementAttribute_BillOfProcessProcessWorkElement]
GO

ALTER TABLE [dbo].[BillOfProcessProcessWorkElementAttribute]  WITH CHECK ADD  CONSTRAINT [FK_BillOfProcessProcessWorkElementAttribute_WorkElementTypeAttribute] FOREIGN KEY([WorkElementTypeAttributeId])
REFERENCES [dbo].[WorkElementTypeAttribute] ([WorkElementTypeAttributeId])
GO

ALTER TABLE [dbo].[BillOfProcessProcessWorkElementAttribute] CHECK CONSTRAINT [FK_BillOfProcessProcessWorkElementAttribute_WorkElementTypeAttribute]
GO