USE [MesProduction]
GO

SET IDENTITY_INSERT [dbo].[WorkElementStatus] ON

begin tran

SELECT * FROM [dbo].[WorkElementStatus]

insert into dbo.WorkElementStatus (WorkElementStatusId, Name, Description)
values (0, 'Unknown','No status has been set for this work element.'),
(1, 'In Progress','The work element has been started for an order item.'),
(2, 'Bypassed','The work element was not required and has been bypassed for an order item.  A required work element can also be bypassed by an elevated user, if authorized.'),
(3, 'Paused','The work element has been started, but not completed.  The operator or automated systems have closed the screen or loaded a different order item.'),
(4, 'Complete','The work element has been completed by an operator or automated data integration.'),
(5, 'Failed','The work element was marked failed by an operator or automated data integration.  An associated scrap record should be found for the given order item.')

SELECT * FROM [dbo].[WorkElementStatus]

--rollback
commit

SET IDENTITY_INSERT [dbo].[WorkElementStatus] OFF

DBCC CHECKIDENT('dbo.WorkElementStatus', RESEED,6)


