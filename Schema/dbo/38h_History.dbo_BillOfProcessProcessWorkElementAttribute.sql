USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[dbo_BillOfProcessProcessWorkElementAttribute](
	[HistoryBillOfProcessProcessWorkElementAttributeId] [bigint] IDENTITY(1,1) NOT NULL,
	[BillOfProcessProcessWorkElementAttributeId] [int] NOT NULL,
	[BillOfProcessProcessWorkElementId] [int] NOT NULL,
	[WorkElementTypeAttributeId] [int] NOT NULL,
	[AttributeValue] [varchar] (4000) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_BillOfProcessProcessWorkElementAttribute] PRIMARY KEY CLUSTERED 
(
	[HistoryBillOfProcessProcessWorkElementAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[dbo_BillOfProcessProcessWorkElementAttribute] ADD  CONSTRAINT [DF_History_BillOfProcessProcessWorkElementAttribute_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[dbo_BillOfProcessProcessWorkElementAttribute] ADD  CONSTRAINT [DF_History_BillOfProcessProcessWorkElementAttribute_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO