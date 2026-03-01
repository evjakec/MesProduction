USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Global].[Unit](
	[UnitId] [int] IDENTITY(1,1) NOT NULL,
	[PlantId] [int] NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[DisplayName] [varchar](100) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Global].[Unit] ADD  CONSTRAINT [DF_Unit_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [Global].[Unit] ADD  CONSTRAINT [DF_Unit_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [Global].[Unit] ADD  CONSTRAINT [DF_Unit_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [Global].[Unit]  WITH CHECK ADD  CONSTRAINT [FK_Unit_Plant] FOREIGN KEY([PlantId])
REFERENCES [Global].[Plant] ([PlantId])
GO

ALTER TABLE [Global].[Unit] CHECK CONSTRAINT [FK_Unit_Plant]
GO