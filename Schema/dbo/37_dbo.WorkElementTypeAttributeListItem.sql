USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WorkElementTypeAttributeListItem](
	[WorkElementTypeAttributeListItemId] [int] IDENTITY(1,1) NOT NULL,
	[WorkElementTypeAttributeId] [int] NOT NULL,
	[Name] [varchar] (100) NOT NULL,
	[Description] [varchar] (1000) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_WorkElementTypeAttributeListItem] PRIMARY KEY CLUSTERED 
(
	[WorkElementTypeAttributeListItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[WorkElementTypeAttributeListItem] ADD  CONSTRAINT [DF_WorkElementTypeAttributeListItem_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[WorkElementTypeAttributeListItem] ADD  CONSTRAINT [DF_WorkElementTypeAttributeListItem_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[WorkElementTypeAttributeListItem] ADD  CONSTRAINT [DF_WorkElementTypeAttributeListItem_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[WorkElementTypeAttributeListItem]  WITH CHECK ADD  CONSTRAINT [FK_WorkElementTypeAttributeListItem_WorkElementTypeAttribute] FOREIGN KEY([WorkElementTypeAttributeId])
REFERENCES [dbo].[WorkElementTypeAttribute] ([WorkElementTypeAttributeId])
GO

ALTER TABLE [dbo].[WorkElementTypeAttributeListItem] CHECK CONSTRAINT [FK_WorkElementTypeAttributeListItem_WorkElementTypeAttribute]
GO