USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[dbo_ContainerOrderItemUnit](
	[HistoryContainerOrderItemUnitId] [bigint] IDENTITY(1,1) NOT NULL,
	[ContainerOrderItemUnitId] [bigint] NOT NULL,
	[ContainerId] [bigint] NOT NULL,
	[OrderItemUnitId] [bigint] NOT NULL,
	[PositionOnContainer] [varchar](10) NOT NULL, -- varchar to support L\R side.  May change this later, but we'll use this for now
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_ContainerOrderItemUnit] PRIMARY KEY CLUSTERED 
(
	[HistoryContainerOrderItemUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[dbo_ContainerOrderItemUnit] ADD  CONSTRAINT [DF_History_ContainerOrderItemUnit_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[dbo_ContainerOrderItemUnit] ADD  CONSTRAINT [DF_History_ContainerOrderItemUnit_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO
