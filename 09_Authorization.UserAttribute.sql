USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Authorization].[UserAttribute](
	[UserAttributeId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UserAttributeTypeId] [int] NOT NULL,
	[UserAttributeValue] [varchar](1000) NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUtc] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserAttribute] PRIMARY KEY CLUSTERED 
(
	[UserAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Authorization].[UserAttribute] ADD  CONSTRAINT [DF_UserAttribute_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [Authorization].[UserAttribute] ADD  CONSTRAINT [DF_UserAttribute_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [Authorization].[UserAttribute] ADD  CONSTRAINT [DF_UserAttribute_LastModifiedTimeUtc]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUtc]
GO

ALTER TABLE [Authorization].[UserAttribute]  WITH CHECK ADD  CONSTRAINT [FK_UserAttribute_User] FOREIGN KEY([UserId])
REFERENCES [Authorization].[User] ([UserId])
GO

ALTER TABLE [Authorization].[UserAttribute] CHECK CONSTRAINT [FK_UserAttribute_User]
GO

ALTER TABLE [Authorization].[UserAttribute]  WITH CHECK ADD  CONSTRAINT [FK_UserAttribute_UserAttributeType] FOREIGN KEY([UserAttributeTypeId])
REFERENCES [Authorization].[UserAttributeType] ([UserAttributeTypeId])
GO

ALTER TABLE [Authorization].[UserAttribute] CHECK CONSTRAINT [FK_UserAttribute_UserAttributeType]
GO
