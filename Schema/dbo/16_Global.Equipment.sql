USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Global].[Equipment](
	[EquipmentId] [int] IDENTITY(1,1) NOT NULL,
	[LineId] [int] NOT NULL,
	[ProcessId] [int] NOT NULL,
	[Name] [varchar](60) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[EquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Global].[Equipment] ADD  CONSTRAINT [DF_Equipment_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [Global].[Equipment] ADD  CONSTRAINT [DF_Equipment_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [Global].[Equipment] ADD  CONSTRAINT [DF_Equipment_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [Global].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Line] FOREIGN KEY([LineId])
REFERENCES [Global].[Line] ([LineId])
GO

ALTER TABLE [Global].[Equipment] CHECK CONSTRAINT [FK_Equipment_Line]
GO

ALTER TABLE [Global].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Process] FOREIGN KEY([ProcessId])
REFERENCES [Global].[Process] ([ProcessId])
GO

ALTER TABLE [Global].[Equipment] CHECK CONSTRAINT [FK_Equipment_Process]
GO