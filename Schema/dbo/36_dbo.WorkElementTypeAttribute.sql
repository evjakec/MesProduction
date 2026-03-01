USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WorkElementTypeAttribute](
	[WorkElementTypeAttributeId] [int] IDENTITY(1,1) NOT NULL,
	[WorkElementTypeId] [int] NOT NULL,
	[Name] [varchar] (500) NOT NULL,
	[IsRequiredAtSetup] [bit] NOT NULL,
	[IsRequiredAtRun] [bit] NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_WorkElementTypeAttribute] PRIMARY KEY CLUSTERED 
(
	[WorkElementTypeAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[WorkElementTypeAttribute] ADD  CONSTRAINT [DF_WorkElementTypeAttribute_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[WorkElementTypeAttribute] ADD  CONSTRAINT [DF_WorkElementTypeAttribute_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[WorkElementTypeAttribute] ADD  CONSTRAINT [DF_WorkElementTypeAttribute_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[WorkElementTypeAttribute]  WITH CHECK ADD  CONSTRAINT [FK_WorkElementTypeAttribute_WorkElementType] FOREIGN KEY([WorkElementTypeId])
REFERENCES [dbo].[WorkElementType] ([WorkElementTypeId])
GO

ALTER TABLE [dbo].[WorkElementTypeAttribute] CHECK CONSTRAINT [FK_WorkElementTypeAttribute_WorkElementType]
GO