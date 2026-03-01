USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Defect](
	[DefectId] [int] IDENTITY(1,1) NOT NULL,
	[DefectCategoryId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsReworkable] [bit] NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Defect] PRIMARY KEY CLUSTERED 
(
	[DefectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Defect] ADD  CONSTRAINT [DF_Defect_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[Defect] ADD  CONSTRAINT [DF_Defect_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[Defect] ADD  CONSTRAINT [DF_Defect_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[Defect]  WITH CHECK ADD  CONSTRAINT [FK_Defect_DefectCategory] FOREIGN KEY([DefectCategoryId])
REFERENCES [dbo].[DefectCategory] ([DefectCategoryId])
GO

ALTER TABLE [dbo].[Defect] CHECK CONSTRAINT [FK_Defect_DefectCategory]
GO