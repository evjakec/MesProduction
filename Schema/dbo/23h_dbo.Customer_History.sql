USE [MesProduction]
GO

CREATE TABLE [History].[dbo_Customer](
	[HistoryCustomerId] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Address] [varchar](600) NOT NULL,
	[PostalCode] [varchar](20) NOT NULL,
	[City] [varchar](100) NOT NULL,
	[StateOrProvince] [varchar](50) NOT NULL,
	[Country] [varchar](100) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[EmailAddress] [varchar](300) NULL,
	[ContactName] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
	[HistoryAction] [char](1) NOT NULL,
	[HistoryActionBy] [varchar](50) NOT NULL,
	[HistoryActionTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_History_Customer] PRIMARY KEY CLUSTERED 
(
	[HistoryCustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [History].[dbo_Customer] ADD  CONSTRAINT [DF_History_Customer_HistoryActionBy]  DEFAULT (suser_name()) FOR [HistoryActionBy]
GO

ALTER TABLE [History].[dbo_Customer] ADD  CONSTRAINT [DF_History_Customer_HistoryActionTimeUtc]  DEFAULT (getutcdate()) FOR [HistoryActionTimeUtc]
GO


