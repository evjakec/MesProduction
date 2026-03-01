USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Global].[Coater](
	[CoaterId] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentId] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Coater] PRIMARY KEY CLUSTERED 
(
	[CoaterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Global].[Coater] ADD  CONSTRAINT [DF_Coater_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [Global].[Coater] ADD  CONSTRAINT [DF_Coater_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [Global].[Coater] ADD  CONSTRAINT [DF_Coater_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [Global].[Coater]  WITH CHECK ADD  CONSTRAINT [FK_Coater_Equipment] FOREIGN KEY([EquipmentId])
REFERENCES [Global].[Equipment] ([EquipmentId])
GO

ALTER TABLE [Global].[Coater] CHECK CONSTRAINT [FK_Coater_Equipment]