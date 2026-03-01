USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [History].[dbo_Supplier](
	[HistorySupplierId] [bigint] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Address] [varchar](600) NULL,
	[PostalCode] [varchar](20) NULL,
	[City] [varchar](100) NULL,
	[StateOrProvince] [varchar](50) NULL,
	[Country] [varchar](100) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[EmailAddress] [varchar](300) NOT NULL,
	[ContactName] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_Supplier] PRIMARY KEY CLUSTERED 
(
	[HistorySupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[dbo_Supplier] ADD  CONSTRAINT [DF_History_Supplier_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[dbo_Supplier] ADD  CONSTRAINT [DF_History_Supplier_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO