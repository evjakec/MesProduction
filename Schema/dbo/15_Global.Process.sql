USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Global].[Process](
	[ProcessId] [int] IDENTITY(1,1) NOT NULL,
	[Number] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LoopNumber] [int] NULL,  -- this will just be for reporting and not critical.  
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Process] PRIMARY KEY CLUSTERED 
(
	[ProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Global].[Process] ADD  CONSTRAINT [DF_Process_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [Global].[Process] ADD  CONSTRAINT [DF_Process_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [Global].[Process] ADD  CONSTRAINT [DF_Process_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO