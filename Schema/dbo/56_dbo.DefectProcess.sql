USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DefectProcess](
	[DefectProcessId] [int] IDENTITY(1,1) NOT NULL,
	[DefectId] [int] NOT NULL,
	[ProcessId] [int] NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_DefectProcess] PRIMARY KEY CLUSTERED 
(
	[DefectProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DefectProcess] ADD  CONSTRAINT [DF_DefectProcess_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[DefectProcess] ADD  CONSTRAINT [DF_DefectProcess_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[DefectProcess] ADD  CONSTRAINT [DF_DefectProcess_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[DefectProcess]  WITH CHECK ADD  CONSTRAINT [FK_DefectProcess_Defect] FOREIGN KEY([DefectId])
REFERENCES [dbo].[Defect] ([DefectId]) ON UPDATE NO ACTION ON DELETE CASCADE
GO

ALTER TABLE [dbo].[DefectProcess] CHECK CONSTRAINT [FK_DefectProcess_Defect]
GO

ALTER TABLE [dbo].[DefectProcess]  WITH CHECK ADD  CONSTRAINT [FK_DefectProcess_Process] FOREIGN KEY([ProcessId])
REFERENCES [Global].[Process] ([ProcessId]) ON UPDATE NO ACTION ON DELETE CASCADE
GO

ALTER TABLE [dbo].[DefectProcess] CHECK CONSTRAINT [FK_DefectProcess_Process]
GO