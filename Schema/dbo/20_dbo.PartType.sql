USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PartType](
	[PartTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PartType] PRIMARY KEY CLUSTERED 
(
	[PartTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PartType] ADD  CONSTRAINT [DF_PartType_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[PartType] ADD  CONSTRAINT [DF_PartType_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[PartType] ADD  CONSTRAINT [DF_PartType_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO
