USE [MesProduction]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Equipment].[StateChange](
	[StateChangeId] [bigint] IDENTITY(1,1) NOT NULL,
	[EquipmentId] [bigint] NOT NULL,
	[EquipmentName] [varchar](50) NOT NULL,
	[StateChangeTime] [datetime2](7) NOT NULL,
	[StateChangeTimeUTC] [datetime2](7) NOT NULL,
	[CurrentStateId] [int] NOT NULL,
	[PreviousStateId] [int] NOT NULL,
	[PreviousStateTimeInSeconds] [int] NOT NULL,
	[LastModifiedBy] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime2](7) NOT NULL,
	[LastModifiedTimeUTC] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_StateChange] PRIMARY KEY CLUSTERED 
(
	[StateChangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Equipment].[StateChange] ADD  CONSTRAINT [DF_StateChange_LastModifiedBy]  DEFAULT (suser_name()) FOR [LastModifiedBy]
GO

ALTER TABLE [Equipment].[StateChange] ADD  CONSTRAINT [DF_StateChange_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO

ALTER TABLE [Equipment].[StateChange] ADD  CONSTRAINT [DF_StateChange_LastModifiedTimeUTC]  DEFAULT (getutcdate()) FOR [LastModifiedTimeUTC]
GO

ALTER TABLE [Equipment].[StateChange]  WITH CHECK ADD  CONSTRAINT [FK_StateChangeCurrent_State] FOREIGN KEY([CurrentStateId])
REFERENCES [Equipment].[State] ([StateId])
GO

ALTER TABLE [Equipment].[StateChange] CHECK CONSTRAINT [FK_StateChangeCurrent_State]
GO

ALTER TABLE [Equipment].[StateChange]  WITH CHECK ADD  CONSTRAINT [FK_StateChangePrevious_State] FOREIGN KEY([PreviousStateId])
REFERENCES [Equipment].[State] ([StateId])
GO

ALTER TABLE [Equipment].[StateChange] CHECK CONSTRAINT [FK_StateChangePrevious_State]
GO