USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Global].[Plant](
	[PlantId] [int] IDENTITY(1,1) NOT NULL,
	[SiteId] [int] NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[DisplayName] [varchar](100) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Plant] PRIMARY KEY CLUSTERED 
(
	[PlantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Global].[Plant] ADD  CONSTRAINT [DF_Plant_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [Global].[Plant] ADD  CONSTRAINT [DF_Plant_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [Global].[Plant] ADD  CONSTRAINT [DF_Plant_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [Global].[Plant]  WITH CHECK ADD  CONSTRAINT [FK_Plant_Site] FOREIGN KEY([SiteId])
REFERENCES [Global].[Site] ([SiteId])
GO

ALTER TABLE [Global].[Plant] CHECK CONSTRAINT [FK_Plant_Site]
GO