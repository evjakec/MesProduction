USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BillOfProcessProcessWorkElement](
	[BillOfProcessProcessWorkElementId] [int] IDENTITY(1,1) NOT NULL,
	[BillOfProcessProcessId] [int] NOT NULL,
	[WorkElementTypeId] [int] NOT NULL,
	[Name] [varchar] (500) NOT NULL,
	[Sequence] [int] NOT NULL,
	[IsRequired] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BillOfProcessProcessWorkElement] PRIMARY KEY CLUSTERED 
(
	[BillOfProcessProcessWorkElementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[BillOfProcessProcessWorkElement] ADD  CONSTRAINT [DF_BillOfProcessProcessWorkElement_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [dbo].[BillOfProcessProcessWorkElement] ADD  CONSTRAINT [DF_BillOfProcessProcessWorkElement_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [dbo].[BillOfProcessProcessWorkElement] ADD  CONSTRAINT [DF_BillOfProcessProcessWorkElement_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [dbo].[BillOfProcessProcessWorkElement]  WITH CHECK ADD  CONSTRAINT [FK_BillOfProcessProcessWorkElement_BillOfProcessProcess] FOREIGN KEY([BillOfProcessProcessId])
REFERENCES [dbo].[BillOfProcessProcess] ([BillOfProcessProcessId]) ON UPDATE NO ACTION ON DELETE CASCADE 
GO

ALTER TABLE [dbo].[BillOfProcessProcessWorkElement] CHECK CONSTRAINT [FK_BillOfProcessProcessWorkElement_BillOfProcessProcess]
GO

ALTER TABLE [dbo].[BillOfProcessProcessWorkElement]  WITH CHECK ADD  CONSTRAINT [FK_BillOfProcessProcessWorkElement_WorkElementType] FOREIGN KEY([WorkElementTypeId])
REFERENCES [dbo].[WorkElementType] ([WorkElementTypeId])
GO

ALTER TABLE [dbo].[BillOfProcessProcessWorkElement] CHECK CONSTRAINT [FK_BillOfProcessProcessWorkElement_WorkElementType]
GO