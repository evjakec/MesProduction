USE [MesProduction]
GO

SET IDENTITY_INSERT Global.Plant ON

begin tran

select * from Global.Plant


INSERT INTO [Global].[Plant]
           ([PlantId]
		   ,[SiteId]
           ,[Name]
           ,[DisplayName])
     VALUES
           (1, 1, '1', 'PHX1'),
		   (2, 2, '1', 'RWC1')
GO



select * from Global.Plant

--ROLLBACK
COMMIT
SET IDENTITY_INSERT Global.Plant OFF


DBCC CHECKIDENT('Global.Plant', RESEED,3)
