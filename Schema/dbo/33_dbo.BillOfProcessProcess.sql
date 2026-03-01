USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BillOfProcessProcess](
	[BillOfProcessProcessId] [int] IDENTITY(1,1) NOT NULL,
	[BillOfProcessId] [int] NOT NULL,
	[ProcessId] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BillOfProcessProcess] PRIMARY KEY CLUSTERED 
(
	[BillOfProcessProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[BillOfProcessProcess] ADD  CONSTRAINT [DF_BillOfProcessProcess_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[BillOfProcessProcess] ADD  CONSTRAINT [DF_BillOfProcessProcess_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[BillOfProcessProcess] ADD  CONSTRAINT [DF_BillOfProcessProcess_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[BillOfProcessProcess]  WITH CHECK ADD  CONSTRAINT [FK_BillOfProcessProcess_BillOfProcess] FOREIGN KEY([BillOfProcessId])
REFERENCES [dbo].[BillOfProcess] ([BillOfProcessId])
GO

ALTER TABLE [dbo].[BillOfProcessProcess] CHECK CONSTRAINT [FK_BillOfProcessProcess_BillOfProcess]
GO

ALTER TABLE [dbo].[BillOfProcessProcess]  WITH CHECK ADD  CONSTRAINT [FK_BillOfProcessProcess_Process] FOREIGN KEY([ProcessId])
REFERENCES [Global].[Process] ([ProcessId])
GO

ALTER TABLE [dbo].[BillOfProcessProcess] CHECK CONSTRAINT [FK_BillOfProcessProcess_Process]
GO