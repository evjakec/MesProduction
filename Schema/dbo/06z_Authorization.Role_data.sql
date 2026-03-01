USE [MesProduction]
GO

SET IDENTITY_INSERT [Authorization].Role ON

begin tran

select * from [Authorization].Role

INSERT INTO [Authorization].[Role]
           ([RoleId]
		   ,[Name]
           ,[Description])
     VALUES
           (1, 'Administrator','Has full access to all features of the system'),
           (2, 'ViewOnly','Has view only access to all features of the system'),
           (3, 'OrderScheduler','Has access to schedule orders in the system.'),
           (4, 'ScrapUser','Has access to scrap a component in the system.'),
           (5, 'Operator','Has access to run basic work element screen functions.')

select * from [Authorization].Role

--ROLLBACK
COMMIT
SET IDENTITY_INSERT [Authorization].Role OFF


DBCC CHECKIDENT('Authorization.Role', RESEED,6)